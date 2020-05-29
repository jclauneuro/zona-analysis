#!/bin/bash

# to be run in the root dir of snsx32_to_MNI2009b
MNI152_nii=/scratch/jclau/zona_OSF/OSF_sandbox/snsx32_to_MNI2009b/input_snsx32/sub-MNI2009b_T1w.nii.gz
indir=/scratch/jclau/zona_OSF/OSF/SNSX32NLin2020Asym/
indirbin=${indir}/binary/
outdir=./output_snsx32_to_MNI2009b/
outdirbin=${outdir}/SNSX32NLin2020Asym_space-MNI152NLin2009bAsym/binary/

mkdir -p $outdirbin

while read infile; do
#  infile=sub-SNSX32NLin2020Asym_hemi-L_desc-cZI_mask.nii.gz
  infilename="${infile#sub-*_}"

  echo antsApplyTransforms -d 3 -i $indirbin/$infile -o $outdirbin/SNSX32NLin2020Asym_space-MNI152NLin2009bAsym_${infilename}.nii.gz -r $MNI152_nii -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt -n NearestNeighbor
  antsApplyTransforms -d 3 -i $indirbin/$infile -o $outdirbin/SNSX32NLin2020Asym_space-MNI152NLin2009bAsym_${infilename}.nii.gz -r $MNI152_nii -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt -n NearestNeighbor

done < "binary_files.txt"
