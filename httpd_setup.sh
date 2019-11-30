if [ $(id -u) -ne 0 ]
then
  echo "Must be run as su."
  exit
fi

echo "Making sample httpd.conf at /etc/httpd/httpd.conf..."
mkdir /etc/httpd
cp /etc/examples/httpd.conf /etc/httpd/httpd.conf
echo "Done!"

echo "Adding user 'httpdconfig'..."
useradd -mv -b /home/httpdconfig -d /home/httpdconfig httpdconfig
chown -R httpdconfig /etc/httpd/ 
chown -R httpdconfig /etc/httpd/*
echo "Done!"

echo "Setting httpd to read from custom config..."
rcctl set httpd flags -f /etc/httpd/httpd.conf
echo "Enabling httpd..."
rcctl enable httpd
echo "Done!"

echo "Initializing httpd.conf repo..."
git init --bare /home/httpdconfig/httpd.conf
cd helpers
ksh create_post_receive\
  "\/home\/httpdconfig\/temp" "\/etc\/httpd\/httpd.conf" >\
  /home/httpdconfig/httpd.conf/hooks/post-receive
chown -R httpdconfig /home/httpdconfig/httpd.conf
echo "Done!"
