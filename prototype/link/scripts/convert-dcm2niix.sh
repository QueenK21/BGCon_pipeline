#!/bin/bash
# written by Taehoon kim. 20. 12. 18 
# edited by Kyuin Kim. 21. 01. 16. SAT 


set -e  # fail immediately on error

# source
source globals.sh
source dicomlist.sh

# define variables
run_order_file=run-order.txt
input_dir=$DICOM_ARCHIVE
output_dir=$NIFTI_DIR

make directory
if [ -d "$output_dir" ]; then
  while true; do
    read -p "data has already been converted. overwrite? (y/n) " yn
    case $yn in
      [Yy]* ) rm -rf "$output_dir" ; mkdir -p "$output_dir"; break;;
      [Nn]* ) exit;; 
    esac
  done
elif [ ! -d "$output_dir" ]; then
  mkdir "$output_dir"
fi

# convert dicom to nifti
#temp_input_dir=tmp_in
#temp_output_dir=tmp_out
number=0
for i in "$DICOMLIST"
do
    # printf $i"\n"
    let "number += 1"
    fileName="${SUBJ}_${number}"
    #dcm2niix -o OutputDir -b y (y: creating jason file with the same name as the nifti file) - r y (y: reorient yes) -f FileName(add %t = add time) DicomDirectory
    scripts/dcm2niix -o $output_dir -b y -r y -f $fileName%t $input_dir 
    # copy dicom files to temp input folder
    #cp $(find $DICOM_DIR/$SUBJ/ -type f -name "*KBRI.${i}*") $temp_input_dir
    #cd $temp_input_dir && exec scripts/dcm2niix -o $temp_output_dir -b y -r y -f $fileName 
    #rm -f $temp_input_dir/* ; cd - 
done

# move nii/jason files to NIFTI_DIR
#number=0
#for rename in `cat $run_order_file`
#do
#    let "number += 1"
##    filename_raw_nii="${SUBJ}_${number}.nii"
 #   filename_raw_json="${SUBJ}_${number}.json"
 #   fileName_nii="${SUBJ}_${rename}.nii"
 #   fileName_json="${SUBJ}_${rename}.json"
 #   mv $temp_output_dir/$filename_raw_nii $NIFTI_DIR/$fileName_nii
 #   mv $temp_output_dir/$filename_raw_json $NIFTI_DIR/$fileName_json
#done
#rm -f $temp_output_dir/*

