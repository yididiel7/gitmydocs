**Title:** Ollama CLI Tricks
**Date:** 2026-02-09 (22:27:16 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Ollama-CLI-tricks.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# Ollama Command Line Tricks

- Input from stdin
  - ollama run llama3.1 "prompt"

- Multiline input
  - Using """

- Input from file
  - Using the pipe | operator:
- cat fox.txt | ollama run llama3.1 "Please translate the provided text
to German"
  - Using the redirection operator < :
- ollama run llama3.1 "Please translate the provided text to German" <
fox.txt
  - Consuming Web Pages:
- curl https://lite.cnn.com/travel/tourism-why-it-went-wrong/index.html
| ollama run llama3.1 "Summarize the contents of this HTML page"
- curl https://lite.cnn.com/travel/tourism-why-it-went-wrong/index.html
| ollama run llama3.1 "Find all the people names mentioned in this HTML
page"

- More fun with the pipe | operator
  - Passing the output of one LLM to another
- ollama run llama3.1 "How do you make scrambled eggs?" | ollama run
llama3.1 "Translate to german"

- Output to a file
  - Output to a JSON file:
- ollama run llama3.1 "Countries of Europe" --format json > europe.json
  - Appending to a file:
    - ollama run llama3 "Tell me a joke about programming" > jokes.md
    - ollama run llama3 "Tell me a joke about programming" >> jokes.md

- Verbose output:
  - ollama run llama3.1 --verbose "What is the capital of Iceland?"
