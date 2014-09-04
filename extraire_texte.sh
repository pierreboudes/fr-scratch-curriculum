#!/bin/bash

pdfseparate $1 page_par_page/page-%03d.pdf

cd page_par_page

for i in `ls *pdf`
do
    pdftotext $i
done

for i in `ls *txt`
do
    (echo "* ${i%.txt}"; cat $i; echo "") > tmp
    mv tmp $i
done

cat *.txt > ../CreativeComputing.org
