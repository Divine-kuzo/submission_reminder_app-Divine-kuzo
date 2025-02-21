#!/bin/bash

#Ask the user for their name
echo "What is your name?"

#Accept and store the user's name in a variable using the read command
read NAME

#store the name of the directory that will be created
userdir="submission_reminder_$NAME"

#create the directory
mkdir $userdir

#create sub-directories
mkdir $userdir/{config,assets,modules,app}

#Populate the files

#for reminder
touch $userdir/app/reminder.sh
cat <<'EOF' > $userdir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

#for modules
touch $userdir/modules/functions.sh
cat <<'EOF' > $userdir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF


#for submissions
touch $userdir/assets/submissions.txt
cat <<'EOF' > $userdir/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
louis, Python, not submitted
yusuf, Git, submitted
habib, Shell navigation, not submitted
joy, linux, submitted
nessa, Git, submitted
EOF

#for config.env
touch $userdir/config/config.env
cat <<'EOF' >  $userdir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
#Execute permissions to the above created files.
chmod u+x $userdir/config/config.env
chmod u+x $userdir/modules/functions.sh
chmod u+x $userdir/assets/submissions.txt

#Creation of startup.sh
cat <<EOF > $userdir/startup.sh
#!/bin/bash
cd $userdir
bash app/reminder.sh
EOF

# execute permission for startup.sh
chmod u+x $userdir/startup.sh

# Execute startup.sh which will execute reminder.sh
./$userdir/startup.sh
