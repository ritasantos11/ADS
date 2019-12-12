# TRABALHO

## Os objetivos serão:
#### CHECK RAID/LVM
##### Ter um sistema de RAID/LVM na máquina de omv:
ver os discos da máquina: lsblk
<br />
usar os devices do sistema (são 9 mais 3 partições (sda1,sda2,sda3))
<br />
Raid: rd10
	
	/dev/sd[b-e]
<br />
LVM:

	pv: /dev/sd[f-g]
	vg: vg2disk
	lv com 1.5GB: lv1
	lv com 1GB: lv2


#### NOT CHECK
##### Exportar diretórios da máquina omv por NFS ou SAMBA:
Na consola web criar shared folders.


#### CHECK
##### Ter openLDAP no server para autenticar os utilizadores em Desktop e Win10: FALTA A PARTE DO WINDOWS
pgina fork instalado no windows: entrar no windows com o login do ldap nos campos do pgina fork.


#### NOT CHECK
##### Usar o LDAP para saber quais os diretórios a montar do utilizador autenticado:


##### Montar em Desktop os diretórios do utilizador autenticado usando NFS ou SAMBA:

#### CHECK
Montar no Desktop os dirs exportados pelo OMV:

	sudo mkdir /nfs
	sudo mount 10.0.0.4:/export/radi-sh /nfs


## Requisitos para trabalho
##### Usar a versão com TLS para segurança no acesso

#### CHECK
##### Haver pelo menos 3 utilizadores configurados no LDAP:

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: uid=church,ou=Users,dc=grupoE,dc=ads,dc=dcc
		uid: church
		cn: church
		objectClass: account
		objectClass: posixAccount
		objectClass: top
		objectClass: shadowAccount
		shadowLastChange: 17839
		shadowMax: 99999
		shadowWarning: 7
		loginShell: /bin/bash
		uidNumber: 1055
		gidNumber: 1055
		homeDirectory: /home/church

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: uid=turing,ou=Admins,dc=grupoE,dc=ads,dc=dcc
		uid: turing
		cn: turing
		objectClass: account
		objectClass: posixAccount
		objectClass: top
		objectClass: shadowAccount
		shadowLastChange: 17839
		shadowMax: 99999
		shadowWarning: 7
		loginShell: /bin/bash
		uidNumber: 1050
		gidNumber: 1050
		homeDirectory: /home/turing

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: cn=turing,ou=Group,dc=grupoE,dc=ads,dc=dcc
		cn: turing
		objectClass: posixGroup
		objectClass: top
		gidNumber: 1050

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: cn=church,ou=Group,dc=grupoE,dc=ads,dc=dcc
		cn: church
		objectClass: posixGroup
		objectClass: top
		gidNumber: 1055

#### CHECK
##### Haver pelo menos 2 grupos diferentes (ex.: admins, users) no LDAP:

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: ou=Users,dc=grupoE,dc=ads,dc=dcc
		objectClass: organizationalUnit
		ou: Users

	ldapadd -x -D cn=Manager,dc=grupoE,dc=ads,dc=dcc -W
		dn: ou=Admins,dc=grupoE,dc=ads,dc=dcc
		objectClass: organizationalUnit
		ou: Admins
	
	
#### CHECK
##### O Win10 pode autenticar por LDAP ou Active Directory (um dos dois basta, não são necessários os 2 modos):
Configurar o pgina.


#### CHECK
## Na avaliação do trabalho será pedido exemplos para testar o acima
##### Ver atributos de um utilizador:
	$ ldapsearch -x -L -W -D "cn=Manager,dc=grupoE,dc=ads,dc=dcc" -b "dc=grupoE,dc=ads,dc=dcc" '(uid=INSERT_USER)'

#### NOT CHECK
##### Autenticar-se no sistema Desktop e Win10:

##### Aceder aos diretórios da home no Desktop:

##### Remover um disco do RAID ou LVM:

	# mdadm /dev/md0 -r /dev/sdb


## Será também verificado o que foi pedido nas aulas práticas:
#### CHECK
##### auser ter sudo no desktop: ($ groups auser    auser : wheel)
	sudo usermod -Ga wheel auser		

##### Acesso de root nas máquinas por ssh negado: CHECK ir ao /etc/ssh sshd_config

	Log in to the Linux or Unix server using ssh: ssh user@your-server
	Edit the /etc/ssh/sshd_config file using vi
	Set PermitRootLogin no to disable SSH logins for root
	Save and close the file
	Reload sshd server in order to deny root log in

##### root nao ter password no server:

	# passwd -d root


#### NOT CHECK
##### Aumento de espaço de partições no desktop: 512MB no /home e 512MB no /:


##### Utilização de ligações TLS para o acesso de configuração Web do OpenMediaVault (no omv): 
