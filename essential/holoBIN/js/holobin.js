/* data encryption + storage functions for holobin
 * make sure to also load jquery + aes.js
 */

function encrypt(data, key) {
    return CryptoJS.AES.encrypt(data, key).toString();
}

function decrypt(data, key) {
    return CryptoJS.AES.decrypt(data, key).toString(CryptoJS.enc.Utf8);
}

function generate_key() {
/*                 '0        1         2         3         4         5         6  '
                   '12345678901234567890123456789012345678901234567890123456789012' */
    var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890abcdefghijklmnopqrstuvwxyz';

    var randombytes = new Uint8Array(32);
    crypto.getRandomValues(randombytes);
    return base58.encode(Array.from(randombytes));
}

function is_local_gateway() {
    return window.location.hostname == 'localhost';
}

function write(content, cb) {
    let qmbin = 'Qmc1p5a5eVhv5Bd6R4CGeeDAsYWBk4FwrFh7oSiKZd7SKD'; /* <---- to be updated */
    $.ajax({
        url: 'http://localhost:8080/ipfs/'+qmbin+'/content',
        type: "DELETE",
        success: function(data, status, xhr) {
            $.ajax({
                url: "http://localhost:8080/ipfs/" + xhr.getResponseHeader('Ipfs-Hash') + "/content",
                type: "PUT",
                data: content,
                success: function(data, status, xhr) {
                    cb(xhr.getResponseHeader('Ipfs-Hash'));
                },
                timeout: function() {
                    cb("");
                },
                error: function() {
                    cb("");
                },
            });
        },
        timeout: function() {
            cb("");
        },
        error: function() {
            cb("");
        },
    });
}
