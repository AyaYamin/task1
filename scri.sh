#!/bin/bash
#./number.sh


################ reading values to files

echo "CPU UTILIZATION = "  > /root/CPU_U &&   mpstat -P ALL >  /root/CPU_U 
echo "MEM USED = " > /root/MEM_U  &&  free -m > /root/MEM_U 
echo "DISK USED = " > /root/DISK_U &&  df  > /root/DISK_U 
echo "DISK NOT USED = " > /root/DISK_U  &&   df > /root/DISK_U

 

################ MEMORY Analysis

echo  "$(cat /root/MEM_U | grep -i "Mem" | tr -s ' ' | cut -d  ' ' -f 3)"  >> /root/MEM_VALUE

cat /root/MEM_VALUE | awk ' {i++; sum+=$1; } END {print sum/i; }' >> /var/www/html/AVERAGE_MEM  
# echo "`date`" >> /var/www/html/AVERAGE_MEM && echo "`uptime`" >> /var/www/html/AVERAGE_MEM

#while read I_M; do
 # read x
  #$SUM_M = x+ $1;
  #I_M++
  #print $SUM_M/I_M >> /var/www/html/AVERAGE_MEM 
#done < /root/MEM_VALUE


################   CPU  Analysis


echo  "$(cat /root/CPU_U | grep -i "all" | tr -s ' ' | cut -d  ' ' -f 13)"  >> /root/CPU_VALUE

cat /root/CPU_VALUE | awk ' {i++; sum+=$1; } END { sum/i; sum=0;i=0}' >> /var/www/html/AVERAGE_CPU
  
CPU_USED="$(mpstat -P ALL |grep -i "all" |awk '{print (100.00-$13)}')"

echo $CPU_USED >>/var/www/html/A_CPU

cat /var/www/html/A_CPU| awk '{ i++; sum+=$1; } END { print sum/i ;  }' >> /var/www/html/AVERAGE_CPU2  

#echo "`date`" >> /var/www/html/AVERAGE_CPU && echo "`uptime`" >> /var/www/html/AVERAGE_CPU



################   DISK  Analysis

USED_DISK="$(df | awk '{print $3}'|sed '1d'| awk '{sum+=$1;i++ } END {print sum/i}')"
echo  $USED_DISK >> /root/diskk
#echo "Average USED DISK" >> /var/www/html/AVERAGE_DISK
cat /root/diskk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK


FREE_DISK="$(df | awk '{print $4}'|sed '1d'| awk '{sum+=$1;i++ } END {print sum/i}')"
echo  $FREE_DISK >> /root/diskkk
#echo "Average AVAILABLE DISK" >> /var/www/html/AVERAGE_DISK
cat /root/diskk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK2

#echo "`date`" >> /var/www/html/AVERAGE_DISK && echo "`uptime`" >> /var/www/html/AVERAGE_DISK




################  FINAL

echo "Average USED MEM" >> /var/www/html/m.html
cat /var/www/html/AVERAGE_MEM| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/m.html
echo "`date`" >> /var/www/html/m.html  && echo "`uptime`" >> /var/www/html/m.html 



echo "Average USED IDLE CPU" >> /var/www/html/c1.html
cat /var/www/html/AVERAGE_CPU2| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/c1.html
echo "`date`" >> /var/www/html/c1.html  && echo "`uptime`" >> /var/www/html/c1.html 



echo "Average FREE CPU" >> /var/www/html/c2.html
cat /var/www/html/AVERAGE_CPU| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/c2.html
echo "`date`" >> /var/www/html/c2.html  && echo "`uptime`" >> /var/www/html/c2.html





echo "Average FREE DISK" >> /var/www/html/d1.html
cat /var/www/html/AVERAGE_DISK2| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/d1.html
echo "`date`" >> /var/www/html/d1.html  && echo "`uptime`" >> /var/www/html/d1.html




echo "Average FREE DISK" >> /var/www/html/d2.html
cat /var/www/html/AVERAGE_DISK| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/d2.html
echo "`date`" >> /var/www/html/d2.html  && echo "`uptime`" >> /var/www/html/d2.html







