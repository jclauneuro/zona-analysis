#!/bin/bash
# Compute voxel overlap metrics (lin)
# regularInteractive
#   /home/jclau/GitHub/zona-analysis/scripts/manual_seg/02_calculate_voxel_overlap_interrater_classic.sh >& /home/jclau/GitHub/zona-analysis/data/output_manual_seg/voxel_overlap_interrater_classic.csv

in_classic_path=/home/jclau/GitHub/zona-analysis/data/input_manual_seg/classic_ROIs/
truth_classic_path=/home/jclau/GitHub/zona-analysis/data/output_consensus_seg/classic_ROIs/binary/
out_classic_path=/home/jclau/GitHub/zona-analysis/data/output_manual_seg/classic_ROIs/

SUBJ=snsx32_v0.2_i09

# start with the classics and intra-rater reliability
printf "subject,rater,session,roi,side,intersection,union,id_vol,truth_vol\n"

for rater_num in {1..3}
do

  for session_num in {1..2}
  do

  # RN
  input_label_snsx32_RN_L=${in_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_L.nii.gz
  input_label_snsx32_RN_R=${in_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_R.nii.gz

  output_label_snsx32_RN_L_intersection=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_L_intersection.nii.gz
  output_label_snsx32_RN_L_union=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_L_union.nii.gz
  output_label_snsx32_RN_R_intersection=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_R_intersection.nii.gz
  output_label_snsx32_RN_R_union=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_RN_R_union.nii.gz

  fslmaths $input_label_snsx32_RN_L -mul $truth_classic_path/raters_RN_L_bin.nii.gz $output_label_snsx32_RN_L_intersection
  fslmaths $input_label_snsx32_RN_L -add $truth_classic_path/raters_RN_L_bin.nii.gz -bin $output_label_snsx32_RN_L_union

  curr_intersection=`fslstats $output_label_snsx32_RN_L_intersection -V | cut -d' ' -f1 | xargs` 
  curr_union=`fslstats $output_label_snsx32_RN_L_union -V | cut -d' ' -f1 | xargs` 
  curr_vol=`fslstats $input_label_snsx32_RN_L -V | cut -d' ' -f1 | xargs` 
  curr_truth=`fslstats $truth_classic_path/raters_RN_L_bin.nii.gz -V | cut -d' ' -f1 | xargs` 
  printf "$SUBJ,$rater_num,$session_num,RN,left,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  fslmaths $input_label_snsx32_RN_R -mul $truth_classic_path/raters_RN_R_bin.nii.gz $output_label_snsx32_RN_R_intersection
  fslmaths $input_label_snsx32_RN_R -add $truth_classic_path/raters_RN_R_bin.nii.gz -bin $output_label_snsx32_RN_R_union

  curr_intersection=`fslstats $output_label_snsx32_RN_R_intersection -V | cut -d' ' -f1 | xargs` 
  curr_union=`fslstats $output_label_snsx32_RN_R_union -V | cut -d' ' -f1 | xargs` 
  curr_vol=`fslstats $input_label_snsx32_RN_R -V | cut -d' ' -f1 | xargs` 
  curr_truth=`fslstats $truth_classic_path/raters_RN_R_bin.nii.gz -V | cut -d' ' -f1 | xargs` 
  printf "$SUBJ,$rater_num,$session_num,RN,right,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  # STN
  input_label_snsx32_STN_L=${in_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_L.nii.gz
  input_label_snsx32_STN_R=${in_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_R.nii.gz

  output_label_snsx32_STN_L_intersection=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_L_intersection.nii.gz
  output_label_snsx32_STN_L_union=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_L_union.nii.gz
  output_label_snsx32_STN_R_intersection=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_R_intersection.nii.gz
  output_label_snsx32_STN_R_union=${out_classic_path}/rater-0${rater_num}_ses-0${session_num}_STN_R_union.nii.gz

  fslmaths $input_label_snsx32_STN_L -mul $truth_classic_path/raters_STN_L_bin.nii.gz $output_label_snsx32_STN_L_intersection
  fslmaths $input_label_snsx32_STN_L -add $truth_classic_path/raters_STN_L_bin.nii.gz -bin $output_label_snsx32_STN_L_union

  curr_intersection=`fslstats $output_label_snsx32_STN_L_intersection -V | cut -d' ' -f1 | xargs`
  curr_union=`fslstats $output_label_snsx32_STN_L_union -V | cut -d' ' -f1 | xargs`
  curr_vol=`fslstats $input_label_snsx32_STN_L -V | cut -d' ' -f1 | xargs`
  curr_truth=`fslstats $truth_classic_path/raters_STN_L_bin.nii.gz -V | cut -d' ' -f1 | xargs`
  printf "$SUBJ,$rater_num,$session_num,STN,left,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  fslmaths $input_label_snsx32_STN_R -mul $truth_classic_path/raters_STN_R_bin.nii.gz $output_label_snsx32_STN_R_intersection
  fslmaths $input_label_snsx32_STN_R -add $truth_classic_path/raters_STN_R_bin.nii.gz -bin $output_label_snsx32_STN_R_union

  curr_intersection=`fslstats $output_label_snsx32_STN_R_intersection -V | cut -d' ' -f1 | xargs`
  curr_union=`fslstats $output_label_snsx32_STN_R_union -V | cut -d' ' -f1 | xargs`
  curr_vol=`fslstats $input_label_snsx32_STN_R -V | cut -d' ' -f1 | xargs`
  curr_truth=`fslstats $truth_classic_path/raters_STN_R_bin.nii.gz -V | cut -d' ' -f1 | xargs`
  printf "$SUBJ,$rater_num,$session_num,STN,right,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

  done
done
