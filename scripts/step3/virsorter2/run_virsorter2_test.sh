# VirSorter2-test

This repository is for testing VirSorter2 as part of a bacteriophage discovery project.

## Aim

The aim of this test repository is to check whether VirSorter2 can identify viral/phage sequences from small example datasets before applying the workflow to larger environmental metagenomic datasets.

## Current test

Initial test dataset:

- `australia_vibrio_phage_refs.fasta`

Initial command tested:

```bash
virsorter run \
  -w virsorter2_output \
  -i australia_vibrio_phage_refs.fasta \
  --min-length 1500 \
  -j 4 \
  all
