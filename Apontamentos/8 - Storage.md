# Linux recipe
Listar os discos do sistema e identificar um novo drive:
	$ sudo fdisk -l
A seguir, execute qualquer utilitário de particionamento conveniente para criar uma tabela de partição para o drive.
Coloque todo o espaço do drive numa partição do tipo não especificado ou não formatado.
Não instalar filesystem.
Dispositivo da nova partição: /dev/sdc1

### Preparar para uso de LVM:
	
	$ sudo pvcreate /dev/sdc1

### Criar volume de grupo:

	$ sudo vgcreate vgname /dev/sdc1

### Criar volume lógico:

	$ sudo lvcreate -l 100%FREE -n volname vgname

### Criar um filesystem:

	$ sudo mkfs -t ext4 /dev/vgname/volname

### Criar um mount point:
	
	$ sudo mkdir mountpoint

### Definir as opções de montagem, mntpoint:

	$ sudo vi /etc/fstab

No file /etc/fstab, copie a linha para um filesystem existente e ajuste-a. O dispositivo a ser montado é /dev/vgname/volname. Se o file fstab existente identificar volumes pelo UUID substitua a cláusula UUID = xxx pelo file do dispositivo. A identificação UUID não é necessária para volumes LVM.

Por fim, execute o sudo mount mountpoint para montar o filesystem.


## Partição
Subsecção de tamanho fixo de um dispositivo de armazenamento.
Cada partição possui o seu próprio file de sipositivo e atua como um dispositivo de armazenamento independente.


## RAID
Uma matriz RAID combina vários dispositivos de armazenamento num dispositivo virtualizado.


## Volume de grupos e volumes lógicos associados a gerenciadores de volumes lógicos (LVMs)
Esses sistemas agregam dispositivos físicos para formar conjuntos de armazenamentos chamados volumes de grupos.
Como o LVM adiciona uma camada de indireção entre blocos lógicos e físicos, ele pode congelar o estado lógico de um volume simplesmente fazendo uma cópia da dabela de mapeamento. Logo, os LVMs geralmente fornecem algum tipo de recurso de snapshot. As escritas no volume são direcionadas para novos blosoc e o LVM mantém tabelas de mapeamento antigas e novas. O LVM precisa de armazenar a imagem original e todos os blocos modificados para que eventualmente fique sem espaço se um snapshot nunca for excluído.
