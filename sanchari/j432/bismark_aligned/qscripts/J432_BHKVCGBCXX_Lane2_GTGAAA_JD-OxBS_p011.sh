#!/bin/bash
#$ -cwd
#$ -N bismark_alignment
#$ -j n
#$ -l h_vmem=5.8G
#$ -pe smp 5
#$ -S /bin/bash
#$ -m e
#$ -M kith.pradhan@einstein.yu.edu

module load bismark/0.14.5 
module load bowtie2/2.2.3/gcc.4.4.7
module load samtools/1.2/gcc.4.4.7
module load picard-tools/1.92/java.1.8.0_20

SNAME=J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS_p011
FQ1=../trimmed/split/J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS.1_val_1.fq.p011
FQ2=../trimmed/split/J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS.2_val_2.fq.p011
REF=/home/kpradha1/projects/hg19/
bismark --multicore 1 --bowtie2 -p 4 /home/kpradha1/projects/hg19/ -1 ../trimmed/split/J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS.1_val_1.fq.p011 -2 ../trimmed/split/J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS.2_val_2.fq.p011 
java -jar $(which SortSam.jar) INPUT=J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS.1_val_1.fq.p011_bismark_bt2_pe.bam OUTPUT=J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS_p011_sorted.bam SO=coordinate CREATE_INDEX=true
echo "done" > J432_BHKVCGBCXX_Lane2_GTGAAA_JD-OxBS_p011.status
