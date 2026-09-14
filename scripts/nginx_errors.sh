
LOG_FILE="/var/log/nginx/access.log"

echo "===== Nginx Health Report ====="

echo
echo "Service status:"
systemctl is-active nginx

echo
echo "Port 80:"
ss -tuln | grep ':80'

echo
echo "Configuration:"
sudo nginx -t 2>&1 | tail -n 2

echo
echo "HTTP test:"
curl -I -s http://127.0.0.1 | head -n 1

echo
echo "404 errors:"
grep -c '" 404 ' "$LOG_FILE"

echo
echo "500 errors:"
grep -c '" 500 ' "$LOG_FILE"

echo
echo "Recent requests:"
sudo tail -n 5 "$LOG_FILE"

echo
echo "===== End Report ====="
