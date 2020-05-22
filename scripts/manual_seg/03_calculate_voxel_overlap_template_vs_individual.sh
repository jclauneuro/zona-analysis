#!/bin/bash
# Compute voxel overlap metrics
#   /home/jclau/GitHub/zona-analysis/scripts/manual_seg/02_calculate_voxel_overlap_template_vs_individual.sh >& /home/jclau/GitHub/zona-analysis/data/voxel_overlap_individual_subjects/voxel_overlap_individual_subjects.csv

in_path=~/jclauscratch/sandbox/R1/
truth_path=~/graham/project/zona/segmentations/warped_seg/
out_path=~/jclauscratch/sandbox/R1/derivatives/


printf "subject,roi,side,intersection,union,id_vol,truth_vol\n"

for SUBJ in C004 C007 C013 C016 C033
do
  for ROI in ZI rZI cZI fct fl ft hfields hf ml
  do
    for SIDE in L R
    do

    mkdir -p $out_path/sub-${SUBJ}
    input_label_snsx32=${in_path}/sub-${SUBJ}/sub-${SUBJ}_rater_${ROI}_${SIDE}_manual.nii.gz
    output_label_snsx32_intersection=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_intersection.nii.gz
    output_label_snsx32_union=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_union.nii.gz

    fslmaths $input_label_snsx32 -mul $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin.nii.gz $output_label_snsx32_intersection
    fslmaths $input_label_snsx32 -add $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin.nii.gz -bin $output_label_snsx32_union

    curr_intersection=`fslstats $output_label_snsx32_intersection -V | cut -d' ' -f1 | xargs` 
    curr_union=`fslstats $output_label_snsx32_union -V | cut -d' ' -f1 | xargs` 
    curr_vol=`fslstats $input_label_snsx32 -V | cut -d' ' -f1 | xargs` 
    curr_truth=`fslstats $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin.nii.gz -V | cut -d' ' -f1 | xargs` 
    printf "sub-$SUBJ,$ROI,$SIDE,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

    done
  done

  # different naming for STN and RN labels
  for ROI in RN STN
  do
    for SIDE in L R
    do

    mkdir -p $out_path/sub-${SUBJ}
    input_label_snsx32=${in_path}/sub-${SUBJ}/sub-${SUBJ}_rater_${ROI}_${SIDE}_manual.nii.gz
    output_label_snsx32_intersection=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_intersection.nii.gz
    output_label_snsx32_union=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_union.nii.gz

    fslmaths $input_label_snsx32 -mul $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_raters_${ROI}_${SIDE}_bin.nii.gz $output_label_snsx32_intersection
    fslmaths $input_label_snsx32 -add $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_raters_${ROI}_${SIDE}_bin.nii.gz -bin $output_label_snsx32_union

    curr_intersection=`fslstats $output_label_snsx32_intersection -V | cut -d' ' -f1 | xargs`
    curr_union=`fslstats $output_label_snsx32_union -V | cut -d' ' -f1 | xargs`
    curr_vol=`fslstats $input_label_snsx32 -V | cut -d' ' -f1 | xargs`
    curr_truth=`fslstats $truth_path/sub-${SUBJ}/binary/sub-${SUBJ}_raters_${ROI}_${SIDE}_bin.nii.gz -V | cut -d' ' -f1 | xargs`
    printf "sub-$SUBJ,$ROI,$SIDE,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

    done
  done


done
