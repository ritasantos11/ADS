## CONFIGURAR O PGINA NO WINDOWS


##### root nao ter password no server:

##### Aumento de espaço de partições no desktop: 512MB no /home e 512MB no /:
Aqui será utilizando o que foi feito nas teóricas (não está diretamente nos slides). Será para usar o disco extra no desktop e adicioná-lo ao LVM. Usando este espaço extra para redimensionar os lv e fazer o resize dos sistemas de ficheiros (ver opção do lvresize para fazer logo).
Adicionar o disco /dev/sdb (tem 4GB, estávazio e nao está montado) do Desktop ao LVM e depois aumentar o tamanho do / e do /home.

	pvcreate /dev/sdb
	vgextend SQUAD /dev/sdb
	lvextend originalLV /dev/sdb


##### Utilização de ligações TLS para o acesso de configuração Web do OpenMediaVault (no omv): 


## SABER
##### Remover um disco do RAID ou LVM:

	# mdadm /dev/md0 -r /dev/sdb



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

