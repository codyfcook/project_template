'''
This script reads the NYC Dog Licensing dataset, cleans up some of the columns, and saves as a parquet 
'''

import polars as pl
import os

PROJ_DIR = '/'.join(os.getcwd().partition('project_template')[0:2])
RAW_DIR = os.path.join(PROJ_DIR, '0_raw/example_submodule')
OUTPUT_DIR = os.path.join(PROJ_DIR, '1_data_prep/example_submodule/output')

def main():

    # Read in file and clean up column names
    df = pl.read_csv(os.path.join(RAW_DIR, 'NYC_Dog_Licensing_Dataset_20250703_sample.csv'))
    df.columns = ['name', 'gender', 'birth_year', 'breed', 'zip', 'license_issued', 'license_expires']

    # Convert dates to date objects 
    df = df.with_columns(
        pl.col('license_issued').str.strptime(pl.Date, "%m/%d/%Y"),
        pl.col('license_expires').str.strptime(pl.Date, "%m/%d/%Y")
    )

    # Zip and birth year can be cast to integers for more efficient storage
    df = df.with_columns(
        pl.col('zip').cast(pl.Int32), 
        pl.col('birth_year').cast(pl.Int16)
    )

    # Save as a parquet 
    df.write_parquet(os.path.join(OUTPUT_DIR, 'nyc_dogs.parquet'))

if __name__ == "__main__":
    main()