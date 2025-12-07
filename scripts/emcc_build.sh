#!/bin/sh
emcc --no-entry -o fastqe.html "-fno-entry" "-s" "ERROR_ON_UNDEFINED_SYMBOLS=0" "-s" "USE_ZLIB=1" "-s" "INVOKE_RUN=0" "-s" "FORCE_FILESYSTEM=1" "-s" "EXPORTED_RUNTIME_METHODS=['callMain','FS','PROXYFS','WORKERFS']" "-s" "MODULARIZE=1" "-s" "ENVIRONMENT=web,worker" "-s" "ALLOW_MEMORY_GROWTH=1" "--preload-file" "data@/fastqe/" "-lworkerfs.js" "-lproxyfs.js"  $@

emcc  \
  -o fastqe_cli.wasm \
  -s STANDALONE_WASM=1 \
  -s EXPORTED_FUNCTIONS=['_main'] \
  -s EXIT_RUNTIME=1 \
  -s ERROR_ON_UNDEFINED_SYMBOLS=0 \
  -s USE_ZLIB=1 \
  -s FORCE_FILESYSTEM=1 \
  -s ENVIRONMENT=worker \
  -s ALLOW_MEMORY_GROWTH=1 \
  --preload-file data@/fastqe/ \
  -lworkerfs.js \
  -lproxyfs.js $@
