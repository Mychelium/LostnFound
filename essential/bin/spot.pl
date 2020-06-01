#!/usr/bin/perl
BEGIN { my$p=rindex($0,'/');our$bindir=($p>0)?substr($0,0,$p):'.'; }

# -----------------------------------------------------------------
use lib $bindir.'/../lib';
use IPMS qw(mfs_copy mfs_append ipms_get_api ipms_post_api);
my $dbug=0;
#understand variable=value on the command line...
eval "\$$1='$2'"while $ARGV[0] =~ /^(\w+)=(.*)/ && shift;
if ($dbug) {
 eval "use YAML::Syck qw(Dump);";
}
# -----------------------------------------------------------------


# get you space and time location (memory drop point)
my $time = int($^T / 61) * 59;
my $spot = &get_spot($time,@ARGV);
printf "spot: %s\n",$spot;

# archive the spot !
my $spotdata = sprintf <<"EOT",$ENV{USER},$^T,$spot, join',',@ARGV;
--- # spot for %s
tic: %s
spot:%s
argv: [%s]
EOT
my $mh = &ipms_post_api('add','spot.yml',$spotdata);
my $qm = $mh->{Hash};
printf "qm: %s\n",$qm;
&mfs_copy("/ipfs/$qm",'/etc/spot.yml');
my $etc = &ipms_get_api('files/stat','/etc');
printf "etc: %s\n",$etc->{Hash};
my $mh = &mfs_append("$etc->{Hash}: /etc",'/.brings/published/brindex.log');
printf "mh: %s.\n",YAML::Syck::Dump($mh) if $dbug;

exit $?;

sub get_spot {
   my $tic = $_[0] || $^T;
   my $nonce;
   if (@_) {
      use Digest::MurmurHash qw();
      $nonce = Digest::MurmurHash::murmur_hash(join'',@_);
   } else {
      $nonce = 0xA5A5_5A5A;
   }

   my $dotip = &get_localip || '127.0.0.1';
   my $pubip = $ENV{REMOTE_ADDR} || &get_publicip || '0.0.0.0' ;
   my $lip = unpack'N',pack'C4',split('\.',$dotip);
   my $nip = unpack'N',pack'C4',split('\.',$pubip);
   my $seed = srand($nip);
   my $salt = int rand(59);
   my $time = 59 * int (($tic - 58) / 59) + int rand(59);
     
   my $spot = $time ^ $nip ^ $lip ^ $nonce;
   return $spot;
}
sub get_localip {
    use IO::Socket::INET qw();
    # making a connectionto a.root-servers.net

    # A side-effect of making a socket connection is that our IP address
    # is available from the 'sockhost' method
    my $socket = IO::Socket::INET->new(
        Proto       => 'udp',
        PeerAddr    => '198.41.0.4', # a.root-servers.net
        PeerPort    => '53', # DNS
    );
    return '0.0.0.0' unless $socket;
    my $local_ip = $socket->sockhost;

    return $local_ip;
}
sub get_publicip {
 use LWP::UserAgent qw();
  my $ua = LWP::UserAgent->new();
  #my $url = "https://dyn℠.ml/cgi-bin/remote_addr.pl";
  my $url = "https://dynsm.ml/cgi-bin/remote_addr.pl";
     $ua->timeout(7);
  my $resp = $ua->get($url);
  my $ip;
  if ($resp->is_success) {
    my $content = $resp->decoded_content;
    chomp($content);
    $ip = $content;
  } else {
    print "X-Error: ",$resp->status_line;
    my $content = $resp->decoded_content;
    $ip = '127.0.0.1';
  }
  return $ip;
}



1; # $Source: /my/perl/scripts/spot.pl$
