#!/bin/bash
# Compute voxel overlap metrics
#   /home/jclau/GitHub/zona-analysis/scripts/manual_seg/02_calculate_voxel_overlap_template_vs_individual.sh >& /home/jclau/GitHub/zona-analysis/data/output_manual_seg_template_vs_individual/voxel_overlap_template_vs_individual.csv

in_path=~/jclauscratch/zona_manual_seg/MSTRCHT/
truth_path=~/graham/projects/rrg-akhanf/rhaast/10_ZonaIncerta/derivatives/segmentations/warped_seg/binary/
out_path=~/jclauscratch/zona_manual_seg/MSTRCHT/derivatives/


printf "subject,roi,side,intersection,union,id_vol,truth_vol\n"

for SUBJ in C002 C007 C009 C019 C029
do
  # note: RN or STN for MSTRCHT data (since no T2)
  for ROI in ZI rZI cZI fct fl ft hfields hf ml
  do
    for SIDE in L R
    do

    mkdir -p $out_path/sub-${SUBJ}
    input_label_snsx32=${in_path}/sub-${SUBJ}/sub-${SUBJ}_rater_${ROI}_${SIDE}_manual.nii.gz
    output_label_snsx32_intersection=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_intersection.nii.gz
    output_label_snsx32_union=${out_path}/sub-${SUBJ}/sub-${SUBJ}_${ROI}_${SIDE}_union.nii.gz

    fslmaths $input_label_snsx32 -mul $truth_path/sub-${SUBJ}/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin_MSTRCHT.nii.gz $output_label_snsx32_intersection
    fslmaths $input_label_snsx32 -add $truth_path/sub-${SUBJ}/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin_MSTRCHT.nii.gz -bin $output_label_snsx32_union

    curr_intersection=`fslstats $output_label_snsx32_intersection -V | cut -d' ' -f1 | xargs` 
    curr_union=`fslstats $output_label_snsx32_union -V | cut -d' ' -f1 | xargs` 
    curr_vol=`fslstats $input_label_snsx32 -V | cut -d' ' -f1 | xargs` 
    curr_truth=`fslstats $truth_path/sub-${SUBJ}/sub-${SUBJ}_exprater_${ROI}_${SIDE}_bin_MSTRCHT.nii.gz -V | cut -d' ' -f1 | xargs` 
    printf "sub-$SUBJ,$ROI,$SIDE,$curr_intersection,$curr_union,$curr_vol,$curr_truth\n"

    done
  done
done
