#!/bin/bash

cat /root/MEM_VALUE | awk ' {i++; sum+=$1; } END {print sum/i; }' >> /var/www/html/AVERAGE_MEM 
echo -n "" > /root/MEM_VALUE


cat /root/CPU_VALUE | awk ' {i++; sum+=$1; } END { sum/i; sum=0;i=0}' >> /var/www/html/AVERAGE_CPU
cat /var/www/html/A_CPU| awk '{ i++; sum+=$1; } END { print sum/i ;  }' >> /var/www/html/AVERAGE_CPU2
echo -n "" > /root/CPU_VALUE
echo -n "" > /var/www/html/A_CPU



cat /root/diskk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK
cat /root/diskkk | awk '{ summ += $1; ii++ } END { print summ/ii }' >> /var/www/html/AVERAGE_DISK2
echo -n "" > /root/diskk
echo -n "" > /root/diskkk





################  FINAL

echo  "Average USED MEM" >> /var/www/html/m.html
cat /var/www/html/AVERAGE_MEM| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/m.html
 
echo "`date`" >> /var/www/html/m.html 

 echo "`uptime`" >> /var/www/html/m.html 



echo "Average USED IDLE CPU\n" >> /var/www/html/c1.html
cat /var/www/html/AVERAGE_CPU2| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/c1.html
echo "`date`" >> /var/www/html/c1.html  && echo "`uptime`" >> /var/www/html/c1.html 



echo "Average FREE CPU\n" >> /var/www/html/c2.html
cat /var/www/html/AVERAGE_CPU| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/c2.html
echo "`date`" >> /var/www/html/c2.html  && echo "`uptime`" >> /var/www/html/c2.html





echo "Average FREE DISK\n" >> /var/www/html/d1.html
cat /var/www/html/AVERAGE_DISK2| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/d1.html
echo "`date`" >> /var/www/html/d1.html  && echo "`uptime`" >> /var/www/html/d1.html




echo "Average FREE DISK\n" >> /var/www/html/d2.html
cat /var/www/html/AVERAGE_DISK| awk '{i++ ; sum+=$1; } END {print sum/i ;  }' >> /var/www/html/d2.html
echo "`date`" >> /var/www/html/d2.html  && echo "`uptime`" >> /var/www/html/d2.html




 
