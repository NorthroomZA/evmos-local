# customize the name of your key, the chain-id, moniker of the node, keyring backend, and log level
KEY="dev0"
CHAINID="evmos_9000-4"
MONIKER="localtestnet"
KEYRING="test"
LOGLEVEL="info"
PASS="12345678"
HOME=/evmos

# rm -rf /root/.evmosd/config/
yes $PASS | evmosd init $MONIKER --chain-id $CHAINID
rm -rf /root/.evmosd/config/gentx/
evmosd keys add dev0 --keyring-backend=$KEYRING

# Allocate genesis accounts (cosmos formatted addresses)
evmosd add-genesis-account $KEY 100000000000000000000000000aevmos --keyring-backend $KEYRING

# Sign genesis transaction
evmosd gentx $KEY 1000000000000000000000aevmos --keyring-backend $KEYRING --chain-id $CHAINID
evmosd collect-gentxs
sed -i 's/stake/aevmos/g' /evmos/.evmosd/config/genesis.json

evmosd validate-genesis