# Install asciinema CLI

## Installation

```bash
sudo pacman -S asciinema
```

## Record a terminal session

To start a recording session use the rec command:

```bash
asciinema rec demo.cast
```

When done, press `Ctrl+D` or enter `exit` to end the recording.

Instead of recording a shell you can record any command with `--command` / `-c`

## Recording Options

You can pass `-i 2` to asciinema rec to set an idle time limit:

```bash
asciinema rec -i 2 open-webui.cast

# Record specific command
asciinema rec -c htop demo.cast
```

The recording ends when you exit htop by pressing its `q` shortcut.

## Replay Recording

To replay a recording in your terminal use the play command:

```bash
# Basic playback
asciinema play demo.cast

# Double speed playback
asciinema play -s 2 demo.cast

# Limit idle time to 2 seconds
asciinema play -i 2 demo.cast
```

You can pass `-i 2` to `asciinema rec` as well, to set it permanently on a recording. Idle time limiting makes the recordings much more interesting to watch. Try it!

## Share via asciinema.org

If you want to watch and share it on the web, upload it:

```bash
asciinema upload demo.cast
```

The above command uploads it to asciinema.org, which is a default asciinema server instance, and prints a secret link you can use to watch your recording in a web browser.

> **Note**: This step is completely optional. You can embed your recordings on a web page with asciinema player, or publish them to a self-hosted asciinema server instance.

## Record and publish in one command

If you omit the filename the recording is saved to a temporary file. When the recording session ends asciinema enters interactive mode:

```bash
$ asciinema rec

asciinema: recording asciicast to /tmp/tmpo8_612f8-ascii.cast
asciinema: press <ctrl-d> or type "exit" when you're done
$ echo hello
hello
$ exit
asciinema: recording finished
(s)ave locally, (u)pload to asciinema.org, (d)iscard
[s,u,d]? _
```

> **Note**: This behaviour is likely to change in v3.0 of the CLI. Recording without filename will either be prohibited or will default to saving a file in a current directory.

---

These are the basics, but there's much more. See the Usage section for detailed information on each command of the CLI.

If you're interested in sharing your recordings via asciinema.org please familiarize yourself with docs on asciinema upload and asciinema auth commands.

## Playing from stdin

```bash
cat /path/to/asciicast.cast | asciinema play -
ssh user@host cat asciicast.cast | asciinema play -
```

## Keyboard Shortcuts

The most important shortcuts during playback are:

- `Ctrl+C` - end the playback early
- `Space` - toggle the playback (pause/resume)

## Available Options

- `-i, --idle-time-limit=<sec>` - Limit replayed terminal inactivity to max <sec> seconds
- `-s, --speed=<factor>` - Playback speed (can be fractional)
- `-l, --loop` - Play in a loop
- `-m, --pause-on-markers` - Automatically pause on markers

> **Note**: For the best playback experience it is recommended to run asciinema play in a terminal of size equal or bigger than the one used at the recording time, as there's no "transcoding" of control sequences for the current terminal size.

> **Tip**: Consider creating a shell alias for frequent replays:
```bash
alias play='asciinema play'
```

## Print full output from a recording to a terminal

While `asciinema play <filename>` replays the recorded session using timing information saved in the asciicast file, `asciinema cat <filename>` dumps the full output to a terminal all at once. This includes all saved control sequences, e.g. SGR for text attributes (color etc).

Both commands below produce an equivalent output.txt file:

```bash
asciinema cat existing.cast >output.txt
asciinema rec --raw output.txt

# Output from multiple recordings
asciinema cat one.cast two.cast three.cast
```
