#!/bin/bash
pw_contents=$(pass show "$@")

echo "password:"
echo $pw_contents | sed -n 1p

OTP_OPTS=( $PASSWORD_STORE_OTP_OTPS "--base32" "-w 3" "--totp" )
OTP="oathtool"
$OTP "${OTP_OPTS[@]}" $(echo $pw_contents)
exit 0
