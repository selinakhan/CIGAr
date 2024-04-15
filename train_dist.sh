GPU_NUM=1
CFG='config/cfg_odvg.py'
DATASETS='config/ukiyoe-test.json'
OUTPUT_DIR='test/'
# NNODES=${NNODES:-1}
# NODE_RANK=${NODE_RANK:-0}
# PORT=${PORT:-29500}
# MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}

# Change ``pretrain_model_path`` to use a different pretrain. 
# (e.g. GroundingDINO pretrain, DINO pretrain, Swin Transformer pretrain.)
# If you don't want to use any pretrained model, just ignore this parameter.
export TOKENIZERS_PARALLELISM=false
export CUDA_VISIBLE_DEVICES=1

python  main.py \
--output_dir ${OUTPUT_DIR} \
-c ${CFG} \
--datasets ${DATASETS}  \
--device 'cuda:0' \
--pretrain_model_path ../GroundingDINO/weights/groundingdino_swint_ogc.pth \
--options text_encoder_type=bert-base-uncased \

echo finished
