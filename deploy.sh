#!/bin/bash

#
# Send working directory contents of _site/ to the server
#

# Constants
SRC_DIR="_site/"
BETA_DIR="public_html/beta/"
PRODUCTION_DIR="public_html/"
SSH_PREFIX="chemsoc@ssh.soton.ac.uk:"


# Get absolute source path, assuming that it is sibling of this script
SRC_FULL_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$SRC_DIR"

# Functions
usage() {
    echo "Usage: $0 [beta | production]"
    echo "  Deploy to beta site http://www.southampton.ac.uk/~chemsoc/beta/ (default)"
    echo "    or to production"
}

perform_upload() {
    DESTINATION="$SSH_PREFIX$1"
    echo "Performing upload $SRC_FULL_PATH -> $DESTINATION"
    scp -r $SRC_FULL_PATH $DESTINATION
}

# Check source directory exists
if [ ! -d "$SRC_FULL_PATH" ]; then
    echo "Error: source directory '$SRC_FULL_PATH' does not exist!"
    echo "Have you generated _site/ ?"
    exit 1
fi

# No args => beta-deploy
if [ $# -lt 1 ]
then
    perform_upload $BETA_DIR
    exit 0
fi

case "$1" in
help | h | --help | -h)  usage
			 exit 0
                         ;;
production)  echo -n "This will overwrite production site!  Continue [y|n]? "
	     read -n 1 yno
	     echo
	     case $yno in
		 [yY])
		     perform_upload $PRODUCTION_DIR
                     ;;

		 *)
                     echo "Exiting without action."
                     exit 0
                     ;;
	     esac
	     ;;
beta)  DEST_DIR="public_html/beta/"
       perform_upload $BETA_DIR
       ;;
*) echo "$0: invalid argument -- '$1'"
   usage
   exit 1
esac


exit 0
