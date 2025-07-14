
# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR="$(cd "$(dirname -- "$0")" && pwd -P)"
REPO_ROOT="$(cd "$MAKE_SCRIPT_DIR/../" && pwd -P)"
MODULE=$(basename "$MAKE_SCRIPT_DIR")


# Using `uv run [script].py` ensures that the correct environment is used and all dependencies are installed. 

# Analyse NYC dogs dataset 
mkdir -p ${REPO_ROOT}/2_analysis/example_submodule/output      # Create output directory iff doesn't exist
rm -rf ${REPO_ROOT}/2_analysis/example_submodule/output/*      # Remove existing output
uv run ${REPO_ROOT}/2_analysis/example_submodule/dog_descriptives.py
