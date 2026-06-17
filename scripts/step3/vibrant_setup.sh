#!/bin/bash

# VIBRANT database setup script
# Purpose: set up required VIBRANT databases before running VIBRANT

source /mnt/data/project0026/student_data/2655065d/miniforge3/etc/profile.d/conda.sh
conda activate vibrant

cd /mnt/data/project0026/student_data/2655065d/.conda/envs/vibrant/share/vibrant-1.2.1/db/databases

python VIBRANT_setup.py
