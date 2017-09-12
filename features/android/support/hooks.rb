before do |scenario|
    nohup appium &

QTD_APPIUM='ps -ef | grep appium | grep -v grep | awk '{print $2}' | wc -l'

if [ $QTD_APPIUM -le  ]; then
   {
        if [ $? -ne 0]; then
            {
                ps -ef | grep appium | grep -v grep | awk '{print $2}' | xargs kill -9
                nohup appium &
            }
        fi
   }
fi 

end