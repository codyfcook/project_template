
# Data management 

Use markdown files stored in `0_data/documentation` to document where data comes from and how it was cleaned 

Code should not use the path to a file directly (unless just to a temporarily saved file). Instead, use `config.yaml` to track paths, including BigQuery tables and files in GCP buckets. This way we can easily track what data is used where (and swap it out as needed). 