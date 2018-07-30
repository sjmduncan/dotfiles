#~/bin/bash
set -u

# where to copy existing config files to
backup_dir=$HOME/rc.old/

# this is normally called .bashrc_local but I use .lbash
bashrc_local=$HOME/.lbash

cd home
files_full=$(find ./ -type f)

for f in $files_full; do
    # target file and link name for symlinks
    target=$(readlink -f $f;)
    lname="$HOME/.${f:2}"

    echo "INFO: lname $lname"
    echo "INFO: Processing $target"
    
    # Containing directories for some config files might not exist.
    # Create them here if they don't.
    ldir=$(dirname $lname)
    if [ ! -d "$ldir" ]; then
	echo "INFO: creating $ldir"
	mkdir -p $ldir
    fi
    # Check if the
    makelink=0;
    if [ -L $lname ]; then
	# is a symlink
	old_target=$(readlink $lname)
	if [ $target -ef $old_target ]; then
	    echo "INFO: Already installed :)"
	else
	    echo "WARN: Linked to $old_target"
	    echo "WARN: Moving symlink to $backup_dir"
	    mkdir -p $backup_dir
	    mv $lname $backup_dir
	    makelink=1
	fi
    elif [ -f $lname ]; then
	mkdir -p $backup_dir
	mv $lname $backup_dir
	echo "WARN: File exists."
	echo "WARN: Moving to $backup_dir"
	makelink=1
    else
	makelink=1
    fi

    if [ "$makelink" -eq "1" ]; then
	echo "INFO: Linking $lname to $target"
	ln $target $lname
    fi
    echo
done



if grep -q $bashrc_local $HOME/.bashrc
then
    echo "INFO: $HOME/$(basename $bashrc_local) already sourced in .bashrc :)"
else
    echo "INFO: Adding $(basename $bashrc_local) to .bashrc"
    echo "source $bashrc_local" >> $HOME/.bashrc
fi
echo

