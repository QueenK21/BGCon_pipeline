#!/bin/bash
# author: mgsimon@princeton.edu
# this script sets up global variables for the analysis of the current subject

set -e # stop immediately when an error occurs

# add necessary directories to the system path
#export BXH_DIR=/jukebox/ntb/packages/bxh_xcede_tools/bin #bxh doesn't work on Catalina 
#export MAGICK_HOME=/jukebox/ntb/packages/ImageMagick-6.5.9-9
#export BIAC_HOME=/jukebox/ntb/packages/BIAC_matlab/mr
#export DICOM_ARCHIVE=~/fMRI_analysis/dicom_BGCon

source scripts/subject_id.sh  # this loads the variable SUBJ
PROJ_DIR=../../
SUBJECT_DIR=$PROJ_DIR/subjects/$SUBJ

RUNORDER_FILE=run-order.txt
DICOMLIST=dicomlist.sh

DATA_DIR=data
SCRIPT_DIR=scripts
FSF_DIR=fsf
DICOM_ARCHIVE=data/dicom
NIFTI_DIR=data/nifti
QA_DIR=data/qa
BEHAVIORAL_DATA_DIR=data/behavioral
FIRSTLEVEL_DIR=analysis/firstlevel
SECONDLEVEL_DIR=analysis/secondlevel
EV_DIR=design
BEHAVIORAL_OUTPUT_DIR=output/behavioral

#FSL directory
FSL_DIR=usr/local/fsl

# Fill in below variables to fit your roi analysis -- all are used in roi.sh or scripts called within it
ROI_COORDS_FILE=design/roi.txt
LOCALIZER_DIR=analysis/firstlevel/localizer_hrf.feat
ROI_DIR=results/roi
ROI_KERNEL_TYPE=sphere
ROI_KERNEL_SIZE=4
