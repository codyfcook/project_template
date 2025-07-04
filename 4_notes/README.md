# Notes

For storing Latex or text notes. Each folder should be self-contained. Output needed to generate the note should be copied over to the corresponding inputs folder (not symlinked) so that it persists.

Latex should be generated using the `run_latex` helper function in `/lib`. This function will compile the `.tex` file and remove all of the ancilliary files that are generated besides `.pdf` and a log file

```bash
# Source the function  
source lib/run_latex

# Generate Latex -- structure is "run_latex [filename without .tex] [log file to use] [destination directory]"
cd notes/template
run_latex notes_template compile.log .
```
