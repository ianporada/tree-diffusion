# Fails when install datrie because no clang / llvm

# create venv

module purge
module load cuda/12.6.0

ENV=$SCRATCH/envs/uvtd/
uv venv $ENV --python 3.12
source $ENV/bin/activate

uv pip install torch==2.5.0+cu124 torchvision==0.20+cu124 torchaudio==2.5.0+cu124 --extra-index-url https://download.pytorch.org/whl/cu124
export AR=/usr/bin/ar
CC=gcc CXX=g++ uv pip install tqdm wandb scipy lz4 timm==1.0.11 pathos==0.3.3 lark==1.2.2 datrie==0.8.2
