#!/bin/bash
echo -e "\033[32m update git \033[0m"
echo -e "\033[32m copy the sources \033[0m"

#copy the sources
echo -e "\033[32m Enter the updating file the path:"
read -e updating_path
echo -e "\033[31m $updating_path \033[0m"

echo -e "\033[32m Enter the destation file the path:"
read -e destation_path
echo -e "\033[31m $destation_path\033[0m"

echo -e "\033[32m copy?(y or n) \033[0m"
read ANSWER
if [ $ANSWER = "y" ];then
	cp $updating_path $destation_path
	echo -e "\033[31m copy rightly \033[0m"
	ANSWER_NEW="copy_right"
fi

if [ $ANSWER = "n" ];then
	echo -e "\033[31m Do not copy \033[0m"
	ANSWER_NEW="copy_fail"
fi

if [ $ANSWER_NEW = "copy_right" ];then
	echo -e "\033[32m check the sources \033[0m"
	ls $destation_path
	echo -e "\033[32m git check \033[0m "
	cd /root/github/Sources && git status
	echo -e "\033[32m git add sources  \033[0m"
	cd /root/github/Sources && git add $updating_path
	echo -e "\033[32m git commit \033[0m "
	cd $destation_path && git commit -m "$updating_path"
	echo -e "\033[32m git push \033[0m "
	cd /root/github/Sources && git push -u Sources +master
	echo -e "git update successfully "
fi


