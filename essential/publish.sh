#

# $birth: 1525868955$

tic=$(date +%s)
export IPFS_PATH=..

(cd gqtools; git pull)
du -s * | sort -n | tee du.log
sh bin/qmjs.sh
qm=$(ipfs add -r -Q .)
echo qm: $qm
mv qm.log qm.log~
head -2 qm.log~ > qm.log
sed -ne '/\.\.\./,$ p' qm.log~ | tail -20 >> qm.log
echo $tic: $qm >> qm.log

pm=$(sed -ne '/\.\.\./,$ p' qm.log | grep -v '^#' | head -1 | cut -d' ' -f2)
ipfs pin rm /ipfs/$pm
ipfs pin add /ipfs/$qm

