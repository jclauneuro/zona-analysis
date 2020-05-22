#!/bin/bash
# Compute voxel overlap metrics (lin)
# regularInteractive
#   /home/jclau/GitHub/zona-analysis/scripts/manual_seg/02_calculate_voxel_overlap_intrarater_zonas.sh >& /home/jclau/GitHub/zona-analysis/data/output_manual_seg/voxel_overlap_intrarater_zona.csv

in_zona_path=/home/jclau/GitHub/zona-analysis/data/input_manual_seg/zona_ROIs/
truth_zona_path=/home/jclau/GitHub/zona-analysis/data/output_consensus_seg/zona_ROIs/binary/
out_zona_path=/home/jclau/GitHub/zona-analysis/data/output_manual_seg/zona_ROIs/

rater=exprater

SUBJ=snsx32_v0.2_i09

# start with the zonas and intra-rater reliability
printf "subject,rater,session,roi,side,intersection,union,id_vol,truth_vol\n"

  for session_num in {1..2}
  do

  # ${structure}

  for structure in ml hfields hf ft fl fct cZI rZI ZI
  do
  input_label_snsx32_structure_L=${in_zona_path}/exprater_ses-0${session_num}_${structure}_L.nii.gz
  input_label_snsx32_structure_R=${in_zona_path}/exprater_ses-0${session_num}_${structure}_R.nii.gz

  output_label_snsx32_structure_L_intersection=${out_zona_path}/exprater_ses-0${session_num}_${structure}_L_intersection.nii.gz
  output_label_snsx32_structure_L_union=${out_zona_path}/exprater_ses-0${session_num}_${structure}_L_union.nii.gz
  output_label_snsx32_structure_R_intersection=${out_zona_path}/exprater_ses-0${session_num}_${structure}_R_intersection.nii.gz
  output_label_snsx32_structure_R_union=${out_zona_path}/exprater_ses-0${session_num}_${structure}_R_union.nii.gz

  fslmaths $input_label_snsx32_structure_L -mul $truth_zona_path/exprater_${structure}_L_bin.nii.gz $output_label_snsx32_structure_L_intersection
  fslmaths $input_label_snsx32_structure_L -add $truth_zona_path/exprater_${structure}_L_bin.nii.gz -bin $output_label_snsx32_structure_L_union

  curr_intersection=`fslstats $output_label_snsx32_structure_L_intersection -V | cut -d' ' -f1 | xargs` 
  curr_union=`fslstats $output_label_snsx32_structure_L_union -V | cut -d' ' -f1 | xargs` 
  curr_vol=`fslstats $input_label_snsx32_structure_L -V | cut -d' ' -f1 | xargs` 
  curr_truth=`fslstats $truth_zona_path/exprater_${structure}_L_bin.nii.gz -V | cut -d' ' -f1 | xargs` 
  printf "$SUBJ,$rater,$session_num,${structure},left,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  fslmaths $input_label_snsx32_structure_R -mul $truth_zona_path/exprater_${structure}_R_bin.nii.gz $output_label_snsx32_structure_R_intersection
  fslmaths $input_label_snsx32_structure_R -add $truth_zona_path/exprater_${structure}_R_bin.nii.gz -bin $output_label_snsx32_structure_R_union

  curr_intersection=`fslstats $output_label_snsx32_structure_R_intersection -V | cut -d' ' -f1 | xargs` 
  curr_union=`fslstats $output_label_snsx32_structure_R_union -V | cut -d' ' -f1 | xargs` 
  curr_vol=`fslstats $input_label_snsx32_structure_R -V | cut -d' ' -f1 | xargs` 
  curr_truth=`fslstats $truth_zona_path/exprater_${structure}_R_bin.nii.gz -V | cut -d' ' -f1 | xargs` 
  printf "$SUBJ,$rater,$session_num,${structure},right,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  done
  done
