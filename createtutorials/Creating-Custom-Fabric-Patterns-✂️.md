# ASSISTANT

**Defining Fabric Patterns**

Based on the video transcript provided, here is a clear, step-by-step
guide on
how to create and use custom patterns in **Fabric**.

---

### 1. Understand Where Patterns Live
Fabric patterns are stored locally on your machine. By default, they are
located in:
`~/.config/fabric/patterns`

When you run a command like `fabric -p some_pattern`, the tool looks
inside that specific folder for a matching directory.

### 2. Create Your Custom Pattern
To create a new pattern, you need to create a directory with the name of
your pattern and a file inside it named `system.md`.

**Step-by-step:**
1.  **Create a folder:** Choose a name for your pattern (e.g.,
`provide_latin_meditations`).
2.  **Create `system.md`:** Inside that folder, create a file named
`system.md`.
3.  **Write the Prompt:** Define the Identity and the Task within that
file.
    *   *Example Content:*
        ```markdown
        # IDENTITY and PURPOSE
        You are an expert in Stoic philosophy and Latin.
You provide insights from Marcus Aurelius in both Latin and English.

        # GUIDELINES
        - Take input from the user.
        - Output one of the quotes from 'Meditations'.
        - Provide the Latin version followed by the English translation.
        ```

### 3. Sync Your Pattern to Fabric
Fabric only "sees" patterns that are inside its official config
directory. You have two options:

*   **Manual Copy:** Copy your new folder directly into
`~/.config/fabric/patterns`.
*   **The "Pro" Way (Alias):** The creator in the video keeps a separate
"custom patterns" folder elsewhere and uses a terminal alias (or a
script) to copy them over.
*   *Example command:* `cp -r ~/my-custom-patterns/*
~/.config/fabric/patterns/`

### 4. Run Your Custom Pattern
Once the folder is inside the `~/.config/fabric/patterns` directory, you
can call it from anywhere in your terminal using the `-p` (pattern)
flag.

**Example Command:**
```bash
echo "morning routines" | fabric -p provide_latin_meditations --stream
```

### 5. Why do this?
*   **Privacy:** If you keep your patterns local and don't submit a Pull
Request (PR) to the main Fabric GitHub repo, your specific prompts
remain private to your machine.
*   **Personalization:** You can create patterns for Journaling,
specific business workflows, or private code review styles that wouldn't
make sense for the general public.
*   **No Coding Required:** As long as you can write a Markdown file and
move a folder, you can build custom AI tools.

### Summary Checklist
1.  **Folder Name:** Your pattern name.
2.  **File Name:** Must be `system.md`.
3.  **Location:** Must end up in `~/.config/fabric/patterns/`.
4.  **Execution:** `fabric -p [folder_name]`.

The setup process collects responses and writes them to
~/.config/fabric/.env,
which is loaded automatically by subsequent fabric commands.

```
❯ cat ~/.config/fabric/.env
DEFAULT_VENDOR=Ollama
DEFAULT_MODEL=llama3.2:1b
PATTERNS_LOADER_GIT_REPO_URL=https://github.com/danielmiessler/fabric.git
PATTERNS_LOADER_GIT_REPO_PATTERNS_FOLDER=data/patterns
PROMPT_STRATEGIES_GIT_REPO_URL=https://github.com/danielmiessler/fabric.git
PROMPT_STRATEGIES_GIT_REPO_STRATEGIES_FOLDER=data/strategies
DEEPSEEK_API_KEY=Please
DEEPSEEK_API_BASE_URL=opy
GEMINI_API_KEY=AIzaSyAArPJw--wLGYcXiO_nphoMMEtlqnrElMY
GROQ_API_KEY=please_provide_your_groq_api_key
GROQ_API_BASE_URL=https://api.groq.com/openai/v1
OLLAMA_API_URL=http://localhost:11434
OLLAMA_HTTP_TIMEOUT=20m
OPENROUTER_API_KEY=please_provide_your_openrouter_api_key
```
