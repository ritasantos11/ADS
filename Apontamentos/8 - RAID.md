## RAID (Redundant Arrays of Inexpensive Disks)
Uma matriz RAID combina vários dispositivos de armazenamento num dispositivo virtualizado.
<br>
O sistema avisa quando há falha de 1 disco.
<br>
RAID pode: <br>
• melhorar o desempenho distribuindo ("striping") dados em vários drivers, permitindo que vários drivers trabalhem simultaneamente para fornecer ou absorver um único fluxo de dados. <br>
• replicar dados em vários drivers, diminuindo o risco associado a um único disco com falha.<br>

Replicação assume 2 formas: <br>
• mirroring, onde os blocos de dados são reproduzidos bit a bit em vários drivers diferentes. <br><br>
•esquemas de paridade, onde uma ou mais drivers contêm um checksum de correção de erros dos blocos nos drivers de dados restantes. São mais eficientes no espaço em disco mas têm desempenho inferior.

#### JBOD
Discos vistos como um único, sendo escritos sequencialmente.

#### RAID 0
Usa 2 ou mais discos rígidos de igual tamanho para maximizar o desempenho ao armazenar e acessar info (stripping array).
<br>
É o mais rápido mas o menos seguro.
<br>
Distribui os dados a serem armazenados, gravando a info dividida em vários discos simultâneamente.
<br>
Distribui os dados alternadamente entre os discos na pool.
<br>
A escrita e leitura dos dados usa todos os discos.
<br>
Não tem tolerância a falhas. Caso 1 disco tenha problemas, todos os dados do sistema estão comprometidos.
<br>
Usado estritamente para aumentar o desempenho.
<br>
Divide os dados entre 2 ou mais discos.
<br>
As leituras e as escritas sequênciais são distribuídas entre vários discos, diminuindo os tempos de escrita e acesso.

#### RAID 1
A escrita é duplicada simultâneamente em 2 ou mais discos.
<br>
Faz cópia dos dados em tempo real, sem intervenção do user.
<br>
Redução de capacidade bruta.
<br>
Ao montar usando discos de capacidades diferentes, o sistema utilizará a capacidade do menor para dimensionar o tamanho máximo da matriz.
<br>
É seguro. Mesmo que um disco falhe, as infos estarão seguras e online noutro disco, possibilitando que o disco que tenha falhado seja substituido.
<br>
As escritas são mais lentas do que o que seria se fosse num único disco.
<br>
Oferece velocidade de leitura comparável ao RAID 0, porque as leituras podem ser realizadas entre as várias unidades de disco duplicados.
<br>
A matriz continua a funcionar enquanto, pelo menos, 1 disco estiver a funcionar.

#### RAID 5
Muito utilizado por servers com pelo menos 3 discos.
<br>
Cria uma camada de redundância, sacrificando parte da capacidade do sistema para segurança dos dados.
<br>
São criados bits de paridade e acrescentados aos dados, escritos de forma alternada em todos os discos.
<br>
Caso 1 disco falhe nada é perdido.
<br>
A paridade é a segurança do sistema que possibilita a reconstrução dos dados sem perda de informação.
<br>
Distribui dados e info de paridade, adicionando redundância e melhorando simultânemante o desempenho de leitura.
<br>
Um arranjo de paridade para ajudar a reconstruir os dados em caso de falhas no disco.
<br>
Mais eficiente no uso de espaço em disco do que o RAID 1.
Se houver N discos numa matriz (são necessários pelo menos 3), N-1 delas podem armazenar dados.

#### RAID 6
Pelo menos 4 discos.
<br>
Dupla paridade, ou seja, podem falhar até 2 discos sem perda de dados, no entanto será utilizado o dobro do espaço para gravar a paridade e manter a redundância do sistema.
<br>
Num sistema RAID 6 com 8 discos, a capacidade total disponível será a multiplicação do valor de 6 discos duros (HD), sendo que os outros 2 servirão para redundância.
<br>
À medida que aumentarmos o número de discos neste arranjo, também minimizaremos o espaço proporcional sacrificado. Esse tipo de sistema pode ser implementado a partir de 4 discos e é usado em situações que demandam maior segurança para as informações armazenadas.
<br><br>
RAID 5 e RAID 1 de 2 discos podem tolerar apenas a falha de um único dispositivo. Depois de ocorrer uma falha, a matriz fica vulnerável a uma segunda falha.

#### RAID 10
Pelo menos 4 discos, onde são criadas combinações de 2 ou mais grupos RAID 1 para escrita simultânea (RAID 0).
<br>
Une desempenho e segurança num único sítio.
<br>
Além de oferecer um desempenho superior no momento de transferência dos dados, ela não compromete a integridade das informações caso ocorra algum problema num dos discos.
<br>
O maior inconveniente para users que fazem uso dos arranjos RAID 10 é o grande número de discos rígidos utilizados para segurança dos dados em relação aos demais, tornando-se economicamente inviável para algumas aplicações.

### Disk failure recovery
Substitui-se o disco com falha por outro de tamanho semelhante ou maior e depois diz-se à implementação do RAID para substituir o antigo disco pelo novo. A seguir, segue-se um longo periodo durante o qual as infos de paridade ou de mirror são reescritas no novo disco.

### Desvantagens do RAID 5
• O RAID 5 não substitui os backups offline regulares.
<br>
• Protege o sistema contra a falha de um disco.
<br>
• Não protege contra a remoção acidental de files.
<br>
• Não protege contra controler failures, icêndios, hackers, etc.
<br>
• Grava blocos de dados em discos N-1 e blocos de paridade no Nth disco. Sempre que um bloco aleatório é gravado, pelo menos um bloco de dados e o bloco de paridade para essa faixa (stripe) devem ser atualizados.
<br>
• Não sabe o que o novo bloco de paridade tem de conter até ler o bloco antigo e os dados antigos.
<br>
• Cada escrita será 2 leituras e 2 escritas.
<br>
• Vulnerável à corrupção.
<br>
• A atualização incremental dos dados de paridade é mais eficiente do que ler a faixa (stripe) inteira e recalcular a paridade da faixa com base nos dados originais.
<br>
• Em nenhum momento os dados de paridade são validados ou recalculados. Se algum bloco de uma faixa cair fora de sincronia com o bloco de paridade, esse fato nunca se tornará evidente no uso normal. As leituras dos blocos de dados ainda retornarão os dados corretos.

#### file */proc/mdstat*
Contém o sumário do estado dos md's (software do raid) e o estado de todas as matrizes RAID do sistema.

#### *mdadm --detail --scan*
Mostra a configuração raid atual.

#### Criar um raid 5 com 3 dispositivos:
	
	$ sudo mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
	mdadm: array /dev/md0 started.

#### Permitir o raid na inicialização:
	
	$ sudo mdadm -As /dev/md0

#### Parar o raid:
	
	$ sudo mdadm -S /dev/md0

#### Marcar um disco como failed:

	$ sudo mdadm /dev/md0 -f /dev/sdc1
	mdadm: set /dev/sdc1 faulty in /dev/md0

#### Remover o drive da configuração do raid:

	$ sudo mdadm /dev/md0 -r /dev/sdc1

#### Adicionar o drive ao array sem substituir o hardware:

	$ sudo mdadm /dev/md0 -a /dev/sdc1
