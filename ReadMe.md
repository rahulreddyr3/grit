# GRIT - green git

This is a command line tool to help maintain your git green. This will run a given script before every commit you make. The difference between grit and pre-commit git hook is that, grit runs the script with out considering unstaged and untracked changes.

* Note: grit internally uses git-hooks.

## Installation

* To install grit run the following commands

```bash
brew tap rahulreddyr3/homebrew-rrr-osx
brew install grit
```

## How to use

To initialise grit in the project, run the following command from in project the directory

```bash
grit init
```

* Note: This command initialises git and creates .gitignore in the directory if not present.
Once the directory is initialised with grit successfully, you can see grit.sh file in it.
Keep all commands you want run before commits in this file.
If this scritp exists with a non zero value the staged changes are considered red and thus won't be commited.

To remove grit from the project, run the following command from in project directory

```bash
grit remove
```

## Contributors

1. [Rahul reddy](https://rahulreddyr3.github.io)

