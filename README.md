# ETL-using-Shell-Scripts

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



