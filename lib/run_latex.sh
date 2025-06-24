#!/bin/bash

unset run_latex
run_latex() {
    # Get arguments
    programname=$(basename "$1" .tex)
    texdir=$(dirname "$1")
    outputdir="$2"

    echo "Executing: latexmk ${programname}.tex -pdf -bibtex"
    (
        cd "${texdir}" || exit 1
        latexmk "${programname}.tex" -pdf -bibtex >> "compile.log" 2>&1
        mv "${programname}.pdf" "${outputdir}" 2>/dev/null
        rm -f "${programname}.aux" "${programname}.bbl" "${programname}.blg" \
              "${programname}.log" "${programname}.out" "${programname}.fdb_latexmk" \
              "${programname}.fls" "${programname}.synctex.gz" "${programname}.nav" \
              "${programname}.snm" "${programname}.toc"
    )
}

# Call the function with the provided arguments
run_latex "$1" "$2" 

