#!/bin/bash
rename 's/.lvm/0.txt/' *.lvm
files=$(ls $1 | grep "0.txt")
#echo ${files}
for file in ${files[@]}
do
	#echo file
	./format ${path}${file} ${path}${file//0.txt}.txt
done
