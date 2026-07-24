# CLEAN

Public code for **CLEAN** (topology-aware continual learning for generative cognitive diagnosis) on G-NCDM.

Paper: *TBD* (arXiv / venue link)

## Contents

- `CLEAN/core/` — model (`expand_topology` / LoRA / aggregation)
- `CLEAN/incremental/` — topology-aware loss + RD
- `CLEAN/experiments/` — Math1 / ASSIST a0910 / Junyi (random & user split)
- `CLEAN/baselines/` — ICDM
- `CLEAN/plot/` — paper figure scripts
- `tests/` — smoke tests

Not included: GIRT, alpha-sweep scripts, large result dumps, XES/NIPS34 extras.

## Environment

```bash
pip install -r CLEAN/requirements.txt
# EWC / DER++ also need: pip install avalanche-lib
```

Python 3.10+. CUDA recommended for a0910 / Junyi.

## Data (GitHub Release assets)

Large datasets are **not** in git. Download from this repo's
[Releases](../../releases) and unpack so paths match the runners:

| Asset (example) | Unpack to |
|-----------------|-----------|
| `math1.zip` | `CLEAN/data/` (or keep the shipped Math1 CSVs already in-tree) |
| `a0910.zip` | `data/a0910/` (repo root: `new_random_split/`, `new_user_split/`, `Q_matrix.npy`) |
| `junyi.zip` | `data/junyi/` (same layout) |

Create the root `data/` folder if missing:

```bash
mkdir -p data
# then unzip release assets into place
```

## Quick start (Math1 random split)

```bash
cd CLEAN/experiments
python run_incremental_math1_random_split.py
```

Other splits: `run_incremental_{a0910,junyi}_{random,user}_split.py`.

Non-incremental G-NCDM:

```bash
cd CLEAN
python core/run.py \
  --train_file data/math1_train_0.8_0.2.csv \
  --valid_file data/math1_valid_0.8_0.2.csv \
  --test_file data/math1_test_0.8_0.2.csv \
  --Q_matrix data/math1_Q_matrix.npy \
  --save_path ./result/math1 \
  --n_user 4209 --n_item 20 --n_know 11 \
  --user_dim 32 --item_dim 32 --alpha 0.8 \
  --training_config config/training_config_math1.json
```

## Citation

```bibtex
@article{clean2025,
  title   = {CLEAN: ...},
  author  = {...},
  year    = {2025}
}
```

## License

Add a `LICENSE` file before publishing (e.g. MIT).
