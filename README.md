# Test case for demonstrating Wake caching logic.

Steps to reproduce:

```
# Assuming that this repo has been cloned

# Bash one-liner for clearing out git state in case if you ran through this earlier
git reset HEAD . && git checkout -- . && git clean -fd

# Initialize Wake database.
wake --init .

# The following should print out the error message "cp: missing destination file operand after 'out.txt'".
# However, we've forced the Makefile to exit with status 0 no matter what. The
# Wake function `run` will return the list of output files, which should be Nil.
wake -x 'run Unit'


# "Fix" the bug by renaming the input file to the correct name.
git mv in.txt in2.txt

# `run` will continue to return Nil.
wake -x 'run Unit'


# Reset Wake database.
wake --init .

# This will now successfully create "out.txt" and return Path "out.txt", Nil
wake -x 'run Unit'
```
