
# System Resource Monitor

This Bash script monitors CPU, memory, and disk usage on a Linux system, logging high-usage warnings to a file (`monitor.log`). It runs continuously in the background, checking resource usage at specified intervals and generating log reports.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Customization](#customization)
- [Logs](#logs)
- [Stopping the Script](#stopping-the-script)

## Features
- **Monitors CPU, Memory, and Disk Usage**: Tracks system usage levels and logs them.
- **Configurable Thresholds**: Set usage thresholds to control when warnings are logged.
- **Interval Control**: Adjust the frequency of resource checks.
- **Graceful Exit**: Handles exit signals, ensuring the script stops cleanly.

## Requirements
- Linux or WSL environment.
- `bc` package for calculating CPU and memory percentages.
- Basic command-line utilities like `top`, `free`, and `df`.

## Usage
1. **Clone this repository:**
    ```bash
    git clone https://github.com/C4rbo/system-resource-monitor.git
    cd system-resource-monitor
    ```

2. **Make the script executable:**
    ```bash
    chmod +x script.sh
    ```

3. **Run the script:**
    ```bash
    ./script.sh
    ```
    The script will start checking resource usage and outputting logs to `monitor.log`.

## Customization
- **CPU, Memory, and Disk Thresholds**:
    - Adjust these variables in the script:
        ```bash
        CPU_THRESHOLD=80
        MEMORY_THRESHOLD=90
        DISK_THRESHOLD=90
        ```
    - Change them as needed (percentages).
- **Interval Between Checks**:
    - Modify the `INTERVAL` variable in the script to set the frequency of resource checks (in seconds):
        ```bash
        INTERVAL=7
        ```

## Logs
All log entries are written to `monitor.log` in the script’s directory, including timestamped entries and warnings when any resource threshold is exceeded.

## Stopping the Script
To stop the script, press `CTRL+C`, and it will gracefully exit with a message.

## Legal Disclaimer

**Use responsibly and legally.** This tool is designed for educational purposes and authorized security testing only. Unauthorized scanning of networks and devices is illegal and unethical. Always obtain explicit permission from the network owner before using this tool.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! If you have suggestions for improvements or find bugs, please open an issue or submit a pull request on GitHub.

## Author

- C4rbo (https://github.com/C4rbo)
