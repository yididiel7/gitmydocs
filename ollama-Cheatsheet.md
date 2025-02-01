# Ollama Cheatsheet

Here is a comprehensive Ollama cheat sheet containing most often used commands and explanations:

## Installation and Setup

### macOS
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

### Windows
Download [Ollama for Windows](https://ollama.com/download/windows)

### Linux
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

### Docker
Use the official image available at [ollama/ollama](https://hub.docker.com/r/ollama/ollama) on Docker Hub.

## Running Ollama

Start Ollama:
```bash
ollama serve
```

Run a specific model:
```bash
ollama run <model_name>
```

## Model Library and Management

List available models:
```bash
ollama list
```

Pull a model:
```bash
ollama pull <model_name>
```

Create a model:
```bash
ollama create <model_name> -f <model_file>
```

Remove a model:
```bash
ollama rm <model_name>
```

Copy a model:
```bash
ollama cp <source_model> <new_model>
```

## Advanced Usage

### Multimodal Input
Use multimodal input by wrapping multiline text in triple quotes (""") and specifying image paths directly in the prompt.

### REST API Examples

Generate a response:
```bash
curl http://localhost:11434/api/generate -d '{"model": "<model_name>", "prompt": "<prompt>"}'
```

Chat with a model:
```bash
curl http://localhost:11434/api/chat -d '{"model": "<model_name>", "messages": [{"role": "user", "content": "<message>"}]}'
```

## VS Code Integration

Start Ollama:
```bash
ollama serve
```

Run a model:
```bash
ollama run <model_name>
```

## AI Developer Scripts

- [ai_review](https://github.com/ikramhasan/AI-Dev-Scripts/blob/main/scripts/ai_review.sh): Code review & suggestions
- [ai_commit](https://github.com/ikramhasan/AI-Dev-Scripts/blob/main/scripts/ai_commit.sh): Commit message generator
- [ai_readme](https://github.com/ikramhasan/AI-Dev-Scripts/blob/main/scripts/ai_readme.sh): README generator
- [ai_pr](https://github.com/ikramhasan/AI-Dev-Scripts/blob/main/scripts/ai_pr.sh): PR review generator

## Tools & Integrations

- [Lobe Chat](https://github.com/lobehub/lobe-chat): Modern LLM chat framework
- [LangChain](https://github.com/langchain4j/langchain4j): Java LangChain implementation
- [AI Vtuber](https://github.com/Soulter/AiVtuber): Virtual YouTuber with Ollama
- [VS Code AI Completion](https://marketplace.visualstudio.com/items?itemName=JiangWeixian.vscode-ai-completion): Code completion plugin

## Community & Resources

- [Reddit Community](https://www.reddit.com/r/Ollama/)
- [Official Documentation](https://ollama.ai/docs)
- [GitHub Repository](https://github.com/ollama/ollama)

## Additional Tips

GPU Support:
```bash
podman run --rm --device nvidia.com/gpu=all --security-opt=label=disable ubuntu nvidia-smi -L
```

OpenShift:
```bash
oc new-project darmstadt-workshop
oc apply -f deployments/ollama.yaml
```

Debugging:
```bash
oc run mycurl --image=curlimages/curl -it -- sh
```

## Useful Plugins

- [Ollama for VS Code](https://marketplace.visualstudio.com/items?itemName=craftzdog.ollama-vscode)
- [Ollama for Neovim](https://github.com/nomnivore/ollama.nvim)
- [Ollama for JetBrains](https://plugins.jetbrains.com/plugin/22711-ollama)

## Additional Tools

- [Streamlit](https://streamlit.io): Build Ollama web apps
- [Podman](https://podman.io): Container management
- [CDI Spec Generator](https://github.com/container-orchestrated-devices/container-device-interface): GPU support tool
