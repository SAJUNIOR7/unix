# Safe Process Killer Script
A simple Bash script to find and optionally kill processes matching a name pattern, with support for custom signals and dry-run mode for safe testing.
---
## Table of Contents
- [About](#about)
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Options](#options)
- [How It Works](#how-it-works)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)
---
## About
This script allows you to search running processes by name pattern and send a termination signal to them. It provides a confirmation prompt before killing and supports dry-run mode to preview actions without killing any processes. This reduces the risk of accidental terminations and improves control over process management.
---
## Features
- Search for processes by partial or full name (pattern matching).
- Default signal is SIGTERM (15) to politely stop processes.
- Custom signals supported via `-s` option (e.g., SIGKILL with 9).
- Dry-run mode to preview matched processes without sending signals.
- Confirmation prompt before executing kill command.
- Uses `pgrep` to reliably find processes.
---
## Requirements
- Bash shell
- `pgrep` command available on the system (part of `procps` on most Linux distros)
- Basic POSIX utilities (`kill`, `echo`, `read`, `printf`)
---
## Usage
./kill_pattern.sh [-s signal_number] [--dry-run] <process_name>
text
### Arguments
- `<process_name>`: The pattern to search for in running processes.
### Options
- `-s signal_number`: Specify a custom signal number to send (default is `15` for SIGTERM).
- `--dry-run`: Show the PIDs that would be killed without actually sending signals.
---
## How It Works
1. Parses optional arguments for signal and dry-run.
2. Checks that a process name pattern is provided.
3. Uses `pgrep -f` to find all PIDs matching the pattern.
4. If no processes found, exits politely.
5. Prints matched PIDs.
6. In dry-run mode, only prints what would be killed.
7. Otherwise, prompts user to confirm.
8. Sends the chosen signal to all matched PIDs.
9. Prints success or error message accordingly.
---
## Examples
- Kill all processes with "firefox" in their command line using SIGTERM (default):
./kill_pattern.sh firefox
text
- Kill processes with "myapp" using SIGKILL (signal 9):
./kill_pattern.sh -s 9 myapp
text
- Preview (dry-run) processes named "python" without killing:
./kill_pattern.sh --dry-run python
text
---
## Contributing
Feel free to fork this repository and submit pull requests. Issues and suggestions are welcome to improve functionality or portability.
---

## License

This script is provided as-is under the MIT License. Use and modify freely.
