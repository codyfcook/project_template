#!/bin/bash   
set -e

# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR=$(dirname "$(realpath "$0")")
REPO_ROOT=$(realpath "$MAKE_SCRIPT_DIR/../../")
MODULE=$(basename "$MAKE_SCRIPT_DIR")
LOGFILE="${MAKE_SCRIPT_DIR}/make.log"

# Tell user what we're doing
echo -e "\n\nMaking \033[35m${MODULE}\033[0m module with shell: ${SHELL}"

# Load run latex tools
source "${REPO_ROOT}/lib/run_latex.sh"

(
    cd "${MAKE_SCRIPT_DIR}"

    # Copy inputs to local directory
    # (Make sure this section is updated to pull in all needed input files!)
    rm -rf input
    mkdir -p input
    find "${REPO_ROOT}/2_output" -type f -exec cp {} input/ \;

    # Run programs in order
    run_latex my_project_slides ${LOGFILE} .

) 2>&1 | tee ${LOGFILE}
