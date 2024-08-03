- [Experiment 1](#experiment-1) ![](https://img.shields.io/badge/Failed-red)
## Experiment 1 ![](https://img.shields.io/badge/Failed-red)
### Objective
Test if
```bash
git merge brA --into-name brB
```
will merge files in `brA` into `brB`. 

### Hypothesis
Create an empty repo in `lab\merge-into-name` folder first, and create the branches `brA` and `brB`. Edit each with the file structure as below:

**brA**
```
.
+-- Common.txt
+-- FileA.txt
```
**brB**
```
.
+-- Commmon.txt
+-- FileB.txt
```

and then I run in `brA`
```bash
git merge brA --into-name brB  
```

Should except this result in `brB`:
```
.
+-- Commmon.txt
+-- FileA.txt
+-- FileB.txt
```

### Build up
```pwsh
rm merge-into-name -Force -Recurse
mkdir merge-into-name
cd merge-into-name
echo "" > Common.txt
git init
git add .
git commit -m "initial commit"
git br brA
git br brB

git co brA
echo "" > FileA.txt
git add .
git commit -m "add FileA.txt"

git co brB
echo "" > FileB.txt
git add .
git commit -m "add FileB.txt"

git co brA
git merge --into-name brB
ls
# expect:
# Common.txt
# FileA.txt

git co brB
ls
# expect:
# Common.txt
# FileA.txt
# FileB.txt

cd ..
```
or just run
```
.\bin\merge-into-name-1.ps1
```
#### Result 1
```
Switched to branch 'brA'
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---            8/3/2024  4:40 PM              2 Common.txt
-a---            8/3/2024  4:40 PM              2 FileA.txt

Switched to branch 'brB'
-a---            8/3/2024  4:40 PM              2 Common.txt
-a---            8/3/2024  4:40 PM              2 FileB.txt

> git merge --into-name brB
fatal: No remote for the current branch.
```
It seems that not as expected. This command remain **undefined** for me. 