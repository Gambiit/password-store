======================
Simple Password Store
by Jason Donenfeld
   Jason@zx2c4.com
======================

This is a very simple password store that encrypts passwords using gpg and
places the encrypted password in a directory. It can generate new passwords
and keep track of old ones.

Visit the project page for more information: http://www.passwordstore.org/

Please see the man page for documentation and examples.

Depends on:
- bash
  http://www.gnu.org/software/bash/
- GnuPG2
  http://www.gnupg.org/
- git
  http://www.git-scm.com/
- xclip
  http://sourceforge.net/projects/xclip/
- pwgen
  http://sourceforge.net/projects/pwgen/
- tree >= 1.7.0
  http://mama.indstate.edu/users/ice/tree/
- GNU getopt
  http://www.kernel.org/pub/linux/utils/util-linux/
  http://software.frodo.looijaard.name/getopt/

# my contrib
This contribution allows password-store to store a Base32 key used for a two-factor authentication.
##How to use
pw file contains the encrypted password. To insert the base32 key to the second authentication factor :
```
$pass insert pw -t
Enter password for pw:
Retype password for pw:
```
or
```
$pass insert pw --totp
Enter password for pw:
Retype password for pw:
```
or
```
$pass insert pw.totp
Enter password for pw:
Retype password for pw:
```
To display the two-factor authentication do
```
$pass pw
LeMotDePasse		#first facteur authentication
999000			#first time otp to second factor authentication
906475			#second time otp
474288			#...
256916
```
## Depend on
- oathtool
  http://www.nongnu.org/oath-toolkit/

The defaut code use is `oathtool --base32 -w 3 --totp "base32 key"`

## Test
You could test this fork in a docker container.
Because it's impossible to create a gpg key in a container, due to less entropy, copy your .gnupg/ directory inside and append a key DSA without passphrase.
See https://www.gnupg.org/faq/gnupg-faq.html#automated_use to create a key without passphrase.
Remember the key-ID.
Build the image
```
$docker build -t password:0.0.1 .
```
Create a container test and init the password-store
```
$docker run -ti password:0.0.1 bash
root@abfb58571026:~# pass init key-ID
```
