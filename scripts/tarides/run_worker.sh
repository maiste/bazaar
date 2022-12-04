mkdir -p $HOME/tmp/worker
opam exec -- dune exec -- bin/worker.exe \
    --connect=./capnp-secrets/pool-linux-x86_64.cap \
    --state-dir=$HOME/tmp/worker \
    --name=worker-1 --capacity=1 --prune-threshold=20 \
    -v
