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
This branch propose to use external sub-commands hooks. The aim is to keep the "pass" script as simple as possible to ensure safety and reliability...but to allow the end-user to add features. The original idea comes from Lenz Weber who suggested I used it here.
##End-users addons
The addons script "otp" is add in the .subcommand_hooks dir. The file must be sign with the same key that the password-store :
```
$gpg --output otp.sig --detach-sign otp
```
So, the directory look like this
```
.password-store
|_.subcommand_hooks
| |_otp
| |_otp.sig
| |_...
|
|_pw.gpg
|_pw.totp.gpg
|_...
```
##How to use otp addons
pw file contains the encrypted password. pw.totp file contains base32 encrypted key, do:
```
$pass insert pw.totp
Enter password for pw:
Retype password for pw:
```
To display the two-factor authentication, do
```
$pass otp pw
MonMotDePasse	#first facteur authentication
999000			#first time otp, second factor authentication
906475			#second time otp,
474288			#...
256916
```
## Depend on
- oathtool
  http://www.nongnu.org/oath-toolkit/

The defaut code use is `oathtool --base32 -w 3 --totp "base32 key"`
