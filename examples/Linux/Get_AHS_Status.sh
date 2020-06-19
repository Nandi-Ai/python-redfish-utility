#!/bin/bash

#    RESTful Interface Tool Sample Script for HPE iLO Products    #
#  Copyright 2014, 2019 Hewlett Packard Enterprise Development LP #

# Description:  This is a sample bash script to find out if       #
#               AHS is enabled or disabled.                       #

# NOTE:  You will need to replace the USER_LOGIN and PASSWORD     #
#        values with values that are appropriate for your         #
#        environment.                                             #

#        Firmware support information for this script:            #
#            iLO 5 - All versions                                 #
#            iLO 4 - All versions.                                #

runLocal(){
  ilorest get AHSEnabled --selector=iLOActiveHealthSystem. -u USER_LOGIN -p PASSWORD
  ilorest logout
}

runRemote(){
  ilorest get AHSEnabled --selector=iLOActiveHealthSystem. --url=$1 --user $2 --password $3
  ilorest logout
}

error(){
  echo "Usage:"
  echo        "remote: Get_AHS_Status.sh ^<iLO url^> ^<iLO username^>  ^<iLO password^>"
  echo        "local:  Get_AHS_Status.sh"
}

if [ "$#" -eq "3" ]
then 
  runRemote "$1" "$2" "$3"
elif [ "$#" -eq "0" ]
then
  runLocal
else
  error
fi