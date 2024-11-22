sudo service nfs-common stop
sudo service nfs-kernel-server stop

sudo service nfs-common restart
sudo service nfs-kernel-server restart

sudo service rpcbind restart
