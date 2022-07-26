rm -r -f $(pwd)/phame_examples
git clone https://github.com/mshakya/phame_examples.git

echo
echo Starting docker container
MSYS_NO_PATHCONV=1 docker run --rm -t -v $(pwd)/phame_examples/ecoli:/data quay.io/biocontainers/phame:1.0.3--0
