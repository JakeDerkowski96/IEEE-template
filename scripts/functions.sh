#!/bin/bash
# set variables
declare -r TRUE=0
declare -r FALSE=1
declare -r TEX='.tex'
declare -r PDF='.pdf'
declare -r BIB=".bib"
declare -r DEFAULT='paper'


abstact='sections/abstract.tex'
intro='sections/introduction.tex'
bckgrnd='sections/related.tex'
defines='sections/definitions.tex'
research='sections/research.tex'
end="sections/conclusion.tex"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: CREATE A WORKSPACE FOR IEEE CONFERNCE PAPER
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# $1 type of task i.e. download or make
# $2 specific file or task i.e IEEEtrans.cls
function completetion_msg {
	printf "\n $1 SUCCESS: $2";
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: download files from ctan
# ARGS: the name of the file location
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function download {
	wget --no-check-certificate -q $1
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: CHECK IOF DIRECTORY EXISTS
# ARGS   : $1 -> the directory to check
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function check_folders {
	if [ -d $1 ]; then
		# FILE ALREADY EXISTS
		printf "Directory found: $1";
		return $FALSE
	else
		# FILE DIRECTORY DOES NOT EXIST
		printf "Not found: $1";
		printf "Creating: $1"
		return $TRUE
	fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: CHECK IOF FILE EXISTS
# ARGS   : $1 -> the FILE to check
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function check_files {
	if [ -f $1 ]; then
			# == 0
			printf "File found: $1"
			return $TRUE
	else
		# FILE DIRECTORY DOES NOT EXIST == 1
		printf "File not found: $1";
		printf "Downloading file: $1"
		return $FALSE
	fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PURPOSE: determine name of file
# ARGS   : $1 -> the FILE to check
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function inp-check {
  if [[ -z $1 ]]; then
    MAIN=$DEFAULT
  else
    MAIN=$inp
  fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PUREPOSE: set the names of the important files
# get imput form input chck
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function get_name {
	read -p "Enter paper name (without extension) : " inp
	inp-check inp;
	printf "Paper title: $MAIN";
	printf "Later i will do some user handlign here";
	paper="$MAIN$TEX"
	bib="$MAIN$BIB"
	outfile="$MAIN$PDF"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GET FILES IF THEY DONT EXIST
# $1 IS NAME $2 IS DWNLOAD LINK
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function surprise{
	pdflatex Workspace/IEEE-template/.ghost/graphicx.tex;
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function ieee_check {
	if [ ! -f $1 ]; then
		printf "\nFile not found!  $1"
		printf "Downloading:  $1"
		download $2;
		printf "Download complete: $1"
	else
		printf "File found: $1"
	fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# install dependencies
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function dl_packages {
	sudo apt update
	sudo apt install wget lolcat latexmk -y
} &> /dev/null
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function make_dir {
	check_folders sections;
	touch $abstact $intro $bckgrnd $defines $research $end;
	cd ..;
	check_folders images;
	touch images/msg.txt;
	echo "put all images here!" >> images/msg.txt;
	# mkdir downloads;
	# mkdir downloads/examples;
}
