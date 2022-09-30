#!/bin/bash
set -xe 

# seq 0 14 | xargs -P15 -I{} bash scDRS_batch_nofilter_adj-prop_pbmc.sh {}

mkdir -p ../scanpy/pbmc/scDRS_nofilter_adj-prop

scdrs compute-score \
    --h5ad-file ../scanpy/pbmc/pbmc.h5ad \
    --h5ad-species human \
    --gs-file ../data/gs_file/magma_10kb_top1000_zscore.75_traits.batch/batch${1}.gs \
    --gs-species human \
    --cov-file ../scanpy/pbmc/pbmc.cov.tsv \
    --flag-filter-data False \
    --flag-raw-count True \
    --flag-return-ctrl-raw-score False \
    --flag-return-ctrl-norm-score True \
    --adj-prop cell_type \
    --out-folder ../scanpy/pbmc/scDRS_nofilter_adj-prop

