# LOGICAL VOLUME MANAGEMENT (LVM)
Permite realocar espaço dinamicamente da partição greedy para a partição necessária.
Agrupa dispositivos de armazenamento individuais em volume de grupos. Os blocos num volume de grupo podem ser alocados a volumes lógicos, que são representados por ficheiros de dispositivos de blocos e agem como partições de disco.

## Configuração LVM:
	-Criar (definir) e inicializar volumes físicos.
	-Adicionar os volumes físicos a um volume de grupo.
	-Criar volumes lógicos no volume de grupo.

Os PVs (physical volumes) são a base e representam os discos físicos. Os PVs são combinados em VGs (volume groups) de modo a formar uma pool de storage. Por sua vez, sobre os VGs, criam-se os LVs (logic volumes) e a estes podem ser atribuídos sistemas de ficheiros (ext3, ext4…) e associados mount points.

### Criar volume físico:
	
	$ sudo pvcreate /dev/md0
	Physical volume "/dev/md0" successfully created

### Adicionar volume físico a um volume de grupo:

	$ sudo vgcreate DEMO /dev/md0
	Volume group "DEMO" successfully created

### Criar volume lógico dentro do DEMO e depois criar um filesystem dentro desse volume. Volume lógico com 100GB:

	$ sudo lvcreate -L 100G -n web1 DEMO
	Logical volume "web1" created

### Criar /dev/DEMO/web1-snap como um snapshot do /dev/DEMO/web1
	$ sudo lvcreate -L 100G -s -n web1-snap DEMO/web1

O LVM não sabe nada sobre o coneúdo dos seus volumos, logo deve-se ajustar o size dos volumes e dos filesystems. Para reduzir o size, faz-se primeiro no filesystem e para aumentar no volume.
#### EX: Aumentar size:
	-verificar se o volume tem free space.
	-unmount filesystem.
	-usar lvresize para adicioanr espaço ao volume lógico.
	-ajustar size do filesystem: resize2fs.
	-mount filesystem.
<br />

	$ sudo umount /mnt/web1
	$ sudo lvchange -an DEMO/web1
	$ sudo lvresize -L +10G DEMO/web1
	$ sudo lvchange -ay DEMO/web1
	Extending logical volume web1 to 110.00 GB
	Logical volume web1 successfully resized
<br />

	-Necessário lvchange porque se criou um snapshot do web1.

Maior parte dos filesystems criam um diretório lost+found na raiz de cada filesystem onde o comando fsck pode depositar files cujo diretório pai não pode ser determinado. Este diretório lost+found tem algum espaço extra prealocado para que o fsck consiga guardar files orfãos sem ter de alocar mais entradas de diretórios num filesystem instável.


## fstab file
Fstab is your operating system’s file system table.
O file fstab inclui mounts de sistemas remotos, o primeiro cawpo contém o caminho NFS.



P.262