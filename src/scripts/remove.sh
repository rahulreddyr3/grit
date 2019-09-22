#!/bin/bash
set -e

if [ -d ./.grit ]
then
        rm -rf ./.grit
        echo "removed .grit"
else
        echo "grit directory was already removed."
fi

if [ -f ./.git/hooks/grit-pre-commit-hook ]
then
        cat > ./.git/hooks/grit-pre-commit-hook << 'EOF'
## Grit precommit hook is disabled
#!/bin/bash
exit 0
EOF
        echo "disabled pre-commit hook"
else
        echo "grit-pre-commit-hook file does not exist."
fi

if [ -f ./grit.sh ]
then
        rm ./grit.sh
        echo "removed grit.sh"
else
        echo "grit.sh file has been already deleted."
fi

