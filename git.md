# Short Git Command Overview

All commands listed in this document must be run in
the terminal window. If another applicaiton is running
such as npm or mysql you will need to exit the appliation
first or open a second terminal window. 

A harsh, but effective way to exit an application is to
press ctl-C or even harcher ctl-D

# What is a Code Repository
It is a set of files that make-up the source-code, potentially
documentation, or other files for an application(s). These files
are *stored* in the repository. Typically the repository also
uses a version control system (such as git) to manage different 
versions of the code.

# Status of Repository
If using and IDE such as Visual Code Studio, have awareness tools
that show the current status of the repository (left squiggly icon).

The git status command (below) lists files that are modified and/or
not under version control. *Not staged* (typically red in colour) 
indicate files that have changes that are not submitted to the 
repository

```
git status
```

# Submitting Changes to the Repositry
The *add* command submits changes to a repository. It is recommended
to *add* the specific files or directories only.

The first command below should be the only version of Add command that is
needed for this assignment. It submits all of the code changes within
the src directory for inclusion into the repository. The second command
is submitting the *index.html* file only

After files have been submitted, they are listed in **git status** as
being staged.

```
git add [your filename.sql]
```

** DO NOT USE `git add .` ** as it will include files that
do not need to be under version control

# Commit Submission
Now that the code has been submitted to the repository it is time to decide if we wish to commit to these changes or not to the 
local repository. These changes will be committed on the current
machine only.

The text within the quotes (after the -m) should be a short description
of the changes that are beeing committed to the repository

```
# Commits the submitted files
git commit -m "a meaningful comment"

# Removes the submitted files within the src directory
git reset src
```

# Send Changes to Main Repository
Now that we have committed the changes, we want to update them on 
GitHub, or some other cloud service.  The **push** command will 
do this.  Note, to push to a repository security settings may be
required to to be set.

```
git push
```

# Retrieve Code from Main Repository
If sennding to the repository uses **push** then the opposite
retrievies them, the opposite being **pull**.

```
# git pull
```


# Summary
The main commands that will be needed are shown below.  Note that
it might be wise to do a **pull request** before starting to
work on the repository.

```
git status
git add [myfile.sql]
git commit -m "some witty comment"
git push
```

# Some other useful commands
**stash** temporarily stashes some code, this is useful when
code bases are out of sync.

**branch** is useful when working on a code base with multiple 
people, or with a number of different sub project.  Branches
creates a branch where development can occur without making
changes to the main branch

**merge** is used to merge changes to togeher, such as merging
a branch into the main branch.


