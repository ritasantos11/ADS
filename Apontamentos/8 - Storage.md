## Tipos de discos
#### Discos duros (HD)
Tem latência de procura e latência de rotação.
<br />
Boa leitura sequencial.
<br />
Tem pior leitura em zonas aleatórias.

#### Discos de estado sólido (SSD)
Tem melhores tempos de leitura/escrita.
<br />
Limite no nº de escritas.
<br />
Apagar pode ser demorado e ter influência na escrita.

#### Híbridos

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
Suporta a ligação de vários dispositivos.
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

### *smartmontools*
Usa o daemon *smartd* e o utilitário *smartctl*.

## Disk Partitions
• Ter um dispositvo de backup do root que se pode inicializar se algo de errado ocorrer na partição normal do root. Idealmente, o backup do root fica num disco diferente do root normal para proteger de corrupção e problemas de hardware. Um backup do root no mesmo disco não tem qualquer valor.
<br />
• Como a partição do root é duplicada, deve ser pequena para não ocupar tanto espaço haver 2 cópias. Por isso é que */usr* (que contém as librarias e dados do sistema) está num volume separado.
<br />
• Ter */tmp* numa partilão separada	limita o encher do */*.
<br />
• Como */var* guarda os files de log, */var* tem de estar noutra partição para limitarr o */*.
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
Utilizando protocolos de alto nível, qualquer computador pode criar, ler e gravar informações nos sistemas NAS através de uma rede TCP/IP.
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
