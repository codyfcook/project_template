# Output 

Use subfolders to organize output. For slides, paper, and notes, do not refer directly to files in this folder in the `.tex`. Instead, create copies within the relevant `input/` folder (ideally in the corresponding `make.sh` script) and use the paths to those. This way re-running the code won't overwrite the inputs to any document. 