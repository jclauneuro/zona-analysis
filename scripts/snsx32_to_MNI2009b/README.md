snsx32 to MNI2009bAsym space
(command line calls and transforms by Y. Xiao, 2020)

```
# created by Xiao
flirt -in snsx32_v0.2_i09_avg_T1w_brain.nii.gz -ref mni_icbm152_t1_tal_nlin_asym_09b_brain.nii.gz -dof 12 -out snsx32-to-icbm2009b.nii.gz -omat snsx32-to-icbm2009b.mat
antsRegistration -d 3 -o snsx32-to-icbm2009Asym-T1w -m CC[mni_icbm152_t1_tal_nlin_asym_09b.nii,snsx32-to-icbm2009bAsym-T1w.nii.gz,1,4] -s 5x4x2x1vox -f 10x8x4x2 -c [150x120x80x40,1e-6,10] -t BSplineSyN[0.1,26,0,3] -x [mni_icbm152_t1_tal_nlin_asym_09b_mask.nii, snsx32_mask.nii]
antsApplyTransforms -d 3 -i snsx32_v0.2_i09_avg_T1w.nii.gz  -o out.nii.gz -r mni_icbm152_t1_tal_nlin_asym_09b.nii -t snsx32-to-icbm2009Asym0Warp.nii.gz snsx32-to-icbm2009b.txt
```
```
# applying of transforms for all relevant files
antsApplyTransforms -d 3 -i input_snsx32/snsx32_v0.2_i09_avg_T1w.nii.gz -o output_snsx32_to_MNI2009b/snsx32_to_MNI2009b_T1w.nii.gz -r input_snsx32/sub-MNI2009b_T1w.nii.gz -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt 
antsApplyTransforms -d 3 -i input_snsx32/snsx32_v0.2_i09_avg_T1map.nii.gz -o output_snsx32_to_MNI2009b/snsx32_to_MNI2009b_T1map.nii.gz -r input_snsx32/sub-MNI2009b_T1w.nii.gz -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt 
antsApplyTransforms -d 3 -i input_snsx32/snsx32_v0.2_i09_avg_R1map.nii.gz -o output_snsx32_to_MNI2009b/snsx32_to_MNI2009b_R1map.nii.gz -r input_snsx32/sub-MNI2009b_T1w.nii.gz -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt 
antsApplyTransforms -d 3 -i input_snsx32/snsx32_v0.2_i09_avg_T2w.nii.gz -o output_snsx32_to_MNI2009b/snsx32_to_MNI2009b_T2w.nii.gz -r input_snsx32/sub-MNI2009b_T1w.nii.gz -t transforms/snsx32-to-icbm2009Asym-T1w0Warp.nii.gz transforms/snsx32-to-icbm2009b.txt 
```

```
# scripts to automate this a bit more
./transform_labels_bin.sh >& binary_files.log
./transform_labels_fuzzy.sh >& fuzzy_files.log
```

ANTs Version: 2.1.0.post667-g7c7fd

