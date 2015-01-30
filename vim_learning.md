# Learning vim

Here, I am recording things I learn from Drew Neil's tutorials.

## Git -- Fugitive

This is a good git plugin.

* Commands always start with a capital G: `G`
* He reckons that long commands are better run in the terminal (e.g. git log)
* Can put shorter versions in `.gitconfig`
* In git, can do `:Git add %` to add the current file
* But fugitive has better options.
* instead of `git add %` can use `:Gwrite`
* `Gread` reverts the copy on the filesystem
* `CTRL-n` attempts to auto-complete based on names in open buffers.

* Second video
* `Gstatus`: `C-n` and `C-p` to navigate quickly
* `-` to stage and unstage; also works in visual mode
* He says this is not necessarily too good. Can run `:Git add .`
* He shows how to do stuff with hunks; this is not something I really need at
the moment. Go into it if I need to.
* In status, `ENTER` opens the file. Then can do `Gdiff`. Colouring depends on
the scheme. He uses solarised.
* `C` is a shortcut for committing in status, I think.
* `:Gedit` will open the current index file, apparently.

