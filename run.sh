#!/bin/bash

# about 50s to generate resume

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR" || exit

echo "Generating your resume..."
docker run --rm --user root -i -w "/doc" -v "$PWD":/doc texlive/texlive:latest make

# rename
mv examples/resume.pdf examples/patrick_grenning_resume.pdf

# open after resume generated
echo "Opening your resume..."
open examples/patrick_grenning_resume.pdf

# convert to txt and png
docker build -t python-converter-app . && docker run -v "$PWD/examples":/app/examples python-converter-app
