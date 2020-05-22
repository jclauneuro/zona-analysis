#!/bin/bash
# create consensus segmentations for classic ROIs and new zona ROIs
# regularInteractive on 2019-08-10 (FSL version 5.0.10)
#   > /home/jclau/GitHub/zona-analysis/scripts/manual_seg/01_create_consensus_segmentations.sh
# majority vote for binary mask (i.e. thresholding for > 50% (0.51)

in_classic_path=/home/jclau/GitHub/zona-analysis/data/input_manual_seg/classic_ROIs/
out_classic_path=/home/jclau/GitHub/zona-analysis/data/output_consensus_seg/classic_ROIs/

in_zona_path=/home/jclau/GitHub/zona-analysis/data/input_manual_seg/zona_ROIs/
out_zona_path=/home/jclau/GitHub/zona-analysis/data/output_consensus_seg/zona_ROIs/

################################################################################################
# make classic consensus ROIs (probabilistic and binary)
################################################################################################

## first for each rater

### RN
fslmaths $in_classic_path/rater-01_ses-01_RN_L.nii.gz -add $in_classic_path/rater-01_ses-02_RN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-01_RN_L.nii.gz
fslmaths $in_classic_path/rater-02_ses-01_RN_L.nii.gz -add $in_classic_path/rater-02_ses-02_RN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-02_RN_L.nii.gz
fslmaths $in_classic_path/rater-03_ses-01_RN_L.nii.gz -add $in_classic_path/rater-03_ses-02_RN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-03_RN_L.nii.gz
fslmaths $in_classic_path/rater-01_ses-01_RN_R.nii.gz -add $in_classic_path/rater-01_ses-02_RN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-01_RN_R.nii.gz
fslmaths $in_classic_path/rater-02_ses-01_RN_R.nii.gz -add $in_classic_path/rater-02_ses-02_RN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-02_RN_R.nii.gz
fslmaths $in_classic_path/rater-03_ses-01_RN_R.nii.gz -add $in_classic_path/rater-03_ses-02_RN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-03_RN_R.nii.gz

fslmaths $out_classic_path/fuzzy/rater-01_RN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-01_RN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-01_RN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-01_RN_R_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-02_RN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-02_RN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-02_RN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-02_RN_R_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-03_RN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-03_RN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-03_RN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-03_RN_R_bin.nii.gz

fslmaths $in_classic_path/rater-01_ses-01_RN_L.nii.gz -add $in_classic_path/rater-01_ses-02_RN_L.nii.gz -add $in_classic_path/rater-02_ses-01_RN_L.nii.gz -add $in_classic_path/rater-02_ses-02_RN_L.nii.gz -add $in_classic_path/rater-03_ses-01_RN_L.nii.gz -add $in_classic_path/rater-03_ses-02_RN_L.nii.gz -div 6.0 $out_classic_path/fuzzy/raters_RN_L.nii.gz
fslmaths $in_classic_path/rater-01_ses-01_RN_R.nii.gz -add $in_classic_path/rater-01_ses-02_RN_R.nii.gz -add $in_classic_path/rater-02_ses-01_RN_R.nii.gz -add $in_classic_path/rater-02_ses-02_RN_R.nii.gz -add $in_classic_path/rater-03_ses-01_RN_R.nii.gz -add $in_classic_path/rater-03_ses-02_RN_R.nii.gz -div 6.0 $out_classic_path/fuzzy/raters_RN_R.nii.gz

fslmaths $out_classic_path/fuzzy/raters_RN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/raters_RN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/raters_RN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/raters_RN_R_bin.nii.gz

### STN
fslmaths $in_classic_path/rater-01_ses-01_STN_L.nii.gz -add $in_classic_path/rater-01_ses-02_STN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-01_STN_L.nii.gz
fslmaths $in_classic_path/rater-02_ses-01_STN_L.nii.gz -add $in_classic_path/rater-02_ses-02_STN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-02_STN_L.nii.gz
fslmaths $in_classic_path/rater-03_ses-01_STN_L.nii.gz -add $in_classic_path/rater-03_ses-02_STN_L.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-03_STN_L.nii.gz
fslmaths $in_classic_path/rater-01_ses-01_STN_R.nii.gz -add $in_classic_path/rater-01_ses-02_STN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-01_STN_R.nii.gz
fslmaths $in_classic_path/rater-02_ses-01_STN_R.nii.gz -add $in_classic_path/rater-02_ses-02_STN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-02_STN_R.nii.gz
fslmaths $in_classic_path/rater-03_ses-01_STN_R.nii.gz -add $in_classic_path/rater-03_ses-02_STN_R.nii.gz -div 2.0 $out_classic_path/fuzzy/rater-03_STN_R.nii.gz

fslmaths $out_classic_path/fuzzy/rater-01_STN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-01_STN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-01_STN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-01_STN_R_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-02_STN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-02_STN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-02_STN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-02_STN_R_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-03_STN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-03_STN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/rater-03_STN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/rater-03_STN_R_bin.nii.gz

fslmaths $in_classic_path/rater-01_ses-01_STN_L.nii.gz -add $in_classic_path/rater-01_ses-02_STN_L.nii.gz -add $in_classic_path/rater-02_ses-01_STN_L.nii.gz -add $in_classic_path/rater-02_ses-02_STN_L.nii.gz -add $in_classic_path/rater-03_ses-01_STN_L.nii.gz -add $in_classic_path/rater-03_ses-02_STN_L.nii.gz -div 6.0 $out_classic_path/fuzzy/raters_STN_L.nii.gz
fslmaths $in_classic_path/rater-01_ses-01_STN_R.nii.gz -add $in_classic_path/rater-01_ses-02_STN_R.nii.gz -add $in_classic_path/rater-02_ses-01_STN_R.nii.gz -add $in_classic_path/rater-02_ses-02_STN_R.nii.gz -add $in_classic_path/rater-03_ses-01_STN_R.nii.gz -add $in_classic_path/rater-03_ses-02_STN_R.nii.gz -div 6.0 $out_classic_path/fuzzy/raters_STN_R.nii.gz

fslmaths $out_classic_path/fuzzy/raters_STN_L.nii.gz -thr 0.51 -bin $out_classic_path/binary/raters_STN_L_bin.nii.gz
fslmaths $out_classic_path/fuzzy/raters_STN_R.nii.gz -thr 0.51 -bin $out_classic_path/binary/raters_STN_R_bin.nii.gz

################################################################################################
# make zona consensus ROIs (probabilistic and binary)
################################################################################################

fslmaths $in_zona_path/exprater_ses-01_cZI_L.nii.gz -add $in_zona_path/exprater_ses-02_cZI_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_cZI_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_cZI_R.nii.gz -add $in_zona_path/exprater_ses-02_cZI_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_cZI_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_cZI_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_cZI_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_cZI_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_cZI_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_fct_L.nii.gz -add $in_zona_path/exprater_ses-02_fct_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_fct_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_fct_R.nii.gz -add $in_zona_path/exprater_ses-02_fct_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_fct_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_fct_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_fct_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_fct_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_fct_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_fl_L.nii.gz -add $in_zona_path/exprater_ses-02_fl_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_fl_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_fl_R.nii.gz -add $in_zona_path/exprater_ses-02_fl_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_fl_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_fl_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_fl_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_fl_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_fl_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_ft_L.nii.gz -add $in_zona_path/exprater_ses-02_ft_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ft_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_ft_R.nii.gz -add $in_zona_path/exprater_ses-02_ft_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ft_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ft_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ft_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ft_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ft_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_hfields_L.nii.gz -add $in_zona_path/exprater_ses-02_hfields_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_hfields_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_hfields_R.nii.gz -add $in_zona_path/exprater_ses-02_hfields_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_hfields_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_hfields_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_hfields_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_hfields_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_hfields_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_hf_L.nii.gz -add $in_zona_path/exprater_ses-02_hf_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_hf_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_hf_R.nii.gz -add $in_zona_path/exprater_ses-02_hf_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_hf_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_hf_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_hf_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_hf_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_hf_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_ml_L.nii.gz -add $in_zona_path/exprater_ses-02_ml_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ml_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_ml_R.nii.gz -add $in_zona_path/exprater_ses-02_ml_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ml_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ml_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ml_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ml_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ml_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_rZI_L.nii.gz -add $in_zona_path/exprater_ses-02_rZI_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_rZI_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_rZI_R.nii.gz -add $in_zona_path/exprater_ses-02_rZI_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_rZI_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_rZI_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_rZI_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_rZI_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_rZI_R_bin.nii.gz

fslmaths $in_zona_path/exprater_ses-01_ZI_L.nii.gz -add $in_zona_path/exprater_ses-02_ZI_L.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ZI_L.nii.gz
fslmaths $in_zona_path/exprater_ses-01_ZI_R.nii.gz -add $in_zona_path/exprater_ses-02_ZI_R.nii.gz -div 2.0 $out_zona_path/fuzzy/exprater_ZI_R.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ZI_L.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ZI_L_bin.nii.gz
fslmaths $out_zona_path/fuzzy/exprater_ZI_R.nii.gz -thr 0.51 -bin $out_zona_path/binary/exprater_ZI_R_bin.nii.gz

