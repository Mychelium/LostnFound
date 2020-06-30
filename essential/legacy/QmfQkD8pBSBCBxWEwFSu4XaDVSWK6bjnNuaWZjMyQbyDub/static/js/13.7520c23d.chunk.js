(window.webpackJsonp=window.webpackJsonp||[]).push([[13],{1239:function(e,a,t){"use strict";var n=t(8),r=t(39),l=t(0),s=t.n(l);t(1255);a.a=function(e){var a=e.bg,t=void 0===a?"bg-aqua":a,l=e.color,c=void 0===l?"white":l,o=e.className,i=void 0===o?"":o,d=e.disabled,m=e.danger,p=e.minWidth,u=void 0===p?140:p,f=e.children,h=e.style,b=Object(r.a)(e,["bg","color","className","disabled","danger","minWidth","children","style"]),E=m?"white":d?"light-gray":c,g="Button transition-all sans-serif dib v-mid fw5 nowrap lh-copy bn br1 pa2 pointer focus-outline ".concat(m?"bg-red":d?"bg-gray-muted":t," ").concat(E," ").concat(i);return s.a.createElement("button",Object.assign({className:g,disabled:d,style:Object(n.a)({minWidth:u},h)},b),f)}},1255:function(e,a,t){},1333:function(e,a,t){"use strict";var n=t(0),r=t.n(n);a.a=function(e){e.title;var a=e.children;return r.a.createElement("div",{className:"mw6 br1 overflow-hidden"},r.a.createElement("div",{className:"f7 mb0 sans-serif ttu tracked charcoal pv1 pl2 bg-black-20"},"Shell"),r.a.createElement("div",{className:"bg-black-70 snow pa2 f7 lh-copy monospace nowrap overflow-x-auto"},a))}},1342:function(e,a,t){"use strict";var n=t(0),r=t.n(n),l=t(21),s=t(148);a.a=Object(l.c)("welcome")(function(e){var a=e.t;return r.a.createElement(s.a,null,r.a.createElement("h1",{className:"mt0 mb3 montserrat fw4 f4 charcoal"},a("aboutIpfs.header")),r.a.createElement(l.b,{i18nKey:"aboutIpfs.paragraph1"},r.a.createElement("p",{className:"mt0"},r.a.createElement("strong",null,"IPFS is a protocol")," that defines a content-addressed file system, coordinates content delivery and combines ideas from Kademlia, BitTorrent, Git and more.")),r.a.createElement(l.b,{i18nKey:"aboutIpfs.paragraph2"},r.a.createElement("p",null,r.a.createElement("strong",null,"IPFS is a filesystem.")," It has directories and files and mountable filesystem via FUSE.")),r.a.createElement(l.b,{i18nKey:"aboutIpfs.paragraph3"},r.a.createElement("p",null,r.a.createElement("strong",null,"IPFS is a web.")," iles are accessible via HTTP gateways like ",r.a.createElement("code",{className:"f7"},"https://ipfs.io"),". Browsers ",r.a.createElement("a",{className:"link blue",target:"_blank",rel:"noopener noreferrer",href:"https://github.com/ipfs-shipyard/ipfs-companion#release-channel"},"can be extended")," to use the ",r.a.createElement("code",{className:"f7"},"ipfs://")," scheme directly, and hash-addressed content guarantees authenticity")),r.a.createElement(l.b,{i18nKey:"aboutIpfs.paragraph4"},r.a.createElement("p",null,r.a.createElement("strong",null,"IPFS is p2p.")," It supports worldwide peer-to-peer file transfers with a completely decentralized architecture and no central point of failure.")),r.a.createElement(l.b,{i18nKey:"aboutIpfs.paragraph5"},r.a.createElement("p",null,r.a.createElement("strong",null,"IPFS is a CDN.")," Add a file to your local repository, and it's now available to the world with cache-friendly content-hash addressing and bittorrent-like bandwidth distribution.")))})},1797:function(e,a,t){"use strict";t.r(a);var n=t(3),r=t.n(n),l=t(14),s=t(63),c=t(64),o=t(96),i=t(95),d=t(97),m=t(0),p=t.n(m),u=t(151),f=t(33),h=t(21),b=t(148),E=t(1239),g=t(1342),y=t(1333),w=t(45),v=function(e){var a=e.t,t=e.connected,n=e.sameOrigin;if(t)return p.a.createElement("div",null,p.a.createElement("h1",{className:"montserrat fw2 navy ma0 f3 green"},a("connected.header")),p.a.createElement(h.b,{i18nKey:"connected.paragraph1"},p.a.createElement("p",null,"Now, it's time for you to explore your node. Head to ",p.a.createElement("a",{className:"link blue",href:"#/files/"},"Files page")," to manage and share your files, or explore the ",p.a.createElement("a",{className:"link blue",href:"https://www.youtube.com/watch?v=Bqs_LzBjQyk"},"Merkle Forest")," of peer-hosted hash-linked data via ",p.a.createElement("a",{className:"link blue",href:"#/explore"},"IPLD explorer"),".")),p.a.createElement(h.b,{i18nKey:"connected.paragraph2"},p.a.createElement("p",null,"You can always come back to this address to change the IPFS node you're connected to.")));var r=["http://127.0.0.1:5001","https://webui.ipfs.io"],l=window.location.origin,s=-1===r.indexOf(l);return p.a.createElement("div",null,p.a.createElement("h1",{className:"montserrat fw2 navy ma0 f3 yellow"},a("notConnected.header")),p.a.createElement(h.b,{i18nKey:"notConnected.paragraph1"},p.a.createElement("p",null,"Failed to connect to the API.")),!n&&p.a.createElement("div",null,p.a.createElement(h.b,{i18nKey:"notConnected.paragraph2"},p.a.createElement("p",null,"Make sure you ",p.a.createElement("a",{className:"link blue",href:"https://github.com/ipfs-shipyard/ipfs-webui#configure-ipfs-api-cors-headers"},"configure your IPFS API")," to allow cross-origin (CORS) requests, running the commands below:")),p.a.createElement(y.a,null,p.a.createElement("code",{className:"db"},"$ ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '[",s&&'"'.concat(l,'", '),'"',r.join('", "'),"\"]'"),p.a.createElement("code",{className:"db"},'$ ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods \'["PUT", "GET", "POST"]\''))),p.a.createElement(h.b,{i18nKey:"notConnected.paragraph3"},p.a.createElement("p",null,"Start an IPFS daemon in a terminal:")),p.a.createElement(y.a,null,p.a.createElement("code",{className:"db"},"$ ipfs daemon"),p.a.createElement("code",{className:"db"},"Initializing daemon..."),p.a.createElement("code",{className:"db"},"API server listening on /ip4/127.0.0.1/tcp/5001")),p.a.createElement(h.b,{i18nKey:"notConnected.paragraph4"},p.a.createElement("p",null,"For more info on how to get started with IPFS you can ",p.a.createElement("a",{className:"link blue",href:"https://docs.ipfs.io/introduction/usage/"},"read the guide"),".")))},I=function(e){function a(e){var t;return Object(s.a)(this,a),(t=Object(o.a)(this,Object(i.a)(a).call(this,e))).onChange=function(e){var a=e.target.value;t.setState({value:a})},t.onKeyPress=function(e){"Enter"===e.key&&t.onSubmit(e)},t.onSubmit=function(){var e=Object(l.a)(r.a.mark(function e(a){return r.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:a.preventDefault(),t.props.updateAddress(t.state.value);case 2:case"end":return e.stop()}},e)}));return function(a){return e.apply(this,arguments)}}(),t.state={value:e.defaultValue},t}return Object(d.a)(a,e),Object(c.a)(a,[{key:"render",value:function(){var e=this.props.t;return p.a.createElement("form",{onSubmit:this.onSubmit},p.a.createElement("label",{htmlFor:"api-address",className:"db f7 mb2 ttu tracked charcoal pl1"},e("apiAddressForm.apiLabel")),p.a.createElement("input",{id:"api-address",type:"text",className:"w-100 lh-copy monospace f5 pl1 pv1 mb2 charcoal input-reset ba b--black-20 br1 focus-outline",onChange:this.onChange,onKeyPress:this.onKeyPress,value:this.state.value}),p.a.createElement("div",{className:"tr"},p.a.createElement(E.a,null,e("apiAddressForm.submitButton"))))}}]),a}(p.a.Component);a.default=Object(f.b)("doUpdateIpfsApiAddress","selectIpfsInitFailed","selectIpfsConnected","selectIpfsReady","selectIpfsApiAddress","selectApiUrl",Object(h.c)("welcome")(function(e){var a=e.t,t=e.doUpdateIpfsApiAddress,n=e.apiUrl,r=e.ipfsInitFailed,l=e.ipfsConnected,s=e.ipfsReady,c=e.ipfsApiAddress;if(!r&&!s)return p.a.createElement(w.a,{pastDelay:!0});var o=window.location.origin===n;return p.a.createElement("div",null,p.a.createElement(u.Helmet,null,p.a.createElement("title",null,a("title"))),p.a.createElement("div",{className:"flex"},p.a.createElement("div",{className:"flex-auto pr3 lh-copy charcoal"},p.a.createElement(b.a,null,p.a.createElement(v,{connected:l,sameOrigin:o,t:a}),p.a.createElement("h1",{className:"montserrat fw2 navy mb0 mt5 f3 yellow"},a("configureApiPort.header")),p.a.createElement(h.b,{i18nKey:"configureApiPort.paragraph1"},p.a.createElement("p",null,"If your IPFS node is configured with a ",p.a.createElement("a",{className:"link blue",href:"https://github.com/ipfs/go-ipfs/blob/master/docs/config.md#addresses",target:"_blank",rel:"noopener noreferrer"},"custom API address"),", please set it here")),p.a.createElement(I,{t:a,defaultValue:c,updateAddress:t}))),p.a.createElement("div",{className:"measure lh-copy dn db-l flex-none mid-gray f6",style:{maxWidth:"40%"}},p.a.createElement(g.a,null))))}))}}]);
//# sourceMappingURL=13.7520c23d.chunk.js.map