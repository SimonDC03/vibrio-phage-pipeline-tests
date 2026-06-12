#!/bin/bash

# VIBRANT test script
# Purpose: run VIBRANT on the same small FASTA test dataset used for VirSorter2

source /mnt/data/project0026/student_data/2655065d/miniforge3/etc/profile.d/conda.sh
conda activate vibrant

mkdir -p /mnt/autofs/data/userdata/project0026/student_data/2655065d/phageproject/vibrio-phage-pipeline-tests/results/vibrant_output

VIBRANT_run.py \
  -i /mnt/autofs/data/userdata/project0026/student_data/2655065d/phageproject/vibrio-phage-pipeline-tests/test_data/australia_vibrio_phage_refs.fasta \
  -folder /mnt/autofs/data/userdata/project0026/student_data/2655065d/phageproject/vibrio-phage-pipeline-tests/results/vibrant_output \
  -t 4
