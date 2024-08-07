templateName=

mkdir sorted
chmod 777 sorted

rm FileProcessed_8.txt
rm MissingQC_8.txt

for i in `/bin/cat FileList_8.txt`
do
	echo `date +"%Y/%m/%d %H:%M:%S"` Processing $i
	
	if test -f ./"$i"
    then
        sort -n $i >> ./sorted/"$i"
        echo $i >> FileProcessed_8.txt
    else 
        echo $i >> MissingQC_8.txt
    fi
	
done

echo "----------------------------------------------"; 
cat MissingQC_8.txt

echo "----------------------------------------------"; 
echo `date +"%Y/%m/%d %H:%M:%S"` Script ends.
