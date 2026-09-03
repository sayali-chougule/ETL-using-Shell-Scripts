# ETL-using-Shell-Scripts

# 1. Extracting data using 'cut' command 

## 1. Extracting characters

```sh
echo "database" | cut -c1-4
```

**Output**
```
data
```

## The command below shows how to extract 5th to 8th characters

```sh
echo "database" | cut -c5-8
```

**Output**
```
base
```

## Non-contiguous characters can be extracted using the comma.

- The command below shows how to extract the 1st and 5th characters.

```sh
echo "database" | cut -c1,5
```

**Output**

```
db
```

## 2. Extracting fields/columns

- We can extract a specific column/field from a delimited text file, by mentioning
    - the delimiter using the -d option, or
    - the field number using the -f option
- The passwd is a ":" delimited file
- The command below extracts usernames (the first field) from passwd

```sh
cut -d":" -f1 /path/passwd
```

**Output**
```
root
daemon
bin
sys
sync
```
- The command below extracts multiple fields 1st, 3rd, and 6th (username, userid, and home directory) from /path/passwd

```sh
cut -d":" -f1,3,6 /path/passwd
```

**Output**
```
root:0:/root
daemon:1:/usr/sbin
bin:2:/bin
sys:3:/dev
sync:4:/bin
```

- The command below extracts a range of fields 3rd to 6th (userid, groupid, user description and home directory) from /path/passwd.

```sh
cut -d":" -f3-6 /path/passwd
```

**Output**
```
0:0:root:/root
1:1:daemon:/usr/sbin
2:2:bin:/bin
3:3:sys:/dev
4:65534:sync:/bin
```

# 2. Transforming data using 'tr'

- ```tr``` is a filter command used to translate, squeeze, and/or delete characters

## 1. Translate from one character set to another

- The command below translates all lower case alphabets to upper case.

```sh
echo "Shell Scripting" | tr "[a-z]" "[A-Z]"
```

**Output**

```
SHELL SCRIPTING
```

- Pre-defined character sets also for the same purpose

```sh
echo "Shell Scripting" | tr "[:lower:]" "[:upper:]"
```

**Output**
```
SHELL SCRIPTING
```

- The command below translates all upper case alphabets to lower case.

```sh
echo "Shell Scripting" | tr  "[A-Z]" "[a-z]"
```

**Output**
```
shell scripting
```

## 2. Squeeze repeating occurrences of characters

- The ```-s``` option replaces a sequence of a repeated characters with a single occurrence of that character.

- The command below replaces repeat occurrences of 'space' in the output of ```ps``` command with one 'space'.

```sh
ps | tr -s " "
```

**Output**
```
PID TTY TIME CMD
 442 pts/0 00:00:00 bash
 2441 pts/0 00:00:00 ps
 2442 pts/0 00:00:00 tr
```

- In the above example, the space character within quotes can be replaced with the following : ```"[\:space\:]".```

- first squeeze multiple spaces into one, then replace that space with ```-```

```sh
ps | tr -s ' ' | tr ' ' '-'
```

**Output**
```
-PID-TTY-TIME-CMD
-442-pts/0-00:00:00-bash
-2577-pts/0-00:00:00-ps
-2578-pts/0-00:00:00-tr
-2579-pts/0-00:00:00-tr
```

## 3. Delete characters

- We can delete specified characters using the ```-d``` option

- The command below deletes all digits

```sh
echo "My login pin is 5634" | tr -d "[:digit:]"
```

**Output**
```
My login pin is
```

## 3. Loading data into a PostgreSQL table

- The PostgreSQL database will have the users table with following columns:

    - uname

    - uid

    - home

```sh
CREATE TABLE users(username VARCHAR(50),userid INT,homedirectory VARCHAR(100));
```

1. Open a new Terminal.

2. In the terminal, run the following command to create a new shell script named ```csv2db.sh```

```sh
touch csv2db.sh
```

3. Open the file in the editor. Copy and paste the following lines into the newly created file.

```sh
# This script
# Extracts data from /etc/passwd file into a CSV file.

# The csv data file contains the user name, user id and
# home directory of each user account defined in /etc/passwd

# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.
```

4. Save the file by presseing ```Ctrl+s``` or by using the File->Save menu option.

5. You need to add lines of code to the script that will xtract user name (field 1), user id (field 3), and home directory path (field 6) from passwd file using the ```cut``` command

```sh
# Extract phase

echo "Extracting data"

# Extract the columns 1 (user name), 2 (user id) and 
# 6 (home directory path) from /etc/passwd

cut -d":" -f1,3,6 /etc/passwd
```

6. Run the script

```sh
bash csv2db.sh
```

7. Verify that the output contains the three fields, that you extracted.

8. Change the script to redirect the extracted data into a file named ```extracted-data.txt```

Replace the cut command at end of the script with the following command

```sh
cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt
```