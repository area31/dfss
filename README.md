<code>mkdir -p /opt/hackstore/</code>

<code>git clone https://github.com/area31/dfss.git ; mv dfss /opt/hackstore/</code>



To regenerate binary file:

<code>cd /opt/hackstore/dfss/ ; rm dfss.sh.x.c dfss ;  shc -r -T -f dfss.sh &&  mv dfss.sh.x dfss</code>


## Include in /etc/crontab
<code>* * * * *     root    /opt/hackstore/dfss/dfss</code>

