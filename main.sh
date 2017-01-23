#!/usr/bin/env bash


# some variables
user=$(whoami)
version=1.0.beta
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

# mount the iso file 
function mount_iso {
    sudo mount -o loop $1 $2 
}

#umount the iso file 
function umount_iso {
		sudo umount $mount_dir
}

#copy contents of iso file to specified destination 
function copy_mode {
		mount_iso $working_iso_file $mount_dir
		cp -r -vv -i $mount_dir/* $1
		umount_iso
}

#main program:
case $1 in
		help)
				help
				;;
		view)
				mount_iso $working_iso_file $mount_dir 
				echo -e "Listing files....... \n\n"
				tree $mount_dir
				umount_iso
				;;
		copy)
				echo "Copying files from iso to $1"
				copy_mode $destination_dir
				;;
		*)
				help
				;;
esac
		
				
				











