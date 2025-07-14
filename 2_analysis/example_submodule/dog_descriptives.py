import polars as pl 
import pandas as pd 
import os, sys, yaml
import matplotlib.pyplot as plt
import seaborn as sns

PROJ_DIR = '/'.join(os.getcwd().partition('project_template')[0:2])
DATA_DIR = os.path.join(PROJ_DIR, '1_data_prep/example_submodule/output')
OUTPUT_DIR = os.path.join(PROJ_DIR, '2_analysis/example_submodule/output')

# Use default plotting defaults from the config
config = yaml.load(open(os.path.join(PROJ_DIR, 'config.yaml')), Loader=yaml.FullLoader)
plt.rcParams.update(config['graph_params'])
sns.set_palette(sns.color_palette(config['colors']))

def filter_dogs(df):
    '''
    Filter out dogs with unknown breed or name.
    '''
    return df.filter(
        (pl.col("breed") != 'Unknown') & 
        (pl.col("name") != 'UNKNOWN') & 
        (pl.col("name") != 'NAME NOT PROVIDED')
    )

def get_top_categories(filtered_df, col, n=10):
    '''
    Get the top n categories by fraction of total for a given column.
    '''
    total = filtered_df.height
    return (
        filtered_df
        .group_by(col)
        .agg(nb_dogs = pl.len())
        .with_columns(
            (pl.col("nb_dogs") / total).alias("fraction")
        )
        .sort("fraction", descending=True)
        .head(n)
        .to_pandas()
    )

def plot_top_categories(top_breeds, top_names, output_path):
    '''
    Plot the top breeds and names side by side and save the figure.
    '''
    fig, axes = plt.subplots(1, 2, figsize=(12, 5), sharex=False)

    # Left panel: Top breeds
    sns.barplot(
        data=top_breeds,
        x="fraction",
        y="breed",
        orient="h",
        ax=axes[0]
    )
    axes[0].set(xlabel="Fraction of Dogs", 
        ylabel="Breed",
        title="Top 10 Most Popular Dog Breeds in NYC"
    )

    # Right panel: Top names
    sns.barplot(
        data=top_names,
        x="fraction",
        y="name",
        orient="h",
        ax=axes[1]
    )
    axes[1].set(xlabel="Fraction of Dogs", 
        ylabel="Name",
        title="Top 10 Most Popular Dog Names in NYC"
    )
    fig.subplots_adjust(wspace=0.3)
    fig.savefig(output_path, format='pdf', dpi=300, bbox_inches='tight')
    return 


if __name__ == "__main__":
    
    # Read in dogs data 
    df = pl.read_parquet(os.path.join(DATA_DIR, 'nyc_dogs.parquet'))

    # Subset to only keep dogs with name and breed 
    filtered_df = filter_dogs(df)

    # Store sample sizes 
    with open(os.path.join(OUTPUT_DIR, "num_dogs.tex"), "w") as f:
        f.write(str(len(df)))
    with open(os.path.join(OUTPUT_DIR, "num_dogs_w_name_and_breed.tex"), "w") as f:
        f.write(str(len(filtered_df)))

    # Plots of top names and breeds
    top_breeds = get_top_categories(filtered_df, "breed", n=10)
    top_names = get_top_categories(filtered_df, "name", n=10)
    plot_top_categories(
        top_breeds, 
        top_names, 
        os.path.join(OUTPUT_DIR, 'top_breeds_and_names.pdf')
    )