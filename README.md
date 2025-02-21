# Submission Reminder App

## Overview
The **Submission Reminder App** is a shell script-based application that helps track student assignment submissions. It scans a list of submissions, identifies students who have not submitted their assignments, and displays reminders.

## Setup Instructions
### Prerequisites
Ensure you have the following before running the script:
- A Windows operating system
- Bash installed (via Git Bash or WSL)
- Visual Studio Code (optional for editing)
- Proper execution permissions for the script files

### Installation & Execution
1. Download the files from Canvas.
2. Open a terminal on Windows and type:
   ```bash
   bash
   ```
3. Navigate to the directory where the downloaded files are located.
4. Run the script using:
   ```bash
   bash create_environment.sh
   ```
5. Enter your name when prompted. This will create a directory named `submission_reminder_<YourName>`.
6. The script will automatically execute and display assignment reminders.

## Script Explanation
The `create_environment.sh` script performs the following actions:
1. Prompts the user to enter their name.
2. Creates a directory named `submission_reminder_<UserName>`.
3. Inside this directory, it creates subdirectories:
   - `config/` (stores configuration files)
   - `assets/` (stores submission records)
   - `modules/` (contains helper functions)
   - `app/` (contains the main reminder script)
4. Generates necessary script files:
   - `app/reminder.sh`: Main script to check and display assignment reminders.
   - `modules/functions.sh`: Contains helper functions to process submissions.
   - `config/config.env`: Stores assignment-related variables.
   - `assets/submissions.txt`: Sample CSV file listing students and submission statuses.
   - `startup.sh`: Executes `reminder.sh` automatically.
5. Grants execution permissions to all scripts.
6. Runs `./$userdir/startup.sh`, which triggers `reminder.sh`.

## File Descriptions
- **app/reminder.sh**: Reads environment variables and calls `check_submissions` to display reminders.
- **modules/functions.sh**: Contains the `check_submissions` function that scans the submissions file and prints reminders for students who haven't submitted assignments.
- **config/config.env**: Defines the assignment name and the remaining days until the deadline.
- **assets/submissions.txt**: Stores student names, assignments, and their submission statuses.
- **startup.sh**: A helper script to execute the reminder system automatically.

## Example Output
```
What is your name?
divine-kuzo
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in ./assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
Reminder: Louis has not submitted the Python assignment!
Reminder: Habib has not submitted the Shell Navigation assignment!
```

## Notes
- The script assumes `submissions.txt` follows a strict format (comma-separated values with a header row).
- Modify `config.env` to change the assignment name or days remaining.
- Ensure the script files have execute permissions using:
  ```bash
  chmod u+x create_environment.sh
  ```

## Execution Process
The script follows this sequence:
1. The user enters their name.
2. The script creates a folder named `submission_reminder_<UserName>`.
3. Subdirectories (`config/`, `assets/`, `modules/`, and `app/`) are created.
4. Required files (`reminder.sh`, `functions.sh`, `config.env`, `submissions.txt`) are generated and populated with content.
5. `startup.sh` is created to execute `reminder.sh` automatically.
6. Execution permissions are assigned to all necessary files.
7. The script executes `startup.sh`, which in turn runs `reminder.sh`, displaying assignment reminders.

## Author
Developed by **divine-kuzo**.

## License
This project is open-source and free to use for educational purposes.


