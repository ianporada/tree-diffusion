# use

#
salloc --gres=gpu:l40s -c 4 --mem=16G -t 3:00:00 --partition=unkillable
#

module purge
module load anaconda/3
module load cuda/12.6.0

ENV=$SCRATCH/envs/td/
conda activate $ENV


# Eval takes 30 minutes on an L40S
# writes to evals
cd ~/tree-diffusion
export PYTHONPATH=.
ASSETS_DIR=$SCRATCH/tree-diffusion/assets
python scripts/eval_td_search.py \
    --checkpoint_name $ASSETS_DIR/td_csg2da.pt \
    --ar_checkpoint_name $ASSETS_DIR/ar_csg2da.pt \
    --problem_filename $ASSETS_DIR/csg2da_test_set.pkl


# ~ 10GB VRAM
CHECKPOINT_DIR=$SCRATCH/tree-diffusion/checkpoints
mkdir -p $CHECKPOINT_DIR
python scripts/train.py \
    --env csg2da \
    --batch_size 32 \
    --num_workers 4 \
    --max_primitives 8 \
    --n_layers 8 \
    --d_model 256 \
    --num_heads 16 \
    --test_every 1000 \
    --forward_mode path \
    --checkpoint_dir $CHECKPOINT_DIR
