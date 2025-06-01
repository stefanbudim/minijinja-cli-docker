#!/bin/bash
set -euo pipefail # Exit on error, unset variables, pipeline errors

if [ ! $# = 1 ]
then
cat <<EOF
  USAGE:
    ./$0 IMAGE_NAME

  EXAMPLES:
    ./$0 stefanbudim/minijinja-cli
    ./$0 stefanbudim/minijinja-cli:latest
    ./$0 stefanbudim/minijinja-cli:2.10.2
EOF
  exit 1
else
  IMAGE_NAME=$1
fi


IMAGE_NAME=$1
#IMAGE_NAME="stefanbudim/minijinja-cli"
DATA_DIR="test_data"



# Create dummy template and data for the test
mkdir -p ${DATA_DIR}
echo "Hello, {{ name }} from a test! FORCE FAIL" > ${DATA_DIR}/template.j2
echo '{"name": "Mina"}' > ${DATA_DIR}/data.json

echo "--- Running rendering test ---"
RENDERED_OUTPUT=$(docker run --rm -v "$(pwd)/${DATA_DIR}:/data" "${IMAGE_NAME}" /data/template.j2 /data/data.json)

echo "Rendered output: ${RENDERED_OUTPUT}"

EXPECTED_OUTPUT="Hello, Mina from a test!"

if [[ "${RENDERED_OUTPUT}" == "${EXPECTED_OUTPUT}" ]]; then
    echo "SUCCESS: Rendering test passed!"
    rm -rf ${DATA_DIR} # Clean up
    exit 0
else
    echo "FAILURE: Rendering test failed!"
    echo "Expected: '${EXPECTED_OUTPUT}'"
    echo "Got:      '${RENDERED_OUTPUT}'"
    rm -rf ${DATA_DIR} # Clean up
    exit 1
fi