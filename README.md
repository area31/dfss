## Install
Create directory and clone repo:
<code>mkdir -p /opt/hackstore/</code>
<code>git clone https://github.com/area31/dfss.git ; mv dfss /opt/hackstore/</code>

Include daemon in /etc/crontab
<code>* * * * *     root    /opt/hackstore/dfss/dfss</code>

# To regenerate binary file:
<code>cd /opt/hackstore/dfss/ ; rm dfss.sh.x.c dfss ;  shc -r -T -f dfss.sh &&  mv dfss.sh.x dfss</code>

