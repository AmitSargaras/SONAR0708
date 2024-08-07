templateName=

mkdir sorted
chmod 777 sorted

rm FileProcessed_7.txt
rm MissingQC_7.txt

for i in `/bin/cat FileList_7.txt`
do
	echo `date +"%Y/%m/%d %H:%M:%S"` Processing $i
	
	if test -f ./"$i"
    then
        sort -n $i >> ./sorted/"$i"
        echo $i >> FileProcessed_7.txt
    else 
        echo $i >> MissingQC_7.txt
    fi
	
done

echo "----------------------------------------------"; 
cat MissingQC_7.txt

echo "----------------------------------------------"; 
echo `date +"%Y/%m/%d %H:%M:%S"` Script ends.
