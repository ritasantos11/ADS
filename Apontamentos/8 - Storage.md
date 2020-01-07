## Linux recipe
Listar os discos do sistema e identificar um novo drive:

	$ sudo fdisk -l
	
A seguir, execute qualquer utilitário de particionamento conveniente para criar uma tabela de partição para o drive.
<br />
Coloque todo o espaço do drive numa partição do tipo não especificado ou não formatado.
<br />
Não instalar filesystem.
<br />
Dispositivo da nova partição: /dev/sdc1

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

No file /etc/fstab, copie a linha para um filesystem existente e ajuste-a. O dispositivo a ser montado é /dev/vgname/volname. Se o file fstab existente identificar volumes pelo UUID substitua a cláusula UUID = xxx pelo file do dispositivo. A identificação UUID não é necessária para volumes LVM.
<br />
Por fim, execute o sudo mount mountpoint para montar o filesystem.

## Solid state disks
Espalham as leituras e escritas em bancos de células de memória flash, que são individualmente bastante lentas em comparação com os discos rígidos modernos.
<br />


## Partição
Subsecção de tamanho fixo de um dispositivo de armazenamento.
Cada partição possui o seu próprio file de sipositivo e atua como um dispositivo de armazenamento independente.


