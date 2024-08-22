# CIGAr

This repository contains the code used for training the CIGAr model from the paper "Context-Infused Visual Grounding for Art" from the ECCV 2024 VISART workshop.  

For data preparation and code setup, please follow the instructions from the original [third-party GroundingDINO implementation](https://github.com/longzw1997/Open-GroundingDino) 

## Configs
In`config/`, the dataset specifications and model configurations for all datasets used in this researched are included for clarity. 

## Training and Testing
Training CIGAr follows the same method as the third party implemenation, but with some additional command line arguments. The `example_script.job` slurm job script is provided as an example for training and testing. 

Additional arguments are used as follows:

 - `--use_wandb` flag allows for wandb logging.
 - `--training_config`  includes two options: 
	 - `[od]` for the original GroundingDINO model as used for training on object detection data.
	 - `[vg]` for the CIGAr model, which uses the descriptions included in the grounding datasets.
 - `--combine_stage` includes two options:
	 - `[beginning]` merges the image descriptions before the image and text features are fused. Experiments demonstrated that this method works best and is preferred.
	 - `[before_matching]` merges the image description before the text/region alignment stage. Experiments demonstrated this method to perform sub-par, but it was left in the implementation.
 - `--dataset` dataset(s) used to train/evaluate. Used for wandb logging. 
 - For training CIGAr, `text_encoder_type=[path/to/finetuned_bert/]` should be specified under the `--options` argument, and can be replaced with any fine-tuned BERT encoder. Providing any other model than `bert-base-uncased` initializes a new trainable layer for mapping the text features. 

