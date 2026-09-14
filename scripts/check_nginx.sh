
if systemctl is-active --quiet nginx
then
    echo "Nginx is running"
else
    echo "Nginx is DOWN"
    echo "Attempting to restart nginx..."
    sudo systemctl restart nginx
    if systemctl is-active --quiet nginx
    then
        echo "Nginx restarted successfully"
    else
        echo "ERROR:Nginx failed to restart"
    fi
fi
