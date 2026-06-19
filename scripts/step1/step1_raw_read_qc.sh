#!/bin/bash

# Step 1: Raw read quality control for Nanopore FASTQ data
# Runs FastQC and NanoPlot for files containing .fastq.gz files.
# use line below to use
# bash scripts/step1_raw_read_qc.sh <sample_name> <input_fastq_dir> <output_dir>
# Example:
# bash scripts/step1_raw_read_qc.sh EBM1723_small test_data/EBM1723_small results/qc

set -euo pipefail  #stops if something goes wrong

#--------------------------
# User inputs
#-------------------
SAMPLE_NAME=$1
INPUT_DIR=$2
OUTPUT_DIR=$3

THREADS=4

# Path to NanoPlot executable
NANOPLOT="/mnt/data/project0026/student_data/2655065d/.conda/envs/nanoplot/bin/NanoPlot"

# -------------------------------
# Create output folders
# -----------------------------

FASTQC_OUT="${OUTPUT_DIR}/${SAMPLE_NAME}/fastqc"
NANOPLOT_OUT="${OUTPUT_DIR}/${SAMPLE_NAME}/nanoplot"

mkdir -p "$FASTQC_OUT"
mkdir -p "$NANOPLOT_OUT"

# -----------------------------
# Check input files
# ---------------------------------

echo "Checking input FASTQ files..."

FASTQ_COUNT=$(find "$INPUT_DIR" -name "*.fastq.gz" | wc -l)

if [ "$FASTQ_COUNT" -eq 0 ]; then
    echo "ERROR: No .fastq.gz files found in $INPUT_DIR"
    exit 1
fi

echo "Found $FASTQ_COUNT FASTQ files in $INPUT_DIR"

# -----------------------------
# Run FastQC
# -----------------------------

echo "Running FastQC..."

fastqc "$INPUT_DIR"/*.fastq.gz \
    -o "$FASTQC_OUT" \
    -t "$THREADS"

echo "FastQC complete. Results saved to: $FASTQC_OUT"

# -----------------------------
# Run NanoPlot
# -----------------------------

echo "Running NanoPlot..."

"$NANOPLOT" \
    --fastq "$INPUT_DIR"/*.fastq.gz \
    -o "$NANOPLOT_OUT" \
    -t "$THREADS"

echo "NanoPlot complete. Results saved to: $NANOPLOT_OUT"

# -----------------------------
# Finish
# -----------------------------

echo "Step 1 QC complete for sample: $SAMPLE_NAME"
echo "Outputs:"
echo "  FastQC:   $FASTQC_OUT"
echo "  NanoPlot: $NANOPLOT_OUT"
