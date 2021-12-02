# genesis-contracts

#### Setup genesis

Setup genesis whenever contracts get changed
### 1. Install dependencies and submodules
```bash
$ npm install
$ git submodule init
$ git submodule update
```

### 2. Compile Bttc contracts
```bash
$ cd bttc-contracts
$ npm install
$ node scripts/process-templates.js --bttc-chain-id <bttc-chain-id>
$ npm run truffle:compile
$ cd ..
```

### 3. Generate Bttc validator set sol file

Following command will generate `BorValidatorSet.sol` file from `BorValidatorSet.template` file.

```bash
# Generate bttc validator set using stake and balance
# Modify validators.json before as per your need
$ node generate-borvalidatorset.js --bttc-chain-id <bttc-chain-id> --delivery-chain-id <delivery-chain-id>
```

### 4. Compile contracts
```bash
$ npm run truffle:compile
```

### 5. Generate genesis file

Following command will generate `genesis.json` file from `genesis-template.json` file.

```bash
# Generate genesis file
$ node generate-genesis.js --bttc-chain-id <bttc-chain-id> --delivery-chain-id <delivery-chain-id>
```

### 6. Run Tests
```bash
$ npm run testrpc
$ npm test
```
