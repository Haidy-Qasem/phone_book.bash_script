#!/bin/bash
<<c
 create different categories for phone book ..ex:family,work,friends...and enter name and number of each person
c
create_book() 
{
	echo "Enter Phone_book Category to create"
	read file
	res=`ls | grep $file | wc -w`
	if [ $res -gt 0 ]
	then
		echo "Phone_Book Category already Exist"
	else
		touch $file
	fi
}
list()
{
	echo "Enter Phone_Book Category"
	read file
	res=`ls | grep $file | wc -w`
	if [ $res -gt 0 ]
	then
		cat $file
	else
		echo "Category does not Exist"
	fi
}
add()
{
	echo "Enter Phone_book Category"
	read file
	res=`ls | grep $file | wc -w`
	if [ $res -gt 0 ]
	then		
		echo "Enter Name"
		read name
		len=`cat $file | grep $name | wc -w`
		if [ $len -gt 0 ]
		then
			echo "Name already Exist"
		else
			echo "Enter Number"
			read num
			phone_book=`echo $name $num `
			echo $phone_book >> $file
			echo "New file added"	
		fi
	else
		echo "Category does not Exist"
	fi
}
edit()
{
	echo "Enter Phone_Book Category"
	read file
	res=`ls | grep $file | wc -w`
	if [ $res -gt 0 ]
	then
		echo "Enter Name"
		read name
		len=`cat $file | grep $name | wc -w`
		if [ $len -gt 0 ]
		then
			echo "Enter data to edit"
			read name num
			new=`echo $name $num`
			old=`cat $file | grep $name`
			echo "Old Data: $old"
			echo "New Data: $new"
			sed -i s/"$old"/"$new"/g $file
			echo "Data Modified"
		else
			echo "Name does not Exist"
		fi
	else
		echo "Category does not Exist"
	fi
}
remove()
{
	echo "Enter Phone_Book Category"
	read file
	res=`ls | grep $file | wc -w`
	if [ $res -gt 0 ]
	then
		echo "Enter Name"
		read name
		len=`cat $file | grep $name | wc -w`
		if [ $len -gt 0 ]
		then
			old=`cat $file | grep $name`
			sed -i s/"$old"//g $file
			sed -i /^$/d $file
			new=`echo $name $num`
			echo "Data Removed"
		else
			echo "Name does not Exist"
		fi
	else
		echo "Category does not Exist"
	fi		
}
quit()
{
	exit
}
while  :
do
	echo " *********Address Book********* "
	echo "Press 1 to Create"
	echo "Press 2 to List/Search"
	echo "Press 3 to Add"
	echo "Press 4 to Edit"
	echo "Press 5 to Remove"
	echo "Press 6 to Quit"
	echo "Please Enter Your selection"
	read choice
	case $choice in
		1) create_book ;;
		2) list ;;
		3) add ;;
		4) edit ;;
		5) remove ;;
		6) quit ;;
	esac
done
