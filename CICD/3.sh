#!/bin/bash

#Напишите скрипт с использованием оператора case.
#При запуске скрипта пользователь вводит в консоль имя файла с расширением, например, 123.jpg или track.mp3.
#Необходимо сообщить пользователю тип файла:

#eсли jpg, gif или png — вывести слово «image»;
#eсли mp3 или wav — вывести слово «audio»;
#eсли txt или doc — вывести слово «text»;
#eсли формат не подходит под заданные выше — написать «unknown».

read -r filename #не изменять

#ваш код
case "$filename" in
    (*.jpg|*.gif|*.png)
    echo "image"
    ;;
    *.mp3|*.wav)
    echo "audio"
    ;;
    *.txt|*.doc)
    echo "text"
    ;;
    *)
    echo "unknown"
    ;;
esac