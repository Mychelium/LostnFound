#

# $birth: 1525868955$

tic=$(date +%s)
export IPFS_PATH=..
#ipfs key gen -t rsa -s 3072 essential
key=$(ipfs key list -l | grep -w essential | cut -d' ' -f 1)
kmkey=$(ipfs cid format -f=%m -b=base36 $key)

version='v0.6.0-rc7'
if [ ! -e install/go-ipfs_${version}_linux-amd64.tar.gz ]; then
ipfscid=$(curl https://dist.ipfs.io/go-ipfs/${version}/go-ipfs_${version}_linux-amd64.tar.gz.cid)
ipfs get -o install/go-ipfs_${version}_linux-amd64.tar.gz $ipfscid
fi

(cd gqtools; git pull)
if [ ! -e qmjs.log ]; then
sh bin/qmjs.sh
fi

du -s * | sort -n | tee du.log
echo "archiving: $(pwd -P)"
qm=$(ipfs add -r -Q .)
bafy=$(ipfs cid base32 $qm)
kmu=$(ipfs cid format -f=%m -b=base36 $qm)
echo qm: $qm
echo bafy: $bafy
echo kmu: $kmu
mv qm.log qm.log~
head -2 qm.log~ > qm.log
sed -ne '/\.\.\./,$ p' qm.log~ | tail -20 >> qm.log
echo $tic: $qm >> qm.log

echo "url: http://$kmu.ipfs.localhost:8080/"
ipfs name publish --key=$key /ipfs/$qm
echo "url: http://$kmkey.ipns.localhost:8080/"

pm=$(sed -ne '/\.\.\./,$ p' qm.log | grep -v '^#' | head -1 | cut -d' ' -f2)
ipfs pin rm /ipfs/$pm
ipfs pin add /ipfs/$qm


sed -i -e 's/qm: .*$/qm: $qm/' -e 's/pm: .*$/pm: $pm'\ 
       -e 's/bafy: .*$/bafy: $bafy/'\
       -e 's/kmu: .*$/kmu: $kmu/'\
       -e 's/kmkey: .*$/kmkey: $kmkey/'\
       -e 's/bafz: .*$/bafz: $bafz/'\
       -e 's/key: .*$/key: $key/' index.htm


git commit -a

