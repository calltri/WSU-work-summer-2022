rm ${pwd}\phame_examples
git clone https://github.com/mshakya/phame_examples.git
docker run --rm -t -v ${pwd}/phame_examples/ecoli:/data quay.io/biocontainers/phame:1.0.3--0
