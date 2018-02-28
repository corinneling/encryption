# Encryption
### Using [OpenSSL](http://ruby-doc.org/stdlib-1.9.3/libdoc/openssl/rdoc/OpenSSL/Cipher.html)

#### Secret Message
Simple 30 line program to encrypt and then decrypt a message. So far, it asks for the user to set a password and create the message. I chose a AES (Advanced Encryption Standard) 256 CBC for the cipher.

#### Create Password
Originally part of secret message, but I didn't want a password to be the key. Using PKCS5.pbkdf2_hmac_sha1.
