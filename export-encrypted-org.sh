#!/bin/bash

ORGANIZATION_ID="c987eb3d-59b7-4ef9-aad4-aed801304514"

stty -echo
printf "Password: "
read BW_PASSWORD
stty echo
printf "\n"
export BW_PASSWORD="$BW_PASSWORD"

BW=$(which bw)
# echo "List of organizations:"
# $BW list organizations --password "$BW_PASSWORD" | jq .
echo "Exporting oganization $ORGANIZATION_ID into encrypted file."
$BW export --organizationid "$ORGANIZATION_ID" --format json --session $($BW unlock --passwordenv BW_PASSWORD --raw) --raw | openssl aes-256-cbc -a -salt -pbkdf2 -k "$BW_PASSWORD" -out organization.json.enc

