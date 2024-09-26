# Code 

For 'stable' code that is part of the production flow to go from data-->draft. The sandbox should be used for exploratory work. 

Use the convention of `[1-9][a-z]_[filename]` to order code sensibly. 

For large projects, have subfolders for each set of tasks. E.g., `1_process_raw_data/`, `2_clean_data`, `3_descriptives`, etc. and then use the `[1-9][a-z]` numbering of files within each folder.  

Update the `run_all.sh`. While we won't often actually re-run everything, it's useful to document how the code should be run. 