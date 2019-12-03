# CONFIGURAR O PGINA NO WINDOWS



root nao ter password no server:

aumento de espaço de partições no desktop: 512MB no /home e 512MB no /:
	Aqui será utilizando o que foi feito nas teóricas (não está diretamente nos slides). Será para usar o disco extra no desktop e adicioná-lo ao LVM. Usando este espaço extra para redimensionar os lv e fazer o resize dos sistemas de ficheiros (ver opção do lvresize para fazer logo).

utilização de ligações TLS para o acesso de configuração Web do OpenMediaVault (no omv): 


# SABER
remover um disco do RAID ou LVM:
	# mdadm /dev/md0 -r /dev/sdb
