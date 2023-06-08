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

# create a copy of your resume as a txt
echo "Creating a copy of your resume as a txt..."
docker run --rm -v "$PWD":/app python:latest bash -c "apt-get update && apt-get install -y libpoppler-cpp-dev && python -m venv /app/venv && . /app/venv/bin/activate && pip install pdftotext && python /app/convert_pdf_to_txt.py"
