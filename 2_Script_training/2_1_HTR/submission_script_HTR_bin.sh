#!/bin/env bash
#SBATCH --partition=public-gpu
#SBATCH --time=04:00:00
#SBATCH --gpus=1
#SBATCH --output=kraken-%j.out
#SBATCH --mem=0

module load fosscuda/2020b Python/3.8.6
source ~/Sandozenv/bin/activate

work_directory="/home/users/j/jacsont/Kunsthistorisches-UZH_Archivdatenbank/HTR/Data/illustration_pages_bin_Kraken"
mkdir -p ${work_directory}
cd ${work_directory}

IMG_FOLDER="/home/users/j/jacsont/Kunsthistorisches-UZH_Archivdatenbank/HTR/Data/illustrations_pages"

echo "KETOS training"

srun kraken -I "/home/users/j/jacsont/Kunsthistorisches-UZH_Archivdatenbank/HTR/Data/illustrations_pages/*.jpg" -o .png binarize 
