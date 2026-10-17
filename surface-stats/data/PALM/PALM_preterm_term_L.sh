#!/bin/bash
#SBATCH --job-name=noddi_map
#SBATCH --output=/data/project/BIPP/kaili/dHCP/DTI/cortical_micro/logs_noddi/%x_%A_%a.out
#SBATCH --error=/data/project/BIPP/kaili/dHCP/DTI/cortical_micro/logs_noddi/%x_%A_%a.err
#SBATCH --cpus-per-task=2
#SBATCH --mem=32G
#SBATCH --array=1

set -euo pipefail

# -------------------------
# Modules
# -------------------------
source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load fsl
module load palm
module list

palm -i ./left_wm_va_corr_smoothed2.10k.shape.gii \
     -m ./left.dHCP.10k.mask_fromHCP.shape.gii \
     -i ./left_DTIMD_smoothed2.10k.shape.gii \
     -m ./left.dHCP.10k.mask_fromHCP.shape.gii \
     -s ./left_average.midthickness.10k.surf.gii \
     ./left_average.midthickness_va_corr.10k.shape.gii \
     -d ./design.mat \
     -t ./design.con \
     -o ./group_comp/L_Term_Preterm \
     -T \
     -tfce2d \
     -n 20 \
     -logp \
     -corrcon \
     -corrmod