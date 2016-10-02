#!/bin/bash - 
#===============================================================================
#
#          FILE: wait_connection.sh
# 
#         USAGE: ./wait_connection.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/28/2016 18:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

while state=$(aws ec2 describe-vpn-connections --vpn-connection-ids $1 --query VpnConnections[*].State --output text);\
  [[ $state != "available" ]]; do
  echo -n '.'
  sleep 3s
done

