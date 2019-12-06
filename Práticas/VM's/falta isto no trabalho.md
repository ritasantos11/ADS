## CONFIGURAR O PGINA NO WINDOWS


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

### Mounting the remote NFS directories at boot
We can mount the remote NFS shares automatically at boot by adding them to /etc/fstab file on the client.

Os diretórios de casa a exportar do OMV para o Desktop, podem ser criados de dois modos:
1. Criando primeiro manualmente os diretórios no OMV para cada utilizador:
	Configurar o OMV como cliente LDAP do server, instalando o módulo LDAP do OpenMediaVault.
	Criar manualmente no OMV (shell na máquina) os diretórios para cada utilizador e mudar o dono (chown) para o utilizador já criado no LDAP.
	Este último ponto é o importante. Podem usar apenas o chown com o uid numérico que foi usado para criar o utilizador no LDAP, podendo evitar o ponto a.
		# chown 1666 /home/radi-sh/adsdevilPara o caso do adsdevil que tem o uid 1666 nos exercícios.

2. Deixando o oddjob-mkhomedir criar os diretórios:
	Colocar o nfs exportado com no_root_squash permitindo assim que quando o utilizador faça login o diretório seja automaticamente criado.
	Sem o no_root_squash o root não consegue criar o diretório pois não tem permissões para isso no nfs.
	Note-se que esta opção abre portas para que a root de outras máquinas consiga escrever e ler como root no NFS.