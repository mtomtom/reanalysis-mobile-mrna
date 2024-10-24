#!/bin/bash -e




for name in C-C-root-FN C-C-shoot-FN Col-FN-root-1 Col-FN-root-2 Col-FN-root-3 Col-FN-shoot-1 Col-FN-shoot-2 Col-FN-shoot-3 Col-N-root-1 Col-N-root-2 Col-N-root-3 Col-P-root-1 Col-P-root-2 Col-P-root-3 FN_flower FN_root FN_rosette FN_stemLower FN_stemUpper Ped-FN-root-1 Ped-FN-root-2 Ped-FN-root-3 Ped-FN-shoot-1 Ped-FN-shoot-2 Ped-FN-shoot-3 Ped-N-shoot-1 Ped-N-shoot-2 Ped-N-shoot-3 Ped-P-shoot-1 Ped-P-shoot-2 Ped-P-shoot-3 P-P-root-FN P-P-shoot-FN:
do
#	python3 get_tables.py $name.raw.snp.corrected.vcf $name.table
	sed 's/[][]//g' $name.reduced.table | tr -d \'\" |  tr -d \,\" | sed -e 's/ /\t/g' | cut -f1,2,3,4 > $name.REF_ALT.txt
done



