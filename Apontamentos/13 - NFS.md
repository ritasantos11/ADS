# NFS
Partilha de files.

Wide area networks têm altas latências, que fazem com que as operações se comportem de maneira irregular, e baixa largura de banda, o que resulta num desempenho lento para files maiores. A maioria dos protocolos de serviço de files, incluindo o NFS, têm técnicas para minimizar problemas de desempenho em redes locais e de área ampla (wide area networks).

A maioria dos protocolos tenta minimizar o nº de pedidos de rede.
Por exemplo, a cache de leitura antecipada pré carrega partes de um file num buffer de memória local para evitar atrasos quando uma nova seção do file é lida.
Uma pequena largura de banda de rede extra é consumida num esforço para evitar uma troca completa de ida e volta com o server.
Algumas caches escrevem em memória e enviam as suas atualizações em lotes, reduzindo o atraso na comunicação das operações de escrita para o servidor.

### State
Um cliente deve montar um NFS filesystem antes de usá-lo, assim como um cliente deve montar um filesystem armazenado num disco local.

NFSv4 é um protocolo estável: o cliente e o server mantêm info sobre files abertos e bloqueios. Quando o server falha, o cliente auxilia no processo de recuperação enciando ao server as suas infos sobre o estado anterior a falha. Um server de retorno espera durante um período predefinido que os clientes antigos relatem as suas infos antes de permitir novas operações de bloqueios

### File system exports
NFS servers mantêm uma lista dos diretórios que estão disponíveis para os clientes pela network. Todos os servers exportam pelo menos 1 diretório.
No NFSv4, cada server exporta um único pseudo filesystem hierárquico que incorpora todos os seus diretórios exportados.

P.694


### Sharing files
Sharing files through NFS is simple and involves two basic steps:
	-On the Linux system that runs the NFS server, you export (share) one or more directories by listing them in the /etc/exports file and by running the exportfs command. In addition, you must start the NFS server.
	-On each client system, you use the mount command to mount the directories that your server exported.


### Root access and the nobody account
Although users should generally be given identical privileges wherever they go, it’s traditional to prevent root from running rampant on NFS-mounted filesystems.
By default, the NFS server intercepts incoming requests made on behalf of UID 0 and changes them to look as if they came from some other user. This modification is called “squashing root.” The root account is not entirely shut out, but it is limited to the abilities of a normal user.
A placeholder account named “nobody” is defined specifically to be the pseudouser as whom a remote root masquerades on an NFS server.

root on an NFS client can su to whatever UID it wants, so user files are never really protected. The only real effect of root squashing is to prevent access to files that are owned by root and not readable or writable by the world.


## SERVER SIDE NFS
Um server com NFS exporta um diretório quando coloca o diretório disponível para uso por outras máquinas.
On an NFS server, both mountd and nfsd should start when the system boots,
and both should remain running as long as the system is up. The system startup
scripts typically run the daemons automatically if you have any exports config-
ured.

#### Comando exportfs
Adicionar ou modificar entradas.


Clients are usually allowed to mount subdirectories of an exported directory if they wish, although the protocol does not require this feature.
For example, if a server exports /chimchim/users, a client could mount only /chimchim/users/joe and ignore the rest of the users directory.

### Exports file
The exports file consists of a list of exported directories in the leftmost column followed by lists of associated options.

	/home -vers=4,sec=sys,access=harp.atrust.com
		permits /home to be mounted by the machine harp.atrust.com using version 4 of the NFS protocol and UNIX authentication ( sec=sys ).

Filesystems that are listed in the exports file without a specific set of hosts are usually mountable by all machines. This is a sizable security hole.

Remember to run exportfs -a after changing the /etc/exports file.

P.705


## CLIENT SIDE NFS
NFS filesystems are mounted in much the same way as local disk filesystems. The mount command understands the notation hostname:directory to mean the path directory on the host hostname. As with local filesystems, mount maps the remote directory on the remote host into a directory within the local file tree. After the mount completes, you access an NFS-mounted filesystem just like a local filesystem.

umount works on NFS filesystems just like it does on local filesystems. If the NFS filesystem is in use when you try to unmount it, you will get an error.

P.709


