#!/bin/bash
set -e

if [ -d ./.git ];
then
  mkdir .grit
  touch grit.sh
  echo ".grit" >> .gitignore;
  echo "grit.sh" >> .gitignore;
else
  git init
  mkdir .grit
  touch grit.sh
  echo ".grit" >> .gitignore;
  echo "grit.sh" >> .gitignore;
fi

cat >> grit.sh <<EOGS
#!/bin/bash
#This script will be executed before each commit
exit 0
EOGS

cd .git/hooks

touch grit-pre-commit-hook
cat >> grit-pre-commit-hook << 'EOGPCH'
## The below part is used by grit to run the grit script before each commit
#!/bin/bash
echo $pwd
if [ -d ./.grit/1 ]; then rm -rf ./.grit/1; fi
mkdir ./.grit/1
cp -r `ls -A | grep -v ".grit"` ./.grit/1
cd ./.grit/1/
git stash save --keep-index --include-untracked --quiet grit_1
sh grit.sh
status=$?
if [ $status != 0 ]
then
   	cat <<\EOF
This commit is red.
Your grit script failed.
Please check and recommit.
EOF
	exit 1
else
        cat <<\EOF
Your commit is green.
Committing changes
EOF
	exit 0
fi
EOGPCH

chmod +x grit-pre-commit-hook

cat >> pre-commit << 'EOPCH'

## Addes grit as precommit hook
bash ./.git/hooks/grit-pre-commit-hook

EOPCH

chmod +x pre-commit

echo "Congrats, your project is setup with grit."
echo "Specify what is a green commit for your project in grit.sh file."
echo "Happy commits"

