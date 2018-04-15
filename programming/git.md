Git
===


```bash

# Revert last local commit
git reset HEAD~1

# push changes from a local branch to a remote one
git push -u origin dev/xxxx


# add/remove remote repo
$ git remote add michael_repo https://xxx.xxx/myprject.git
$ git remote rm michael_repo

# list current remote repos
$ git remote -v

# pull from “master” branch from and existing and added remote repo
$ git pull micheal_repo master

# pull from other user repo directly without using the stored remotes way
$ git pull /home/otheruser/proj master

# fetch from remote  ( get changes but not merge with local ones )
$ git fetch michael_repo master
$ git merge michael_repo/master

# diff beteween fetched using remote stored repo
$ git log -p master..michael_repo/master

# diff between fetched changes and local when fetched directly without using remote
$ git fetch /home/peter master
$ git log -p HEAD..FETCH_HEAD 

# push to existing remote repo
$ git push michael_repo master

# show remote info
$ git remote show origin
$ git remote show michael_repo
```

## Other

```bash

# remove untracked files

git clean -n			-> informative: show untracked files which will be removed
git clean -f			-> remove untracked files


# show remote branches
git branch -r

git status -u				-> show untracked files

# amend commit ( tie changeset to previous commits )
git commit --amend 

# go to a previous version and loose changes onwards
git reset --hard c467874687687687687687634


# show diff changes between 2 branches
git diff --name-status develop..dev/m-4
git diff --stat --color develop..dev/m-4

# generate diff file patch with changes ( including new files, ... )
git diff develop..dev/m-1 > develop.patch


# apply patch file


# git patch from lower to upper commit considering in-between
git diff 82739273...21039810293 -- >last_changes.patch


# now you can apply those changes into ahoter branch or repo

# check whether it is ok
git apply --check last_changes.patch

; apply patch
git apply last_changes.patch

; save current modified files ( current local status )
git stash save
git stash list
git stash pop


; show tree
git log --all --decorate --oneline --graph


$ git config merge.tool kdiff3
$ git config merge.tool vimdiff

We can also set the editor to display the common ancestor BASE while we examine what changes are in LOCAL and REMOTE with the following setting:

$ git config merge.conflictstyle diff3  

```


## More

```bash

# diff between 2 commits making a patch
$ git diff -p e1f77b52835f3219c0b692c5c433b57d186c8b1b 532a9e811318068bed291e25c0a887f433c24183 >a.patch

# diff between previous revision ( HEAD^)  and cuurent revision (HEAD)
$ git diff HEAD^ HEAD


# commits

# commit modified ( but not new ) files
$ git commit -a -m"jkjkjkjkjkj"

# showing what is about to be commit ( including added files , so that’s the use of --cached )
$ git diff --cached

# show status
$ git status

```


# branches and merges

```bash
# create
$ git branch my_branch

# show current ones ( it will display an asterisk besides the current one )
$ git branch

# switch to a branch
$ git checkout my_branch

# merge changes from other branch, resolve conflicts and commit 
( for example you are in your "master" branch and want to get changes from my_branch )
$ git merge my_branch
$ git diff
$ git commit -a

# remove branch gently ( assures it has been imported into current one )
$ git branch -d my_branch

#remove "ugly" branch we done want to import
$ git branch -D my_branch

```

