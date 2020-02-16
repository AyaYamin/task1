#!/bin/bash
#./number.sh


################ reading values to files

echo "CPU UTILIZATION = "  > /root/CPU_U &&   mpstat -P ALL >  /root/CPU_U 
echo "MEM USED = " > /root/MEM_U  &&  free -m > /root/MEM_U 
echo "DISK USED = " > /root/DISK_U &&  df  > /root/DISK_U 
echo "DISK NOT USED = " > /root/DISK_U  &&   df > /root/DISK_U

 

################ MEMORY Analysis

echo  "$(cat /root/MEM_U | grep -i "Mem" | tr -s ' ' | cut -d  ' ' -f 3)"  >> /root/MEM_VALUE

#cat /root/MEM_VALUE | awk ' {i++; sum+=$1; } END {print sum/i; }' >> /var/www/html/AVERAGE_MEM  



################   CPU  Analysis


echo  "$(cat /root/CPU_U | grep -i "all" | tr -s ' ' | cut -d  ' ' -f 13)"  >> /root/CPU_VALUE

#cat /root/CPU_VALUE | awk ' {i++; sum+=$1; } END { sum/i; sum=0;i=0}' >> /var/www/html/AVERAGE_CPU
  
CPU_USED="$(mpstat -P ALL |grep -i "all" |awk '{print (100.00-$13)}')"

echo $CPU_USED >>/var/www/html/A_CPU

#cat /var/www/html/A_CPU| awk '{ i++; sum+=$1; } END { print sum/i ;  }' >> /var/www/html/AVERAGE_CPU2  





################   DISK  Analysis

USED_DISK="$(df | awk '{print $3}'|sed '1d'| awk '{sum+=$1;i++ } END {print sum/i}')"
echo  $USED_DISK >> /root/diskk

#cat /root/diskk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK


FREE_DISK="$(df | awk '{print $4}'|sed '1d'| awk '{sum+=$1;i++ } END {print sum/i}')"
echo  $FREE_DISK >> /root/diskkk

#cat /root/diskkk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK2












