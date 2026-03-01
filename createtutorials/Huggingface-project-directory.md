**Title:** Huggingface Project Directory
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Huggingface-project-directory.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

HuggingFace CLI Commands

Auth Command: `hf auth login`

**HuggingFace Project Directory**

```bash
    cd /home/srhills/myenv-hf

Activate the Virtual Environment:
    source .venv/bin/activate
    ~/myenv-hf master
```bash

collections          Interact with collections on the Hub.
  datasets             Interact with datasets on the Hub.
  download             Download files from the Hub.
  endpoints            Manage Hugging Face Inference Endpoints.
  jobs                 Run and manage Jobs on the Hub.
  models               Interact with models on the Hub.
  papers               Interact with papers on the Hub.
  repo                 Manage repos on the Hub.
  repo-files           Manage files in a repo on the Hub.
  skills               Manage skills for AI assistants.
  spaces               Interact with spaces on the Hub.
  upload               Upload a file or a folder to the Hub.
  upload-large-folder  Upload a large folder to the Hub.

Help commands:
  env      Print information about the environment.
  version  Print information about the hf version.

Examples
  $ hf download meta-llama/Llama-3.2-1B-Instruct
$ hf download meta-llama/Llama-3.2-1B-Instruct config.json
tokenizer.json
$ hf download meta-llama/Llama-3.2-1B-Instruct --include "*.safetensors"
  --exclude "*.bin"
$ hf download meta-llama/Llama-3.2-1B-Instruct --local-dir
./models/llama
  $ hf upload my-cool-model . .
  $ hf upload Wauplin/my-cool-model ./models/model.safetensors
  $ hf upload Wauplin/my-cool-dataset ./data /train --repo-type=dataset
$ hf upload Wauplin/my-cool-model ./models . --commit-message="Epoch
34/50"
  --commit-description="Val accuracy: 68%"
  $ hf upload bigcode/the-stack . . --repo-type dataset --create-pr
  $ hf upload-large-folder Wauplin/my-cool-model ./large_model_dir
$ hf upload-large-folder Wauplin/my-cool-model ./large_model_dir
--revision
  v1.0

Learn more
  Use `hf <command> --help` for more information about a command.
  Read the documentation at
  https://huggingface.co/docs/huggingface_hub/en/guides/cli
