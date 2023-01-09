#!/bin/env bash
#SBATCH --partition=public-gpu
#SBATCH --time=48:00:00
#SBATCH --gpus=1
#SBATCH --output=kraken-%j.out
#SBATCH --mem=0

module load fosscuda/2020b Python/3.8.6
source ~/Topenv/bin/activate

work_directory="/home/users/j/jacsont/Kunsthistorisches-UZH_Archivdatenbank/HTR/Models/HTR_ManuscriptLines+Lectaurep"
mkdir -p ${work_directory}
cd ${work_directory}

OUTPUT_NAME="M_lines+Lectaurep"
XML_FOLDER="/home/users/j/jacsont/Kunsthistorisches-UZH_Archivdatenbank/HTR/Data/ManuscriptLines/**/"

echo "KETOS training"
srun ketos train -f alto -d cuda "${XML_FOLDER}/*.xml"


