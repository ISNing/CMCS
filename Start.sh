#!/bin/sh

#./Stop.sh

. ./TurnL.sh
. ./CMCS.config #Load config
#sudo service docker start #Have no use for, yet.
#while read line;do
#    eval "$line"
#done < CMCS.config

if test -z "$su" || test -z "$sp" || test -z "$sid" || test -z "$SN_MCSM" || test -z "$SN_N" || test -z "$SN_S" ||test -z "$SN_S1" || test -z "$SN_SH" #|| test -z "$SN_SR" || test -z "$website"
then
  echo "\33[31mERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR\33[0m"
  echo "\33[41mErr:1 Configuration files are not set properly!\33[0m"
  echo "\33[41mPlease check\33[0m \33[5;41m./CMCS.config\33[0m \33[41m!\33[0m"
  echo su: $su
  echo sp: $sp
  echo sid: $sid
  echo SN_MCSM: $SN_MCSM
  echo SN_N: $SN_N
  echo SN_S: $SN_S
  echo SN_S1: $SN_S1
  echo SN_SH: $SN_SH
  echo SN_SR: $SN_SR
  echo sc: $sc
  echo sc1: $sc1
  echo sch: $sch
  echo scr: $scr
  echo website: $website
  return 1
else
if test -z "$nid" && test -z "$sc" 
  then
    echo "\33[31mERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR!!ERROR\33[0m"
    echo "\33[41mErr:1 Configuration files are not set properly!\33[0m"
    echo "\33[41mPlease check\33[0m \33[5;41m./CMCS.config\33[0m \33[41m!\33[0m"
    echo su: $su
    echo sp: $sp
    echo sid: $sid
    echo nid: $nid
    echo SN_MCSM: $SN_MCSM
    echo SN_N: $SN_N
    echo SN_S: $SN_S
    echo SN_S1: $SN_S1
    echo SN_SH: $SN_SH
    echo SN_SR: $SN_SR
    echo sc: $sc
    echo sc1: $sc1
    echo sch: $sch
    echo scr: $scr
    return 1 
  else
  RUN_S=true
  RUN_MCSM=true
  cmd_MCSM='sudo LD_LIBRARY_PATH=. npm start\n'
  if test -z "$sc" | test -z "$sc1"
  then
    echo "Attention! You Haven't sat $sc or $sc1.Please check file:CMCS.config."
    cmd_sakura='./Sakura --su='${su}' --sp='${sp}' --sid='${sid}'\n'
    RUN_S1=false
    cmd_sakura1='exit\n'
    RUN_N=true
    cmd_sunny='./sunny clientid '${nid}'\n'
    RUN_SH=false
    cmd_sakura_http='exit\n'
  else
    cmd_sakura='./Sakura --su='${su}' --sp='${sp}' --sid='${sid}'/'${sc}'\n'
    RUN_S1=true
    cmd_sakura1='./Sakura --su='${su}' --sp='${sp}' --sid='${sid}'/'${sc1}'\n'
    if test -z "$sch"
    then
      echo "Attention! You Haven't sat $sch.If you want to use your own domin,please check CMCS.config."
      RUN_SH=false
      cmd_sakura_http='exit\n'
      RUN_N=true
      cmd_sunny='./sunny clientid '${nid}'\n'
    else
      RUN_N=false
      cmd_sunny='exit\n'
      RUN_SH=true
      cmd_sakura_http='./Sakura --su='${su}' --sp='${sp}' --sid='${sid}'/'${sch}'\n'
    fi
    if test -z "$scr"
    then
      RUN_SR=false
      cmd_sakura_remote='exit\n'
    else
      RUN_SR=true
      cmd_sakura_remote='sudo service xrdp restart;nohup firefox $website >/dev/null 2>&1 &;./Sakura --su='${su}' --sp='${sp}' --sid='${sid}'/'${scr}'\n'
    fi
  fi
  fi
fi

echo "####################################################"
echo "#                                                  #"
echo "#  Minecraft Server(Mohist[PC]+Nukkit[PE])Starter  #"
echo "#                                                  #"
echo "#             Website:                             #"
echo "#                  QQ Group Number:                #"
echo "#                                Made By SF2005    #"
echo "####################################################"

#Screen启动
cd MCSManager
if  (( $RUN_MCSM == true ))
then
  echo MCSManager[Panel] Starting...
  #MCSManager
  screen -dmS $SN_MCSM
  screen -x -S $SN_MCSM -p 0 -X stuff "$cmd_MCSM"
  echo MCSManager[Panel] Started.
else
  #echo "Var \$RUN_MCSM is not true.We will no start MCSManager."
  sleep 0.01
fi

cd ../
if  (( $RUN_N == true ))
then
  echo Sunny Ngrok[HTTP] Starting...
  #Sunny Ngrok
  screen -dmS $SN_N
  screen -x -S $SN_N -p 0 -X stuff "$cmd_sunny"
  echo Sunny Ngrok[HTTP] Started.
else
  #echo "Var \$RUN_N is not true.We will not start Sunny Ngrok."
  sleep 0.01
fi

if  (( $RUN_S == true ))
then
  echo Sakura Frp Starting...
  #Sakura Frp
  screen -dmS $SN_S
  screen -x -S $SN_S -p 0 -X stuff "$cmd_sakura"
  echo Sakura Frp Started.
else
  #echo "Var \$RUN_S is not true.We will not start Sakura Frp."
  sleep 0.01
fi

if  (( $RUN_S1 == true ))
then
  echo Sakura Frp-1 Starting...
  #Sakura Frp-1
  screen -dmS $SN_S1
  screen -x -S $SN_S1 -p 0 -X stuff "$cmd_sakura1"
  echo Sakura Frp-1 Started.
else
  #echo "Var \$RUN_S1 is not true.We will not start Sakura Frp-1."
  sleep 0.01
fi

if  (( $RUN_SH == true ))
then
  echo Sakura Frp-HTTP Starting...
  #Sakura Frp-HTTP
  screen -dmS $SN_SH
  screen -x -S $SN_SH -p 0 -X stuff "$cmd_sakura_http"
  echo Sakura Frp-HTTP Started.
else
  #echo "Var \$RUN_SH is not true.We will not start Sakura Frp-HTTP."
  sleep 0.01
fi

if  (( $RUN_SR == true ))
then
  echo Sakura Frp-RDP Starting...
  #Sakura Frp-HTTP
  screen -dmS $SN_SR
  screen -x -S $SN_SR -p 0 -X stuff "$cmd_sakura_remote"
  echo Sakura Frp-RDP Started.
else
  #echo "Var \$RUN_SR is not true.We will not start Sakura Frp-RDP."
  sleep 0.01
fi

echo
echo
echo All Started, Play！！！！！！！
echo
echo
echo "!!!!!!!!!! \33[41m注意，请\33[0m \33[5;41m不要关闭此窗口\33[0m \33[41m，这会导致你的\33[0m\33[0m\33[5;41m服务器关闭！\33[0m  !!!!!!!!!!"
echo 

#实际上是给我自己看的 —_— 

echo "
                        后台应用操作指南

  指令/热键                                 用途
    screen -R [ScreenName]      查看命令台的输出
    Ctrl+Z                      挂起当前任务
    Ctrl+C                      结束当前任务
    screen -list                查看正在运行的screen
    ps -aux | grep \"[ProgressName]\"查找[ProgressName]进程
    killall [ProccessName]      强行停止{所有}[ProccessName]进程

                    ScreenName对照
  Progress                          ScreenName
    Mincraft Server Manager         $SN_MCSM
    Sakura Frp                      $SN_S
    Sakura Frp-1                    $SN_S1
    Sakura Frp-HTTP                 $SN_SH
    Sakura Frp-RDP                  $SN_SR
    Sunny Ngrok                     $SN_N
"
return 0