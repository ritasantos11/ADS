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

