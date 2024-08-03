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