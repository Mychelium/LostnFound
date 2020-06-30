#

tic=$(date +%S)
qm=$(ipfs add -Q -r . --progress=false)
#    let qmbin = 'Qmc776TowFd8aYHRpXb3wiKNL7sYvjyYSD7Ahhkrq3bex3'
sed -i -e "s/.*let qmbin.*/    let qmbin = '$qm'; \/\* <---- to be updated \*\//" js/holobin.js
git add js/holobin.js
git commit -m "update for $qm ($tic)"
git push origin source
