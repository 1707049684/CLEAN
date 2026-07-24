#!/usr/bin/env bash
# a0910 random_split epoch curves -> one ACC_new|ACC_old figure (default ep25).
#
#   cd GNCDM
#   bash scripts/run_a0910_epoch_curve.sh
#   bash scripts/run_a0910_epoch_curve.sh 25 cuda:0
set -euo pipefail
cd "$(dirname "$0")/.."
EPOCHS="${1:-25}"
DEVICE="${2:-cuda:0}"
export CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-${DEVICE#cuda:}}"

echo "[1/3] GNCDM (CLEAN-Full / Full-Replay / X-DER / C-LoRA-GNCDM) ep=${EPOCHS}"
python plot/plot_epoch_curve_gncdm_a0910.py --epochs "$EPOCHS"

echo "[2/3] Avalanche (EWC lambda=10000 / DER++)"
python plot/plot_epoch_curve_avalanche_a0910.py --epochs "$EPOCHS"

echo "[3/3] Merge panels -> one figure"
python plot/plot_epoch_curve_final_a0910.py --epochs "$EPOCHS"

echo "Done: incremental_result/epoch_curve_a0910_random_split_final_ep${EPOCHS}.png"
