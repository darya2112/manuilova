#!/bin/bash
#filename find.sh
echo "Разработик: Мануилова Д.Е.,12 вариант,ТУСУР,748"


echo "Программа поиска  файлов по имени или по размеру больше назначенного"
echo "С помощью данной программы осуществляется поиск файлов по имени или по размеру файла"
while :
do 
	read -p "Какой поиск Вы планируете совершить:поиск по имени файла[n] или размеру[s]: " var 
	case $var in
			n) read -p "Введите имя запрашиваемого файла: " filename 
  par="-type f -name $filename";;
			s) while true; do
        read -p "Вы можете использовать указанные суффиксы размерности файлов или не применять их для поиска:
	с - байт
	k - килобайт(так же без суфикса)
	М - мегабайт
	G - гигабайт
	Введите минимальный размер от которого будет произведен поиск файла: " filesize
					case ${filesize##*[0-9]} in
							[ckMG]) break;;
							'') break;;
							*) tput setaf 1
									echo "Ошибка,не корректный размер файла!"
                                                                        tput sgr0
									continue
                                        esac
			done
					par="-type f -size +$filesize";;
			*) tput setaf 1
					echo "Ошибка! Для поиска по имени необходимо нажать клавишу [n], для поиска по размеру необходимо нажать клавишу [s]"
					tput sgr0
					continue
	esac
	read -p "Введите путь к каталогу поиска: " dirname
	find $dirname $par
	while : ; do
        read -p "продолжим поиск? [y/n] " flag2
        if [[ "$flag2" == "y" || "$flag2" == "Y" ]]; then
            break;
        elif [[ "$flag2" == "n" || "$flag2" == "N" ]]; then
            exit "$?"
        elif [[ -z "$flag2" ]]; then
            exit "$?"
        else
            1>&2 echo "Invalid value, must be y or n"
        fi
    done
done

