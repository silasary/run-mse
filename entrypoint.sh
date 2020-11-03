mkdir /usr/local/share/magicseteditor/
cp -r /src/data /usr/local/share/magicseteditor/
wget https://github.com/CajunAvenger/Cajun-Style-Templates/archive/master.zip -O cajun.zip
unzip cajun.zip
cp -r Cajun-Style-Templates-master/* /usr/local/share/magicseteditor/data
cp Cajun-Style-Templates-master/Magic\ -\ Cajun\ Style\ Fonts/* /usr/local/share/fonts/
xvfb-run ./magicseteditor $*