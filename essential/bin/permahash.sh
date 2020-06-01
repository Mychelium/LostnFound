#

set -e
peerid=$(ipfs --offline config Identity.PeerID)
# pre-requisites :
if ipfs key list | grep -q -w permahash ; then
 key=$(ipfs key list -l | grep -w permahash | cut -d' ' -f 1)
 echo "key: $key # -e"
else
 key=$(ipfs key gen -t rsa -s 3072 permahash)
echo "key: $key # (new)"
fi

rm -rf /tmp/empty
mkdir /tmp/empty

line=$(perl -e 'print "-"x76,"\n";'| ipfs add -Q --pin=true -)
if ipfs files mkdir -p /root/misc/etc; then true; fi
if ipfs files rm /root/misc/etc/line; then true; fi
ipfs files cp /ipfs/$line /root/misc/etc/line

echo "IPFS is active" | ipfs --offline add -Q --pin=true - 1>/dev/null
active=$(echo "IPFS is active" | ipfs --offline add -Q --hash identity --pin=true)
gone=$(echo '410 gone' | ipfs add -Q --hash sha3-224 --cid-base base58btc)
empty=$(echo -n '' | ipfs add -Q -n --hash sha3-224 --cid-base base58btc)
emptyd=$(ipfs add -Q -r /tmp/empty --hash sha3-224 --cid-base base58btc)
npeers=$(ipfs swarm peers | wc -l)
noprev=$(echo "no previous" | ipfs --offline add -Q --pin=false)
qmRCSKeywords=$(echo -n 'qmRCSKeywords' | ipfs --offline add -Q --pin=false)
qmRepoPath=$(ipfs repo stat| grep RepoPath | cut -c 13- | ipfs --offline add -Q --pin=false)


user=$(echo "$ENV{USER}" | ipfs --offline add -Q --hash sha1 --cid-base base58btc --pin=true)
hostname=$(hostname | ipfs --offline add -Q --hash sha1 --cid-base base58btc --pin=true)
mac=$(ip link show eno1 | grep link/ether | awk '{print $2}' | ipfs --offline add -Q --pin=true)
ip=$(curl -s http://dyn℠.ml/cgi-bin/remote_addr.pl | head -1)
ip=${ip:-0.0.0.0}


cat >/tmp/permahash.yml <<EOT
--- # permahash
mac: $mac
user: $user
hostname: $hostname
pkey: $peerid
qmRepoPath: $qmRepoPath
tic: $(date +%s)
ip: $ip
pid: $$
npeers: $npeers
active: $active
line: $line
hello: $(echo "Hello World!" | ipfs add -Q  --pin=false -)
gone: $gone
empty: $empty
emptyd: $emptyd
noprev: $noprev
qmRCSKeywords: $qmRCSKeywords
EOT

for w in ready ipfs ipms mychelium holoRing blockRing™ holosphere holoKIN KIND; do
  echo $w: $(echo -n $w | ipfs add -Q --pin=true -) >> /tmp/permahash.yml
done
echo email: $(echo -n michelc@gc-bank.org | ipfs add -Q  --pin=true -) >> /tmp/permahash.yml
echo email1: $(echo -n michelc@gc-bank™.com | ipfs add -Q --pin=true -) >> /tmp/permahash.yml
echo email2: $(echo -n michelc@mychelium.ml | ipfs add -Q --pin=true -) >> /tmp/permahash.yml
echo email3: $(echo -n michelc@holoKIN.ml | ipfs add -Q --pin=true -) >> /tmp/permahash.yml
echo ${0##*/}: $(ipfs add -Q $0) >> /tmp/permahash.yml

permahash=$(ipfs add -Q /tmp/permahash.yml)
echo permahash: https://gateway.ipfs.io/ipfs/$permahash
if ipfs files rm /root/misc/etc/permahash.yml; then true; fi
ipfs files cp /ipfs/$permahash /root/misc/etc/permahash.yml
root=$(ipfs files stat --hash /root)
echo -n 'info: '
ipfs --offline name publish -Q --key=permahash --allow-offline /ipfs/$root
echo etc: http://gateway.ipfs.io/ipfs/$root/misc/etc
echo curl -s -I http://gateway.ipfs.io/ipns/$key/misc/etc
echo ipfs ping -n 1 $peerid
echo time ipfs ls /ipfs/$root/misc/etc
echo time ipfs ls /ipns/$key/misc/etc
echo -n 'ping: '
#ipfs ping -n 1 QmZV2jsMziXwrsZx5fJ6LFXDLCSyP7oUdfjXdHSLbLXxKJ
#ipfs ping -n 1 QmcfHufAK9ErQ9ZKJF7YX68KntYYBJngkGDoVKcZEJyRve
ipfs ping -n 1 Qmd2iHMauVknbzZ7HFer7yNfStR4gLY1DSiih8kjquPzWV
echo -n 'ipns: '
time ipfs name publish -Q --key=permahash /ipfs/$root | sed -e 's/^/  /'

