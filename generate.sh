#!/usr/bin/env sh

# Usage: 
# generate.sh 1029 delivery-1029

set -x #echo on

if [ -z "$1" ]
  then
    echo "Bttc chain id is required first argument"
  exit 1
fi

if [ -z "$2" ]
  then
    echo "Delivery chain id is required as second argument"
  exit 1
fi

npm install
npm run truffle:compile
git submodule init
git submodule update
cd bttc-contracts
npm install
node scripts/process-templates.js --bttc-chain-id $1
npm run truffle:compile
cd ..
node generate-borvalidatorset.js --bttc-chain-id $1 --delivery-chain-id $2
npm run truffle:compile
node generate-genesis.js --bttc-chain-id $1 --delivery-chain-id $2
