## Volume de grupos e volumes lógicos associados a gerenciadores de volumes lógicos (LVMs)
Esses sistemas agregam dispositivos físicos para formar conjuntos de armazenamentos chamados volumes de grupos.
<br>
Como o LVM adiciona uma camada de indireção entre blocos lógicos e físicos, ele pode congelar o estado lógico de um volume simplesmente fazendo uma cópia da tabela de mapeamento. Logo, os LVMs geralmente fornecem algum tipo de recurso de snapshot.
<br>
As escritas no volume são direcionadas para novos blosoc e o LVM mantém tabelas de mapeamento antigas e novas. O LVM precisa de armazenar a imagem original e todos os blocos modificados para que eventualmente fique sem espaço se um snapshot nunca for excluído.
<br>
As escritas no volume são direcionadas para novos blocos e o LVM mantém tabelas de mapeamento antigas e novas. O LVM precisa de armazenar a imagem original e todos os blocos modificados para que eventualmente fique sem espaço se um snapshot nunca for excluído.

## Logical Volume Management (LVM)
Método de alocar espaço do disco em volumes lógicos que podem ser facilmente redimensionados ao contrário das partições.
<br>
Em vez de formatar uma fração do disco rígido, o LVM cria unidades abstratas dentro do HD, mesmo que ele esteja alocando arquivos e sistemas.
<br>
Permite realocar espaço dinamicamente da partição greedy para a partição necessária.
<br>
Agrupa dispositivos de armazenamento individuais em volume de grupos. Os blocos num volume de grupo podem ser alocados a volumes lógicos, que são representados por ficheiros de dispositivos de blocos e agem como partições de disco.

### Configuração LVM:
• Criar (definir) e inicializar volumes físicos. <br>
• Adicionar os volumes físicos a um volume de grupo. <br>
• Criar volumes lógicos no volume de grupo: servem para enviar os dados que serão gravados nos volumes físicos nos quais estão integrados os grupos de volume. <br><br>

Os PVs (physical volumes) são a base e representam os discos físicos. Os PVs são combinados em VGs (volume groups) de modo a formar uma pool de storage. Por sua vez, sobre os VGs, criam-se os LVs (logic volumes) e a estes podem ser atribuídos sistemas de ficheiros (ext3, ext4…) e associados mount points.

#### Criar volume físico:
	
	$ sudo pvcreate /dev/md0
	Physical volume "/dev/md0" successfully created

#### Adicionar volume físico a um volume de grupo:

	$ sudo vgcreate DEMO /dev/md0
	Volume group "DEMO" successfully created

#### Criar volume lógico dentro do DEMO e depois criar um filesystem dentro desse volume. Volume lógico com 100GB:

	$ sudo lvcreate -L 100G -n web1 DEMO
	Logical volume "web1" created

#### Criar /dev/DEMO/web1-snap como um snapshot do /dev/DEMO/web1
	$ sudo lvcreate -L 100G -s -n web1-snap DEMO/web1

O LVM não sabe nada sobre o coneúdo dos seus volumes, logo deve-se ajustar o size dos volumes e dos filesystems. Para reduzir o size, faz-se primeiro no filesystem e para aumentar no volume.
#### EX: Aumentar size:
• verificar se o volume tem free space. <br>
• unmount filesystem. <br>
• usar *lvresize* ou *lvextend* para adicionar espaço ao volume lógico. <br>
• ajustar size do filesystem: *resize2fs*. <br>
• mount filesystem. <br>

	$ sudo umount /mnt/web1
	$ sudo lvchange -an DEMO/web1
	$ sudo lvresize -L +10G DEMO/web1
	$ sudo lvchange -ay DEMO/web1
	Extending logical volume web1 to 110.00 GB
	Logical volume web1 successfully resized

-Necessário *lvchange* porque se criou um snapshot do web1.
<br><br>
Maior parte dos filesystems criam um diretório *lost+found* na raiz de cada filesystem onde o comando *fsck* pode depositar files cujo diretório pai não pode ser determinado. Este diretório *lost+found* tem algum espaço extra prealocado para que o *fsck* consiga guardar files orfãos sem ter de alocar mais entradas de diretórios num filesystem instável.

### Snapchots
Utiliza COW (Copy On Write): apenas copia o orignal quando este é alterado.

	$ sudo lvcreate –L 100M –s -n testVG/testLV_snap testLV

A snapshot pode ser montada.
<br>
No LV criado para a snapshot são guardadas as mudanças no sistema original. O tamanho alocado deve ser suficiente para todas as mudanças.
