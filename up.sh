#! /bin/bash
A=$(sudo cat /root/.aria2c/aria2.session )
if [ $A -z ]
then
             sudo wget -O /root/temp https://cf.trackerslist.com/best_aria2.txt
                  F=$(cat /root/temp)
                  if [ [$F != $A] ]
                  then
                               sudo sed -i '$d' /root/.aria2c/aria2.conf
                                    sudo sed -i '$a bt-tracker='$F'' /root/.aria2c/aria2.conf
                                         echo "update aria2.conf success then restart aria2c"
                                              systemctl restart aria2c
                                                        echo "up end"
                  fi
          else
                  #     echo "$A"
                        echo "aria2 is running"
fi
