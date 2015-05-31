# Install
1- Create directory:

<code>mkdir -p /opt/hackstore/</code>

2- Clone repo:

<code>git clone https://github.com/area31/dfss.git ; mv dfss /opt/hackstore/</code>

3- Include daemon in /etc/crontab:

<code>* * * * *     root    /opt/hackstore/dfss/dfss</code>




## To regenerate binary file:
Remove old files:

<code>cd /opt/hackstore/dfss/ rm dfss.sh.x.c dfss</code>

Compile new binary:
<code>shc -r -T -f dfss.sh && mv dfss.sh.x dfss</code>

