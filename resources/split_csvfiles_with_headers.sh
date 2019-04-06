#!/bin/bash

headers=0
nooflines=1000

# Reading the Command Line Arguments 
# Pass -h to indicate the presence of header in the CSV File 
# Use -i to provide the input file to be split 
# Use -p to provide the prefix to be used for the Split File 
# Use -l to provide the number of lines to be split.

while getopts ":hi:p:l:" opt; do
  case $opt in
    h)
      echo "Headers on "
      headers=1
      ;;
    i)
      inputfile=$OPTARG
      ;;
    p)
      prefix=$OPTARG
      ;;
    l)
      nooflines=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo "Given Arguments are : "
echo "Headers Flag : $headers"
echo "Input File : $inputfile"
echo "Prefix : $prefix"
echo "No of Lines : $nooflines"

# Setup some temp variables 
headerfile="headers.txt"
tmpdir="tosplit"
tmpfile="tmpfile.csv"


# Echo Splitting the Input File with given arguments 
# Check if -h option was provided or not . If provided , it means we need to take into account the presence of header in the input file.
if [ $headers -eq 1 ]
    then 
        echo "Getting the header from inputfile "
        headerrow=`head -n 1 $inputfile`
        echo $headerrow
        mkdir -p $tmpdir        
        sed '1d' $inputfile > $tmpfile
        cd $tmpdir
        echo "Splitting the file "
        split -l $nooflines ../$tmpfile $prefix

        for i in $( ls * ); 
            do 
                sed -i "1i$headerrow" $i; 
            done  

        echo "Cleaning up"
        cd ..
        cp $tmpdir/* ./
        rm -r $tmpdir
        rm $tmpfile           
fi

# Come up with the acceptable input parameters 
# Perform the necessary tasks like splitting , merging and consolidation of the files . 
