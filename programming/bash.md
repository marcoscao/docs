BASH
====

```bash

$? 	# last command exit value
$#
$@
$*


if [ -f "$1" ]; then
	echo "$1 is a file"
fi


# compare strings

if [ "$1" == "some" ]; then
 echo "is equal"
else
 echo "not"
fi


# store console output value/s into var
result = $( date )


# Execute a mysql query from bash script
myvar=$(mysql -D$db -u$user -p$pass -se "$query")
echo $myvar


```



