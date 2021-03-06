#!/usr/bin/perl
# $Source: /my/perl/script/kwextract.pl,v$
# $mutable /.brings/system/bin/kwextract.pl$
# $Previous: QmPbNezoXD6PBFaJvDxG1mYvkNoZvVckPejfHFam8ptzKr$
# $tic: 1575654442$

our $dbug=0;
#--------------------------------
# -- Options parsing ...
#
my $yml = 0;
while (@ARGV && $ARGV[0] =~ m/^-/)
{
  $_ = shift;
  #/^-(l|r|i|s)(\d+)/ && (eval "\$$1 = \$2", next);
  if (/^-d(?:e?bug)?/) { $dbug= 1; }
  elsif (/^-k(?:ey)?+(\w+)?$/) { $key= $1 ? "$1" : shift || 'source' }
  elsif (/^-y(?:ml)?/) { $yml= 1; }
  else                  { die "Unrecognized switch: $_\n"; }

}
#understand variable=value on the command line...
eval "\$$1='$2'"while $ARGV[0] =~ /^(\w+)=(.*)/ && shift;


my $keywords = {};
my $file=shift;
if (-e $file) {
   # extraction of RCS keyword source
   open F,'<',$file; local $/ = undef;
   my $buf = <F>; $buf =~ s/\$qm: .*\s*\$/\$qm: ~\$/;
   my $qm = 'z'.&encode_base58(pack('H4','01551220').&hashr('SHA256',1,$buf));
	 $keywords->{qm} = $qm;
   seek(F,0,0);
   $/ = "\n";
   while (<F>) {
      # ex: "$Source: ", "$Previous: "
      if (m/\$([A-Z]\w+|qm|mutable):\s*([^\$"]*?)\s*\$(?:["']|[^\w])?/) {
         printf "RCSkeyword: %s %s\n",$1,$2 if $dbug;
         my $keyw=lc($1); # /!\ stored as lowercase
         $keywords->{$keyw} = $2;
      } elsif (m/\$tic:\s*(\d+)\$["']?/) {
         $keywords->{tic} = $1;
      } else {
         chomp;
         printf "dbug: %s\n",$_ if $dbug;
      }
   }
   close F;
   # if no mutable invent one !
   if (! defined $keywords->{mutable}) {
      if ($file =~ m{^/.*/([^/]+)/([^/]+)/?$}) {
         my $mutable = $1.'/'.$2.'.log'; $mutable =~ s,/_,/,g;
         $keywords->{mutable} = '/.brings/mutables/'.$mutable;

      } else {
         use Cwd qw(cwd);
         cwd() =~ m{/([^/]+)/?$};
         my $mutable = $1.'/'.$file.'.log'; $mutable =~ s,/_,/,g;
         $keywords->{mutable} = '/.brings/mutables/'.$mutable;
      }
   }
   # if no source invent one !
   if (! defined $keywords->{source}) {
      if ($file =~ m{^/.*/([^/]+)/([^/]+)/?$}) {
         my $source = $1.'/'.$2; $source =~ s,/_,/,g;
         $keywords->{source} = '/my/files/'.$source;
      } else {
         use Cwd qw(cwd);
         cwd() =~ m{/([^/]+)/?$};
         my $source = $1.'/'.$file; $source =~ s,/_,/,g;
         $keywords->{source} = '/my/files/'.$source;
      }
   }


} else {
  $keywords->{source}=$file||'/from/the/ultimate/divine/source/empty_file.blob,v';
}

if ($dbug && ! $yml) {
   use YAML::Syck qw(Dump);
   printf "--- # dbug %s\n",Dump($keywords);
}

if ($yml) {
   use YAML::Syck qw(Dump);
   printf "%s\n",Dump($keywords);
} elsif (defined $key) {
   if (defined $keywords->{$key}) {
      print $keywords->{$key};
   } else {
      print '~';
   }
} elsif (defined $keywords->{'mutable'}) {
   print $keywords->{mutable};
} else {
   print $keywords->{source};
}

exit $?;
sub encode_base58 { # btc
  use Math::BigInt;
  use Encode::Base58::BigInt qw();
  my $bin = join'',@_;
  my $bint = Math::BigInt->from_bytes($bin);
  my $h58 = Encode::Base58::BigInt::encode_base58($bint);
  $h58 =~ tr/a-km-zA-HJ-NP-Z/A-HJ-NP-Za-km-z/;
  return $h58;
}
sub hashr {
   my $alg = shift;
   my $rnd = shift; # number of round to run ...
   my $tmp = join('',@_);
   use Crypt::Digest qw();
   my $msg = Crypt::Digest->new($alg) or die $!;
   for (1 .. $rnd) {
      $msg->add($tmp);
      $tmp = $msg->digest();
      $msg->reset;
      #printf "#%d tmp: %s\n",$_,unpack'H*',$tmp;
   }
   return $tmp
}


1;
