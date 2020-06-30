#

ver=1cd281f
echo https://github.com/showdownjs/showdown/tree/$ver/dist
cat <<EOT | xargs -L 1 ipfs add -w | tee qmjs.log
https://raw.githubusercontent.com/iglake/js/master/dist/md5.js
https://raw.githubusercontent.com/iglake/js/master/dist/sha.js
https://raw.githubusercontent.com/iglake/js/master/dist/favicon.js
https://raw.githubusercontent.com/iglake/js/master/dist/jquery.js
https://raw.githubusercontent.com/iglake/js/master/dist/bootstrap.min.js

https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.js
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.js.map
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.min.js
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.min.js.map

https://api.github.com/repos/showdownjs/showdown/zipball/1.9.1
https://raw.githubusercontent.com/showdownjs/showdown/$ver/dist/showdown.min.js
https://raw.githubusercontent.com/showdownjs/showdown/$ver/dist/showdown.min.js.map
https://raw.githubusercontent.com/mychelium/js/dist/showdown.min.js

https://cdn.jsdelivr.net/npm/showdown@1.9/dist/showdown.min.js

https://raw.githubusercontent.com/michel47/snippets/master/js/essential.js
https://raw.githubusercontent.com/michel47/snippets/master/js/mychelium.js
https://raw.githubusercontent.com/michel47/snippets/master/js/form.js

https://raw.githubusercontent.com/willforge/jsring/master/js/ipfs.js
EOT

