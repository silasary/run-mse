mkdir /usr/local/share/magicseteditor/
cp -r /src/data /usr/local/share/magicseteditor/
wget https://github.com/CajunAvenger/Cajun-Style-Templates/archive/master.zip -O /src/cajun.zip
unzip /src/cajun.zip -d /src/
cp -r /src/Cajun-Style-Templates-master/* /usr/local/share/magicseteditor/data
cp /src/Cajun-Style-Templates-master/Magic\ -\ Cajun\ Style\ Fonts/* /usr/local/share/fonts/
xvfb-run /src/build/magicseteditor $*