mkdir -p capnp-secrets
mkdir -p $HOME/tmp/scheduler
opam exec -- dune exec -- bin/scheduler.exe \
  --capnp-secret-key-file=./capnp-secrets/key.pem \
  --capnp-listen-address=tcp:0.0.0.0:9000 \
  --capnp-public-address=tcp:127.0.0.1:9000 \
  --state-dir=$HOME/tmp/scheduler \
  --pools=linux-x86_64
