# `git merge-file` Experiment 1 ![failed-badge]
### Objective
Assum I have branches `brA` and `brB` both are originated from `main`.

The file structure on each branch are shown as below:
**main**
```
Common
```
**brA**
```
Common
FileA
```
**brB**
```
Common
FileB
```
and now I am in `brA`

When I run
```pwsh
git merge-file brA main brB
```
The result of 
```pwsh
ls
```
will be
```
Common
FileA
FileB
```
, and I run
```pwsh
git co main
ls
```
, the result will be
```
Common
FileB
```
### Setup
```pwsh
mkdir tmp/merge-file-1
cd tmp/merge-file-1
git init
echo "" > common.txt
git add .
git commit -m "add common.txt"
git br -m master main

git br br-a
git br br-b

git co br-a
echo "" > file_a.txt
git add .
git commit -m "add file_a.txt"

git co br-b
echo "" > file_b.txt
git add .
git commit -m "add file_b.txt"
```
### When
```pwsh
git co br-a
git merge-file br-a main br-b
```
**Error**
```
error: Could not stat br-a: No such file or directory
```
### When
```
git co br-a
ls
```
**Expect**
```
common.txt
file-a.txt
file-b.txt
```
### When
```
git co main
ls
```
**Expect**
```
common.txt
file-b.txt
```
### When
```
git co br-b
ls
```
**Expect**
```
common.txt
file-b.txt
```
### Clean Up
```pwsh
cd ../..
rm tmp/merge-file-1 -Fo -R
```
## Summary
It seems that merge-file really merge files but not branches. I will experiment on files next time.

[failed-badge]: https://img.shields.io/badge/failed-red