## CONFIGURAR O PGINA NO WINDOWS



##### Aumento de espaço de partições no desktop: 512MB no /home e 512MB no /:
Aqui será utilizando o que foi feito nas teóricas (não está diretamente nos slides). Será para usar o disco extra no desktop e adicioná-lo ao LVM. Usando este espaço extra para redimensionar os lv e fazer o resize dos sistemas de ficheiros (ver opção do lvresize para fazer logo).
Adicionar o disco /dev/sdb (tem 4GB, estávazio e nao está montado) do Desktop ao LVM e depois aumentar o tamanho do / e do /home.

	Desktop: tem lvm


##### Usar o LDAP para saber quais os diretórios a montar do utilizador autenticado:

##### Utilização de ligações TLS para o acesso de configuração Web do OpenMediaVault (no omv):
Configurar o ldap no omv.


### Mounting the remote NFS directories at boot
We can mount the remote NFS shares automatically at boot by adding them to /etc/fstab file on the client.

##### Exportar diretórios da máquina omv por NFS

##### Montar em Desktop os diretórios do utilizador autenticado usando NFS
Os diretórios de casa a exportar do OMV para o Desktop:
1. Criando primeiro manualmente os diretórios no OMV para cada utilizador:
	Configurar o OMV como cliente LDAP do server, instalando o módulo LDAP do OpenMediaVault.

#### está feito pó adsdevil
Criar manualmente no OMV (shell na máquina) os diretórios para cada utilizador e mudar o dono (chown) para o utilizador já criado no LDAP.
Este último ponto é o importante. Podem usar apenas o chown com o uid numérico que foi usado para criar o utilizador no LDAP, podendo evitar o ponto a.
	# chown 1011 /home/radi-sh/adsdevil

