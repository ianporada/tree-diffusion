# create

module purge
module load anaconda/3
module load cuda/12.6.0

ENV=$SCRATCH/envs/td/
CONDA_OVERRIDE_CUDA=12.6 conda create -y -p $ENV python=3.11 pytorch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 pytorch-cuda=12.4 -c pytorch -c nvidia
conda activate $ENV

conda install -y --freeze-installed hydra-core==1.3.2 wandb==0.18.5 tqdm==4.66.6 scipy==1.14.1 lz4==4.3.2 timm==1.0.11 pathos==0.3.3 lark==1.2.2 datrie==0.8.2 -c conda-forge
conda install -y --freeze-installed absl-py==2.1.0 -c conda-forge
# TODO: make a single install statement
pip install git+https://github.com/revalo/iceberg.git
