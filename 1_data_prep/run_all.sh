
# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR="$(cd "$(dirname -- "$0")" && pwd -P)"
REPO_ROOT="$(cd "$MAKE_SCRIPT_DIR/../" && pwd -P)"
MODULE=$(basename "$MAKE_SCRIPT_DIR")


# Using `uv run [script].py` ensures that the correct environment is used and all dependencies are installed. 

# Clean NYC dogs dataset 
mkdir -p ${REPO_ROOT}/1_data_prep/output/nyc_dogs      # Create output directory iff doesn't exist
rm -rf ${REPO_ROOT}/1_data_prep/output/nyc_dogs/*      # Remove existing output
uv run ${REPO_ROOT}/1_data_prep/code/nyc_dogs/clean_dogs_data.py

