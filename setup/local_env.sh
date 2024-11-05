ENV=~/Research/envs/td
python -m venv $ENV
source $ENV/bin/activate

pip install --upgrade pip
pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1
pip install hydra-core==1.3.2 wandb==0.18.5 tqdm==4.66.6 scipy==1.14.1 \
    lz4==4.3.2 timm==1.0.11 pathos==0.3.3 lark==1.2.2 \
    datrie==0.8.2 absl-py==2.1.0

pip freeze > setup/local_requirements.txt