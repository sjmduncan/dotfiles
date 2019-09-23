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
  src_path=$(readlink -f $f;)
  tgt_path="$HOME/.${f:2}"

  # Create missing directories
  ldir=$(dirname $tgt_path)
  if [ ! -d "$ldir" ]; then
    echo "INFO: creating $ldir"
    mkdir -p $ldir
  fi

  echo "INFO: $tgt_path"
  if [ "$(stat -c "%d:%i" $tgt_path 2>>/dev/null)" == "$(stat -c "%d:%i" $src_path)" ]; then
    echo "INFO: Already installed :)"
  elif [ -f $tgt_path ]; then
    echo "WARN: File exists with different dev or inode. Please manually
    resolve"
  else
    echo "INFO: Installing from"
    echo "INFO: $src_path"
    ln $src_path $tgt_path
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

