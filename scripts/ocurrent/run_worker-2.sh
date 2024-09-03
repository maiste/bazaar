mkdir -p $HOME/tmp/worker-2
mkdir -p $HOME/tmp/worker-pool
rsync:/path
opam exec -- dune exec -- bin/worker.exe \
    --connect=./capnp-secrets/pool-linux-x86_64.cap \
    --state-dir=$HOME/tmp/worker-2 \
    --name=worker-2 --capacity=1 --prune-threshold=20 \
    --obuilder-store=rsync:$HOME/tmp/worker-pool \
    -v
