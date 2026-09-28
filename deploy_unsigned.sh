#!/usr/bin/env bash
# UNSIGNED. Fill ARTIST and RPC yourself. Never paste a key into AetherMint.
set -euo pipefail
NETWORK="${NETWORK:-base-sepolia}"
RPC_URL="${RPC_URL:?set RPC_URL to a testnet endpoint you control}"
ARTIST="${ARTIST:?set ARTIST to the royalty / reserve receiver}"
PRIVATE_KEY="${PRIVATE_KEY:?forge reads this from YOUR env — do not commit it}"
echo "AetherMint unsigned deploy — $NETWORK"
command -v forge >/dev/null
forge create "RELICCollectible.sol:RELICCollectible" \
  --rpc-url "$RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --constructor-args \
    "Relics of the Null Orbit" \
    "RELIC" \
    333 \
    3 \
    33000000000000000 \
    33 \
    "$ARTIST" \
    500 \
    "ipfs://PENDING/hidden.json"
