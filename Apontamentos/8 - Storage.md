Os discos rígidos são sistemas tolerantes a falhas que usam codificção de correção de erros e firmware inteligente para esconder as suas imperfeições do host do SO.

## Linux recipe
Listar os discos do sistema e identificar um novo drive:

	$ sudo fdisk -l
	
A seguir, execute qualquer utilitário de particionamento conveniente para criar uma tabela de partição para o drive.
<br />
Coloque todo o espaço do drive numa partição do tipo não especificado ou não formatado.
<br />
Não instalar filesystem.
<br />
Dispositivo da nova partição: */dev/sdc1*

#### Preparar para uso de LVM:
	
	$ sudo pvcreate /dev/sdc1

#### Criar volume de grupo:

	$ sudo vgcreate vgname /dev/sdc1

#### Criar volume lógico:

	$ sudo lvcreate -l 100%FREE -n volname vgname

#### Criar um filesystem:

	$ sudo mkfs -t ext4 /dev/vgname/volname

#### Criar um mount point:
	
	$ sudo mkdir mountpoint

#### Definir as opções de montagem, mntpoint:

	$ sudo vi /etc/fstab

No file */etc/fstab*, copie a linha para um filesystem existente e ajuste-a. O dispositivo a ser montado é */dev/vgname/volname*. Se o file fstab existente identificar volumes pelo UUID substitua a cláusula UUID = xxx pelo file do dispositivo. A identificação UUID não é necessária para volumes LVM.
<br />
Por fim, execute o sudo mount mountpoint para montar o filesystem.

## Solid state disks (SSD)
Espalham as leituras e escritas em bancos de células de memória flash, que são individualmente bastante lentas em comparação com os discos rígidos modernos.

## Interfaces de acesso aos discos
#### ATA (Advanced Technology Attachment)
Usa um protocolo de alto nível para a comunicação entre o computador e os discos.
<br />
Os discos PATA (Parallel ATA interface) são chamados de IDE.

#### SATA (Serial ATA)
Sucessor do PATA.
<br />
Suporta hotswapping.
<br />
Tem débitos de transferência mais elevados que ATA.

#### SCSI (Small Computer System Interface)
Suporta vários discos num BUS e várias velocidades e estilos de comunicação.
<br />
Tem débitos altos de transferência.
<br />
Os comandos definidos no stander são utilizados noutros protocolos.

#### Non-Volatile Memory express (NVMe)
Foi desenvolvido para discos SSD que têm reduzida latência e paralelismo.
<br />
Utiliza PCIe (Periperal Component Interconnect express).

#### Fibre Channel
Interface série em fibra ótica.
<br />
Tem elevados débitos de transferência.
<br />
SUporta a ligação de vários dispositivos.
<br />
Pode transportar comandos SCSI.

#### USB (Universal Serial Bus)
Tem vários débitos.
<br />
Tem discos externos (fácil hotswap).

#### Firewire (IEEE 1394)
Tem débitos mais elevados que USB, com hotswap.
<br />
Permite ligação entre dispositivos ao BUS.

## Dispositivo de armazenamento (*/dev/sda*)
Hard disk, flahs drive, SSD, RAID externo implementado em hardware.

## Partição (*/dev/sda1*)
Subsecção de tamanho fixo de um dispositivo de armazenamento.
<br />
Cada partição possui o seu próprio file de dispositivo e atua como um dispositivo de armazenamento independente.

### *hdparm*
Ferramenta linux para configurar e ver os parâmetros dos discos.

## SMART (Self-Monitoring, Analysis and Reporting Technology)
Permite monitorizar e configurar a “vigilância” pelo próprio sistema do disco.
<br />
O software standard para disputas SMART nos sistemas unix e linux é o pacote *smartmontools*.

#### *smartmontools*
Usa o daemon *smartd* e o utilitário *smartctl*.

## Disk Partitions
• Ter um dispositvo de backup do root que se pode inicializar se algo de errado ocorrer na partição normal do root. Idealmente, o backup do root fica num disco diferente do root normal para proteger de corrupção e problemas de hardware. Um backup do root no mesmo disco não tem qualquer valor.
<br />
• Como a partição do root é duplicada, deve ser pequena para não ocupar tanto espaço haver 2 cópias. Por isso é que */usr* (que contém as librarias e dados do sistema) está num volume separado.
<br />
• Ter */tmp* num filesystem separado	limita os files temporários a um tamanho finito.
<br />
• Como */var* guarda os files de log, /var tem de estar noutra partição para ser mais fácil encher o root.
<br />
• Pôr os diretórios home dos users numa partição ou volume separado para o caso de a partição do root ser destruída ou corrompida.
<br />
• Espaço de swap em discos diferentes pode aumentar a performance.
<br /><br />
O sistema escreve uma "label" no início do disco para definir o nº de blocos incluídos em cada partição.
<br />
O device driver responsável por representar o disco lê a label e usa a tabela de partição para calcular a localização física de cada partição.

### MBR (Master Boot Record)
Tem 4 partições.

### GPT: GUID (Globally Unique ID) Partition Tables
Define só 1 tipo de partição e pode-se criar muitas.
<br />
Cada partição tem um tipo específico por um ID code.

## Sistemas NAS (Network-attached storage)
Utilizando protocolos de alto nível, qualquer computador pode criar, ler e gravar informações nos NAS atravém de um rede TCP/IP.
<br />
Operação básica: abre o file X e manda-me os primeiros 4KiB de dados.
<br />
EX: NFS, SMB/CIFS.

## Sistema SAN (Storage Area Network)
Sistema de baixo nível para armazenamento abstrato que faz com que o armazenamento via network se pareça com um disco rígido local.
<br />
Operações: instruções para ler e escrever blocos do disco.
<br />
Para um cliente usar um armazenamento SAN para manter um filesystem tem de fornecer a sua implementação do filesystem.
