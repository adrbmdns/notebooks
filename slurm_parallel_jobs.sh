#!/bin/bash 
#SBATCH --job-name=trim_sponge
#SBATCH --output=/mnt/data/wright/home/scratch/u1133824/trim_sponge_2.out
#SBATCH --error=/mnt/data/wright/home/scratch/u1133824/trim_sponge_2.err
#SBATCH --partition=Standard
#SBATCH --ntasks=22
#SBATCH --mem=22G
#SBATCH --cpus-per-task=1
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=jiajia.li1@anu.edu.au
#SBATCH --mail-type=ALL

source /opt/conda/bin/activate /mnt/data/wright/home/u1133824/.conda/envs/ecoli-vc

home_dir=/mnt/data/wright/home/scratch/u1133824
data_dir=/mnt/data/wright/home/scratch/u1133824/sponge-data
trimmed_dir=/mnt/data/wright/home/scratch/u1133824/trimmed-fastq

NexteraPE=/mnt/data/wright/home/u1133824/.conda/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2/adapters/NexteraPE-PE.fa

base_names=$(cat /mnt/data/wright/home/scratch/u1133824/base_names_23_44.txt)

for i in $base_names 
do

fq1=${data_dir}/${i}_R1_001.fastq.gz
fq2=${data_dir}/${i}_R2_001.fastq.gz
trimmed_fq1=${trimmed_dir}/${i}_1.trim.fastq.gz
trimmed_fq2=${trimmed_dir}/${i}_2.trim.fastq.gz
removed_fq1=${trimmed_dir}/${i}_1un.trim.fastq.gz
removed_fq2=${trimmed_dir}/${i}_2un.trim.fastq.gz

srun -N1 -n1 -c1 --exclusive --mem=1G trimmomatic PE -threads 1 $fq1 $fq2 \
                    $trimmed_fq1 $removed_fq1 \
                    $trimmed_fq2 $removed_fq2 \
                    SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:${NexteraPE}:2:40:15 &

sleep 10

done 

wait 
