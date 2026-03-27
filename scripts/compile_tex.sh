#!/usr/bin/env bash

# Check argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file.tex>"
  exit 1
fi

texfile="$1"
basename="${texfile%.tex}"

pdflatex -interaction=nonstopmode "$texfile" > /dev/null
biber "$basename" > /dev/null
bib_output=$(biber "$basename")

# Check biber for warnings
if echo "$bib_output" | grep -q 'WARN'; then
    echo "⚠️ Biber warnings detected:"
    echo "$bib_output" | grep 'WARN'
fi

pdflatex -interaction=nonstopmode "$texfile" > /dev/null
tex_output+=$(pdflatex -interaction=nonstopmode "$texfile" | tee tex_out.log)

# Check LaTeX for errors
if echo "$tex_output" | grep -q '^!'; then
    echo "❌ LaTeX errors detected:"
    echo "$tex_output" | grep '^!'
    exit 1
fi

# Check LaTex for warnings
if echo "$tex_output" | grep -q 'Warning'; then
    echo "⚠️ Latex warnings detected:"
    echo "$tex_output" | grep 'Warning'
fi

echo "✅ PDF generated: $basename.pdf"
nohup okular --unique "$basename.pdf" >/dev/null 2>&1 &
