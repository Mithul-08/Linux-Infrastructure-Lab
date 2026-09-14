
echo "====== Server Health Report ======"

echo
echo "Hostname:"
hostname

echo
echo "Uptime:"
uptime

echo
echo "Memory:"
free -h

echo
echo "Disk:"
df -h /

echo
echo "Nginx status:"
systemctl is-active nginx
if systemctl is-active --quiet nginx
then
    echo "PASS: Nginx is running"
else
    echo "FAIL: Nginx is down"
fi

echo
echo "HTTP check:"

if curl -fsS http://127.0.0.1 > /dev/null
then
    echo "PASS: HTTP is responding"
else
    echo "FAIL: HTTP is not responding"
fi

echo
echo "Listening ports:"
ss -tuln | grep -E ':22|:80'
