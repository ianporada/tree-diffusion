# Takes too long

# sync code to cluster

rsync -v -r -a --delete ~/Research/code/tree-diffusion mila:~/

# request job

salloc --gres=gpu:l40s -c 4 --mem=16G -t 3:00:00 --partition=unkillable

# set up env

module purge
module load anaconda/3
module load cuda/12.6.0

ENV=$SCRATCH/envs/tree-diffusion/
cd ~/tree-diffusion
CONDA_OVERRIDE_CUDA=12.6 conda env create -f environment.yml -p $ENV
conda activate $ENV
pip install timm==1.0.11 pathos==0.3.3 lark==1.2.2 datrie==0.8.2
