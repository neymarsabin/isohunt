#!/usr/bin/env bash

# A very basic shell script to mount iso files easily in linux using terminal..(removes headache of mouting copying and unmounting iso files)

# some variables
user=$(whoami)
version=1.0.beta
PASSWORD=google
working_iso_file=$2
mount_dir=/mnt/isofiles
destination_dir=$3

# helper function
function help {
    echo "Usage:                   ./main.sh view filename.iso"
		echo "For Copying:             ./main.sh copy filename.iso copying_dir "
		echo "Readonly Extract:        ./main.sh extract filename.iso destination_dir"
		echo "Helper:                  ./main.sh help "
		echo "version = "$version
}

function mount_iso {
    sudo mount -o loop $1 $2 
		echo "Operation completed"
}

function umount_iso {
		sudo umount $mount_dir
}

function copy_mode {
    echo -e "Let\'s mount the iso file first"
		mount_iso $working_iso_file $mount_dir
		cp -r -vv -i $mount_dir/* $1
		umount_iso
}

case $1 in
		help)
				help
				;;
		view)
				echo "processing to list the files inside iso"
				mount_iso $working_iso_file $mount_dir 
				echo -e "Listing files....... \n\n"
				tree $mount_dir
				umount_iso
				;;
		copy)
				echo "Copying files from iso to $1"
				copy_mode $destination_dir
				;;
esac
		
				
				











