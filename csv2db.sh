# This script
# Extracts data from passwd file into a CSV file.

# The csv data file contains the user name, user id and
# home directory of each user account defined in passwd

# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.

# Extract phase

echo "Extracting data"

# Extract the columns 1 (user name), 2 (user id) and 
# 6 (home directory path) from passwd

# cut -d":" -f1,3,6 passwd

cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt
