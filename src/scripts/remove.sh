set -e
if [ -d ./.grit ];
then
rm -rf .grit
else
echo "grit folder is not present."
fi
if [ -f ./.git/hooks/pre-commit ];
then
rm ./.git/hooks/pre-commit
else
echo "pre-commit does not exist."
fi
if [ -f ./grit.sh ];
then
rm ./grit.sh
else
echo "grit.sh does not exist."
fi

