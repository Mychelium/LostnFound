#

ver=1cd281f
echo https://github.com/showdownjs/showdown/tree/$ver/dist
cat <<EOT | xargs -L 1 ipfs add -Q -w
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.js
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.js.map
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.min.js
https://raw.githubusercontent.com/showdownjs/showdown/master/dist/showdown.min.js.map

https://api.github.com/repos/showdownjs/showdown/zipball/1.9.1
https://raw.githubusercontent.com/showdownjs/showdown/$ver/dist/showdown.min.js
https://raw.githubusercontent.com/showdownjs/showdown/$ver/dist/showdown.min.js.map
https://raw.githubusercontent.com/mychelium/js/dist/showdown.min.js

https://cdn.jsdelivr.net/npm/showdown@1.9/dist/showdown.min.js

EOT

