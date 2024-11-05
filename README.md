# Tree Diffusion

![Website](https://img.shields.io/website?url=https%3A%2F%2Ftree-diffusion.github.io)

[Homepage](https://tree-diffusion.github.io) | [Paper](https://arxiv.org/abs/2405.20519) | [BibTeX](https://tree-diffusion.github.io/#citation)

<p align="center">
  <img src="images/sketch8.gif" height="300">
</p>

## Structure

The main code base is in the `td/` directory. Languages are implemented in `td/environments`, mutation and tree path-finding is implemented in `td/samplers/mutator.py`, and our generic grammar implementation is in `td/grammar.py`

All model weights are in `assets/`.

## Setup

### Download Model Weights

Please download all model weights from [this link](https://github.com/revalo/tree-diffusion/releases/download/model-weights/assets.zip), and place them in a new folder called `assets/` in the root directory of this repository.


### Dependencies

Use Python 3.11.

Install requirements,

```
pip install -r requirements.txt
```

#### Direct Depedencies

* python==3.11
* torch==2.1.2+cu121
* tqdm, wandb, 
* iceberg-dsl @ git+https://github.com/revalo/iceberg.git@db446c1ed
* timm==1.0.3 (vision models)
* scipy==1.13.0
* pathos==0.3.3.dev0 (multiprocessing)
* lz4==4.3.3
* lark==1.1.9 (parsing toolkit)
* datrie (0.8.2)
* absl_py==1.4.0 (app)
* iceberg-dsl @ git+https://github.com/revalo/iceberg.git@db446c1ed



### Usage

Ensure `PYTHONPATH` is correct,

On Linux/Mac,

```
export PYTHONPATH=.
```

On Windows,

```
set PYTHONPATH=.
```

First test your setup,

```
python scripts/test_setup.py
```

For evaluation,

```
python scripts/eval_td_search.py --checkpoint_name assets/td_csg2da.pt --ar_checkpoint_name assets/ar_csg2da.pt --problem_filename assets/csg2da_test_set.pkl
```

Evaluation should print results alongside output number of steps to solve problems in a new `evals/` directory.

For training,

```
python scripts/train.py --env csg2da --batch_size 32 --num_workers 16 --max_primitives 8 --n_layers 8 --d_model 256 --num_heads 16 --test_every 1000 --forward_mode path --nowandb
```
