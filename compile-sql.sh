#!/bin/bash

################################################################################
#                  GLUE 2.0 SQL schema compilation script
#
# URL:     http://forge.gridforum.org/sf/projects/glue-wg
# Author:  David Horat (david.horat@cern.ch), CERN
# Version: 0.2 (17/04/2009)
################################################################################

# Basic info
`unalias -a` # Remove all aliases from this new shell
STARTTIME=`date +%s`
VERSION='0.2'

# Parameters (Adapt them to your needs)
PREFIXFILE='GLUE20'
DBTYPE=$1
INPUTDIR='dia'
OUTPUTFILE="$PREFIXFILE-$DBTYPE.sql"

# Welcome message
echo "Welcome to GLUE 2.0 SQL schema compilation script v$VERSION"
echo "Input dir: $INPUTDIR"
echo "Output file: $OUTPUTFILE"
date

# Check if needed files and parameters exist
if [ ! -d $INPUTDIR ]; then
  echo "Input directory '$INPUTDIR' does not exist."
  exit 1
fi
if [ $# -ne 1 ]; then
  echo "No database type specified"
  echo "The syntax required is: $0 [postgres/mysql/sybase/oracle/db2/innodb]"
  exit 1
fi

# If OUTPUTFILE exist, make a backup and delete it
if [ -f $OUTPUTFILE ]; then
  mv -f $OUTPUTFILE $OUTPUTFILE.'bak'
fi
touch $OUTPUTFILE

# Collect all content of the files from the INPUTDIR
for file in $INPUTDIR/*.dia; do
  INPUTFILES="$INPUTFILES $file"
done
echo "Input files:$INPUTFILES"

# Collect all content of the files from INPUTDIR and put them into OUTPUTFILE
# -f: Automatically generate foreign keys in tables when needed
# -t TYPE: Type of database to gen SQL for
#          postgres, mysql, sybase, oracle, db2, innodb
tedia2sql -f -t $DBTYPE -o $OUTPUTFILE $INPUTFILES

# Calculate runtime and bye messages
RUNTIME=$[`date +%s` - $STARTTIME]
echo "This script took $RUNTIME seconds to run."
echo "$OUTPUTFILE file is ready!"
