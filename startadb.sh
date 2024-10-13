PORT=`nmap -sT -p30000-45000 $ip | tail -n 3 | head -n 1 | sed -r 's/([1-9][0-9]+)(\/tcp.+)/\1/'`; adb connect "$ip":"$PORT"
adb tcpip 5555
