acrescentar users na workstation
<br />
reboot a tudo
<br />
ir pelo spice
<br />

## Relatório
O objetivo do relatório é indicar a arquitetura usado (semelhante ao enunciado) indicando:
    uso de NFS ou SAMBA
    que diretório(s) exportados, que diretório(s) importados e aonde
    como foi construído no OMV a área dos utilizadores (RAID ou LVM, porquê? Se RAID qual RAID, porquê? Se LVM o normal? Porquê?)



dirs exportados são os dirs do filesystem assente no RAID.
<br />
São os dirs p os users:

    radi-sh/areas/dir_user

<br />
São montados na pasta /nfs do Desktop:

    /nfs/areas/USER


#### NFS
Network File System é um protocolo feito para partilhar sistemas de ficheiros entre máquinas, que é feito neste trabalho entre a máquina Desktop do cliente e a máquina OMV (que é o servidor). Um cliente autentica-se(?) na sua área num computador remoto(?) e consegue aceder a um sistema de ficheiros como se estivesse no seu próprio computador.  Usamos a versão 4 que contém servidor com manutenção de estado sobre todos os ficheiros que todos os clientes têm aberto no servidor e é bastante rápido sem ser muito intenso no CPU do server. Informação não é perdida quando um NFS server falha, principalmente num servidor sem manutenção de estado, porém no nosso pode gerar incoerências entre as máquinas. Utiliza também o protocolo de transporte TCP/IP.
Lista de diretórios exportados : 
etc/exports
Usar o mount para montar os diretórios exportados: 
    mount –t nfs4 –o rw,hard,bg server:/exportdir/USER /home/USER (ou é /nfs/areas/USER?)
If you want to give access to all hosts on a LAN such as 192.168.0.0: 
    /home 192.168.0.0/24(rw,sync)
First, make a share directory called nfs no host:
    sudo mkdir /var/nfs/general -p
No Dektop:
   /nfs/areas/USER
Now that we have some place to put the remote shares and we’ve opened the firewall, we can mount the shares by addressing our host server, which in this guide is 203.0.113.0, like this:
    sudo mount 203.0.113.0:/var/nfs/general /nfs/general
    sudo mount 203.0.113.0:/home /nfs/home
Acrescentar diretorios:
    dir_a_acrescentar ip_do_Desktop(rw,sync)
Montar no Desktop os diretórios do user autenticado usando NFS
No Desktop:
    sudo mkdir /nfs/general
    sudo mkdir /nfs/home

    sudo mount ip_do_omv/var/nfs/general /nfs/general
    sudo mount ip_do_omv/home /nfs/home

Using NFS, the user or a system administrator can mount all or a portion of a file system.


#### RAID 10
A área dos utilizadores foi construída no RAID de nível 10 com 4 discos (sdb,sdc,sdd,sde).
O RAID 10 oferece um desempenho superior durante a transferência de dados e não compromete a integridade das informações caso ocorra algum problema num dos discos.
As escritas e leituras são feitas em discos diferentes simultaneamente (tal como no RAID 0) e pelo menos 1 disco pode falhar e recuperar-se (tal como no RAID 1).

RAID é usado para redundância. Por exemplo, se algum dado se perder devido a uma falha num disco, o RAID consegue recuperar.


#### LVM com 4 discos mas não foi usado para a área dos users
4 volumes físicos
1 volume de grupo
2 volumes lógicos lineares

por defeito ficou linear
lv linear: começa a escrever no primeiro disco, quando este fica cheio escreve no seguinte; podem ser usados discos de diferentes capacidades.

lv stripped: os dados são escritos repartidamente ao longo dos discos físicos; escrita e leitura em paralelo; assemelha-se ao RAID 0; devem ser utilizados discos de igual capacidade.

lv mirrored:
Quando os dados são escritos num dispositivo, eles são também escritos no disco mirror, fazendo com que neste (mirror) exista uma cópia integral do dispositivo que foi escrito primeiramente. Como é análogo ao RAID 1, traz redundância dos dados.

