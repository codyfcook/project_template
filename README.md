# Repository guidelines

## Code structure
- Use the sandbox for developing code, exploratory work, etc. 
- Integrate mature code into the `1_code` folder. Structure the folder around "tasks," where each subfolder is a more-or-less self contained. Order tasks with prefixes (0a, 0b, ..., 1a, 1b, ...). The jump from 0 to 1 should reflect a major change in workflow, e.g., moving from data cleaning to descriptive analyses (and then use 2a, 2b, ... for model estimation code). 
- For large tasks, it may help to use the ordered prefixes for naming code files within the tasks folder. 
- Update `run_all.sh` -- while it is rare we will want to run everything start to finish, it helps serve as documentation for the order code should be run in. Use comments to document important dependencies. 

## Package management
- Document Python packages in requirements.txt (with pinned version numbers if version is important)
- TODO: conda env? 

## Data management
- Track paths to data in `config.yaml`, including those stored as BigQuery tables
- In Python, use the config by running: 
```python
import yaml 
config = yaml.load(open(path_to_config), Loader=yaml.FullLoader)
config['bgrp_geos_table'] # It acts as a dictionary
```
- Use markdown files stored in `0_data/documentation` to document where data comes from and how it was cleaned 

## Output management
- Code should output to `2_output/`. Use subfolders to stay organized. 
- Slides, paper, and notes should _not_ directly reference files in `2_output/`. Instead, copy output over to an `input/` folder within the corresponding document's folder (ideally, the copying step should be part of the `make.sh` file in the document's folder).  

# Using Google Cloud Platform (GCP)
Read [here](https://github.com/codyfcook/GentzkowLabTemplate/wiki/Using-Google-Cloud-Platform-(GCP)) for details on how to setup and use various GCP products
