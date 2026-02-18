**Title:** Common Ollama Interactive Commands
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Common-ollama-interactive-commands.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Common Ollama Cli Interactive Commands

COMMON-OLLAMA-INTERACTIVE-COMMANDS:

    /set parameter <name> <value> – e.g., temp, num_ctx
    /show info – model details
    /save <session> and /load <session>
    /bye or /exit

Managing Your Ollama Models

    List models:
    ollama list
    Show detailed info:
    ollama show llama3.2:8b-instruct-q5_K_M
    Delete model:
    ollama rm mistral:7b
    Copy/rename model:
    ollama cp llama3.2 my-custom-llama3.2
    Check loaded models:
    ollama ps

**Choosing the Right Ollama Model for Your Use Case**

Selection depends on:

    Task:
        General chat: llama3.2, mistral, gemma3
        Coding: codellama, phi4, starcoder2
        Summarization/analysis: instruction-tuned models
        Multimodal/image: llava, moondream
    Hardware:
        8GB RAM: Small/quantized (1B–3B)
        16GB RAM: 7B/8B quantized
        32GB+ RAM: 13B or larger
    Quality vs. Speed:
        Less quantization = higher quality, more RAM/VRAM needed
        More quantization = smaller, faster, less resource use

Recommended starting points for most teams:

    llama3.2:8b-instruct-q5_K_M or mistral:7b-instruct-v0.2-q5_K_M
    For low-resource: phi4-mini:q4_K_M
    For coding: codellama:7b-instruct-q5_K_M
    For vision: llava:13b (if hardware allows)

Test several and measure against your real prompts and workloads.
Understanding Context Length in Ollama
What is num_ctx?

The context window: How many tokens the model can “see” at once (prompts
+ history).
Why it matters: Longer context = better handling of long chats,
documents, or code blocks.
Limits: Each model has a max value (e.g., 4096, 8192, 32k). Setting
above the trained limit can cause issues; lower is always safe.

See default with:
ollama show <model>: look for num_ctx

Adjust context:

    In interactive mode: /set parameter num_ctx 8192
    By API: JSON options
    In a custom Modelfile: PARAMETER num_ctx 8192

**Key Ollama Model Parameters**

temperature: Controls creativity (0.2 = deterministic, 1.0+ = more
random)
    top_p: Nucleus sampling, restricts to most likely tokens
    top_k: Limits to top-k probable tokens
    num_predict: Max tokens to generate in a response
    stop: When to halt generation (e.g., after code block)
    repeat_penalty, seed, etc.: Fine-grained controls

Set parameters:

    Temporarily with /set parameter
    Per-request in API JSON
    Persistently in Modelfile

Integrating with Ollama’s REST API

Ollama’s API enables automated and production integration:

API Endpoints:

    POST /api/generate — single prompt completion
    POST /api/chat — conversational context
    POST /api/embeddings — semantic vectors for text
    GET /api/tags — list local models
    POST /api/pull, /api/delete, etc. — manage models

Basic example:

curl http://localhost:11434/api/generate -d '{
  "model": "phi4-mini",
  "prompt": "Write a short Python function to calculate factorial:",
  "stream": false,
  "options": {"temperature": 0.3, "num_predict": 80}
}'

Streaming and full chat API supported.
Works with any HTTP client—curl, Postman, or API platforms like Apidog
for automated testing and documentation.
OpenAI Compatibility

Ollama’s /v1/ endpoints mimic OpenAI’s API, so you can drop it in as a
local replacement.

    Update your OpenAI client’s base_url to http://localhost:11434/v1
    Use any string for api_key (“ollama”)

Python example:

from openai import OpenAI

client = OpenAI(base_url="http://localhost:11434/v1", api_key="ollama")
chat_completion = client.chat.completions.create(
    model="llama3.2",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Explain the difference between Ollama and
llama.cpp."},
    ],
    temperature=0.7,
    max_tokens=250,
    stream=False
)

This allows you to test and swap between local and cloud LLMs with
minimal code change.
Advanced Customization: Modelfiles, GGUF, Safetensors, and Quantization
Modelfile: The Blueprint for Custom Models

A Modelfile lets you:

Specify a base model (FROM llama3.2:8b-instruct-q5_K_M, or path to
GGUF/Safetensors)
    Set default parameters (e.g., PARAMETER temperature 0.7)
    Define system prompts or prompt templates
    Add adapters (LoRA/QLoRA) for fine-tuning

Example:

FROM ./zephyr-7b-beta.Q5_K_M.gguf
TEMPLATE """<|system|>
{{ .System }}</s>
<|user|>
{{ .Prompt }}</s>
<|assistant|>
{{ .Response }}</s>
"""
PARAMETER num_ctx 4096
SYSTEM "You are a friendly chatbot."

Build with:
ollama create my-zephyr-gguf -f ZephyrImport.modelfile
Importing External Models

GGUF: Download .gguf file, reference in Modelfile (FROM ./model.gguf)
    Safetensors: Point to directory with all required files
LoRA adapters: Use ADAPTER /path/to/adapter/ in Modelfile; base model
must match

**Quantizing Models**

Reduce RAM/VRAM use by quantizing during ollama create:

ollama create my-quantized-model-q4km -f MyModelfile -q q4_K_M

Popular quantization levels:

    q4_K_M, q5_K_M, q8_0 (balance size/speed/quality)
More quantization = smaller, faster, but potentially slight quality loss

Sharing Your Custom Ollama Models

    Create an Ollama account and link your local public key.
    Namespace your model: yourusername/modelname
    Push to the registry:
    ollama push yourusername/modelname

Others can then pull and run your model directly.
Optimizing Ollama Performance with GPU Acceleration

NVIDIA: Use proprietary drivers; CUDA Compute Capability 5.0+ required
    AMD: Adrenalin (Win), ROCm (Linux); RX 6000+ series supported
    Apple Silicon: GPU acceleration via Metal works out of the box

Verify usage:
Run ollama ps during inference; gpu or cpu indicates processor.

Multi-GPU control:
Set CUDA_VISIBLE_DEVICES (NVIDIA) or ROCR_VISIBLE_DEVICES (AMD) before
starting Ollama.
Fine-Tuning Ollama with Environment Variables

Key variables:

    OLLAMA_HOST: API server IP/port (default: 127.0.0.1:11434)
    OLLAMA_MODELS: Custom model storage path
    OLLAMA_ORIGINS: Allowed CORS origins for web UIs
    OLLAMA_DEBUG: Enable detailed logging
    OLLAMA_KEEP_ALIVE: Model RAM retention period

Set via:

    launchctl for macOS apps
    systemd override (systemctl edit ollama.service) for Linux
    Windows Environment Variables dialog
    Docker -e flags
    Inline for manual runs:
    OLLAMA_DEBUG=1 ollama serve

Restart Ollama after changes to apply.

**Troubleshooting Ollama**

How to Check Logs

    macOS: ~/.ollama/logs/server.log
    Linux (systemd): journalctl -u ollama
    Windows: %LOCALAPPDATA%\Ollama\server.log
    Docker: docker logs my_ollama
    Manual: Terminal output

Enable debug logs with OLLAMA_DEBUG=1.

**Common Issues and Fixes**

Port conflict (listen tcp 127.0.0.1:11434: bind: address already in
use):
Kill the existing process using the port, or set OLLAMA_HOST to a
different port.
    GPU not detected:
Update drivers, check hardware compatibility, verify permissions, or
force CPU use for diagnostics.
    Permission errors:
        Ensure correct ownership of model directories.
    Slow downloads:
        Verify internet connection, proxy settings, and firewall rules.
    Terminal output issues (Windows):
        Use Windows Terminal or update Windows 10.

If stuck, collect logs, environment info, and error messages, then
consult the Ollama community or GitHub issues.

**Uninstalling Ollama**

macOS

Quit Ollama, remove Ollama.app from Applications, and delete ~/.ollama.

Windows

Uninstall via “Apps”, delete %USERPROFILE%\.ollama, and remove
environment variables if set.

Linux (systemd/manual)

Stop and disable the service, remove the binary and service file, delete
model data directory. Use caution with sudo rm -rf.

Docker

Stop and remove container/image; docker volume rm ollama_data to delete
models (irreversible).

Conclusion: Unlock Local AI for API Development

Ollama bridges the gap between raw LLM engines and developer-friendly
workflows, letting you run advanced models securely, cost-effectively,
and flexibly on your own hardware. With robust command-line tools, APIs,
and customization options, Ollama is ideal for API developers, backend
teams, and anyone building AI-powered products where privacy, control,
and integration matter.

Experiment
