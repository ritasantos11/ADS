## RAID 0
Usa 2 ou mais discos rígidos paera maximizar o desempenho ao armazenar e acessar info (Stripping array).
É o mais rápido mas o menos seguro.
Distribui os dados a serem armazenados, gravando a info particionada em vários discos simultâneamente.
A escrita e leitura dos dados usa todos os discos.
Não tem tolerância a falhas. Caso 1 disco tenha problemas, todos os dados do sistema estão comprometidos.

## RAID 1
Só usa 2 discos.
A escrita é feita simultâneamente nos discos. Faz cópia dos dados em tempo real, sem intervenção do user.
Redução de capacidade bruta.
Ao montar usando discos de capacidades diferentes, o sistema utilizará a capacidade do menor para dimensionar o tamanho máximo da matriz.
É seguro. Mesmo que um disco falhe, as infos estarão seguras e online noutro disco, possibilitando que o disco que tenha falhado seja substituido ou o backup dos dados realizado sem que nada seja perdido.

## RAID 5
Muito utilizado por servers com pelo menos 3 discos. Cria uma camada de redundância, sacrificando parte da capacidade do sistema para segurança dos dados.
São criados bits de paridade e acrescentados aos dados, escritos de forma alternada em todos os discos.
Caso 1 disco falhe, nada é perdido.
A paridade é a segurança do sistema que possibilita a reconstrução dos dados sem perda de informação.

## RAID 6
Dupla paridade, ou seja, podem falhar até 2 discos sem perda de dados, no entanto será utilizado o dobro do espaço para gravar a paridade e manter a redundância do sistema.
Num sistema RAID 6 com oito discos, a capacidade total disponível será a multiplicação do valor de seis hard disks, sendo que os outros dois servirão para redundância.
A medida que aumentarmos a número de discos nesse arranjo, também minimizaremos o espaço proporcional sacrificado. Esse tipo de sistema pode ser implementado a partir quatro discos e é usado em situações que demandam maior segurança para as informações armazenadas.

## RAID 10
Pelo menos 4 discos, onde são criadas combinações de 2 ou mais grupos RAID 1 para escrita simultânea (RAID 0).
Une desempenho e segurança num único sítio.
Além de oferecer um desempenho superior no momento de transferência dos dados, ela não compromete a integridade das informações caso ocorra algum problema num dos discos.
O maior inconveniente para usuários que fazem uso dos arranjos RAID 10 é o grande número de discos rígidos utilizados para segurança dos dados em relação aos demais, tornando-se economicamente inviável para algumas aplicações.

