#! /bin/bash -x

# Primero crear links:
# ls -1 */README*.* */index.html */LICENSE.*  > links.txt


BASE="/CSS/"
DEST1="index.html"
DESTINO="$1/$DEST1"

echo "<html>
<head><title>$DESTINO</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB' crossorigin='anonymous'>

</head>
<body>
<script src='https://code.jquery.com/jquery-3.2.1.slim.min.js' integrity='sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js' integrity='sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q' crossorigin='anonymous'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js' integrity='sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl' crossorigin='anonymous'></script>
<div class='container'>
<div class='row'>
<ul class='list-group' >

" > $DESTINO

# creating links to the files in directory tree

for i in `cat $1/links.txt`; do
    EXTRA=""
    if [[ "$(basename $i)" == "index.html" ]]; then EXTRA="</br></br></br>"; fi
    
    echo "<li class='list-group-item'>
    $EXTRA
    $i
     <a href='$i'>$(basename $i)</a>
     </li>
" >> $DESTINO

done

# creating end tags for HTML

echo "
</ul>
</div>
</div> 
</body>
</html>" >> $DESTINO

#echo $1/`basename $1`.html completed
#sed -e "s:<a href='$1/:<a href=':g" $1/`basename $1`.html > tmp.html
#rm $1/`basename $1`.html
#mv tmp.html $1/`basename $1`.html
#mv tmp.html `basename $1`.html
unset i

#run as
# $webtree.bash directory

