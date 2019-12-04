# RAID (REDUNDANT ARRAYS OF INEXPENSIVE DISKS)
Uma matriz RAID combina vários dispositivos de armazenamento num dispositivo virtualizado.
RAID pode:
	-melhorar o desempenho distribuindo ("striping") dados em vários drivers, permitindo que vários drivers trabalhem simultaneamente para fornecer ou absorver um único fluxo de dados.
	-replicar dados em vários drivers, diminuindo o risco associado a um único disco com falha.

Replicação assume 2 formas:
	-mirroring, onde os blocos de dados são reproduzidos bit a bit em vários drivers diferentes.
	-esquemas de paridade, onde uma ou mais drivers contêm um checksum de correção de erros dos blocos nos drivers de dados restantes. São mais eficientes no espaço em disco mas têm desempenho inferior.

## RAID 0:
	-usado estritamente para aumentar o desempenho.
	-divide os dados entre 2 ou mais discos.
	-combina 2 ou mais drivers de tamanho igual, mas em vez de empilhá-los de ponta aponta, distribui os dados alternadamente entre os discos no pool.
	-as leituras e as escritas sequenciais são distribuídas entre vários discos, diminuindo os tempos de escrita e acesso.

## RAID 1:
	-as escritas são duplicadas para 2 ou mais drivers simultaneamente.
	-2 cópias dos dados são guardados em 2 disco físicos e os dados são sempre iguais.
	-as escritas são mais lentas do que o que seria se fosse num único driver.
	-oferece velocidade de leitura comparável ao RAID 0, porque as leituras podem ser realizadas entre vários drivers de disco duplicados.
	-a matriz continua a funcionar enquanto, pelo menos, 1 drive estiver a funcionar.

## RAID 5:
	-distribui dados e info de paridade, adicionando redundância e melhorando simultanemante o desempenho de leitura.
	-um arranjo de paridade para ajudar a reconstruir os dados do drive em caso de falhas no disco.
	-mais eficiente no uso de espaço em disco do que o raid 1.
	-se houver N drives numa matriz (são necessários pelo menos 3), N-1 delas pode armazenar dados.

## RAID 6
	-semelhante ao raid 5 com 2 discos de paridade.
	-uma matriz raid 6 pode suportar a falha completa de 1 driver sem perder dados.

RAID 5 e RAID 1 de 2 discos podem tolerar apenas a falha de um único dispositivo. Depois de ocorrer uma falha, a matriz fica vulnerável a uma segunda falha.


## Disk failure recovery
Substitui-se o disco com falha por outro de tamanho semelhante ou maior e depois diz-se à implementação do raid para substituir o antigo disco pelo novo. A seguir, segue-se um longo periodo durante o qual as infos de paridade ou de mirror são reescritas no novo disco.


## Desvantagens do RAID 5
O raid 5 não substitui os backups offline regulares.
Protege o sistema contra a falha de um disco.
Não protege contra a remoção acidental de files.
Não protege contra controler failures, icêndios, hackers, etc.
Grava blocos de dados em discos N-1 e blocos de paridade no Nth disco. Sempre que um bloco aleatório é gravado, pelo menos um bloco de dados e o bloco de paridade para essa faixa (stripe) devem ser atualizados.
Não sabe o que o novo bloco de paridade tem de conter até ler o bloco antigo e os dados antigos.
Cada escrita será 2 leituras e 2 escritas.


Finally, RAID 5 is vulnerable to corruption in certain circumstances. Its incre-
mental updating of parity data is more efficient than reading the entire stripe and
recalculating the stripe’s parity based on the original data. On the other hand, it
means that at no point is parity data ever validated or recalculated. If any block in
a stripe should fall out of sync with the parity block, that fact will never become
evident in normal use; reads of the data blocks will still return the correct data.

The virtual file /proc/mdstat always contains a summary of md’s status and the
status of all the system’s RAID arrays. It is especially useful to keep an eye on the
/proc/mdstat file after adding a new disk or replacing a faulty drive. (watch cat
/proc/mdstat is a handy idiom.)

###  mdadm --detail --scan
Dumps the current RAID setup into a configuration file.

### Criar um raid 5 com 3 dispositivos:
	
	sudo mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
	mdadm: array /dev/md0 started.

### Permitir o raid na inicialização:
	
	$ sudo mdadm -As /dev/md0

### Parar o raid:
	
	$ sudo mdadm -S /dev/md0

### Marcar um disco como failed:

	$ sudo mdadm /dev/md0 -f /dev/sdc1
	mdadm: set /dev/sdc1 faulty in /dev/md0

### Remover o drive da configuração do raid:

	$ sudo mdadm /dev/md0 -r /dev/sdc1

### Adicionar o drive ao array sem substituir o hardware:

	$ sudo mdadm /dev/md0 -a /dev/sdc1
