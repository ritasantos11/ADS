# NFS
Start with the server system that exports — makes available to the client systems — the contents of a directory. On the server, you must run the NFS service and designate one or more file systems to export.

To export a file system, you have to add an appropriate entry to the /etc/exports file.
Suppose that you want to export the /home directory, and you want to enable the host named LNBP75 to mount this file system for read and write operations. You can do so by adding the following entry to the /etc/exports file:

	/home LNBP75(rw,sync)

If you want to give access to all hosts on a LAN such as 192.168.0.0, you could change this line to

	/home 192.168.0.0/24(rw,sync)


First, make a share directory called nfs no host:

	sudo mkdir /var/nfs/general -p

No cliente:
	
	sudo mkdir -p /nfs/general
	sudo mkdir -p /nfs/home

Now that we have some place to put the remote shares and we’ve opened the firewall, we can mount the shares by addressing our host server, which in this guide is 203.0.113.0, like this:

	sudo mount 203.0.113.0:/var/nfs/general /nfs/general
	sudo mount 203.0.113.0:/home /nfs/home
These commands should mount the shares from the host computer onto the client machine. 




# NFS
### Exportar diretórios do omv por NFS

	nano /etc/exports

##### Acrescentar:

	dir_a_acrescentar ip_do_Desktop(rw,sync)

##### Fazer:
	exportfs -a

### Montar no Desktop os diretórios do user autenticado usando NFS
##### No Desktop:
	
	sudo mkdir /nfs/general
	sudo mkdir /nfs/home

	sudo mount ip_do_omv/var/nfs/general /nfs/general
	sudo mount ip_do_omv/home /nfs/home