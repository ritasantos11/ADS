# FILESYSTEM MOUNTING AND UNMOUNTING
mount mapeia um diretório dentro da árvode de ficheiros existente, chamado ponto de montagem (mount point), para a raiz do sistema de ficheiros recém criado.
O conteúdo anterior do mount point fica anecessível enquantou ou sistema estiver lá montado.
Os mount points são geralmente diretórios vazios.

	sudo mount /dev/sda4 /users
		instala o sistema de ficheiros gauradado na partição de disco /dev/sda4 de baixo de /users

### fuser command
find out which processes hold references to that filesystem.

# FILE ATTRIBUTES
Cada file possui um conjunto de 9 bits de permissão que controlam quem pode ler, escrever e executar o conteúdo do file. Juntamente com outros 3 bits que afetam principalmente a operação de programas executáveis, esses bits constituem o "modo" do file (file's mode).
Os 12 mode bits são guardados juntos com 4 bits de informação do tipo de file.
Os 4 bits do tipo de file são definidos quando o file é criado pela 1ºvez e não podem ser alterados, mas o owner do file ou o superuser podem modifcar os 12 mode bits com o comando chmod.


## The permission bits
9 permission bits determinam quais operações podem sewr executadas num file e por quem.
3 conjuntos de permissões definem o acesso ao owner do file, aos group owners e a todos os outros.
Num regular file, o bit de leitura permite que o file seja aberto e lido. O bit de escrita permite que o contúdo seja modificado, no entando a capacidade de apagar ou renomear o file é controlado pelas permissões do seu diretório pai, porque é aí que o mapeamento do nome para o espaço de dados é realmente armazenado. O bit de execução permite que o file seja executado. Existem 2 tipos de files executáveis:
	-binários, em que o CPU executa diretamente;
	-scripts, que devem ser interpretados por um shell ou outro programa.
Para um diretório, o bit de execução permite a abertura ou a passagem pelo diretório enquanto o pathname estiver a ser avaliado, mas não eprmite que o seu contúdo seja listado. A combinação de bits de leitura e execução permitem que o contúdo do dir seja listado. A combinação de bits de escrita e execução permite que sejam criados, apagados e renomeados files dentro desse dir.


## The setuid and setgid bits
Os bits com valores octais 4000 e 2000 são so bits setuid e setgid.
Quando definidos em files executáveis, esses bits permitem que os programas acedam a files e processos que, de outra forma, estariam fora dos limites para o user que os executa.
Quando definido num dir, o bit setgid faz com que os files recém criados no dir assumam a propriedade do grupo do dir, em vez do grupo default do user que criou o file.


## The sticky bit
O bit com o valor octal 1000 é o sticky bit.
Se o sticky bit estiver definido num dir, o filesystem não permitirá que qualquer pessoa apague ou renomeie o file a não ser que seja o owner do dir, o owner dofile ou o superuser. Ter permissão de eescrita não é suficente.


## chmod: change permissions
O comando chmod altera as permissões dum file.
Só o owner do file ou o superuser pode alterar as permissões.
Com a opção -R, chmod faz update recursivamente às permissões dentro do dir.


## chown and chgrp: change ownership and group
Só pode mudar o grupo do file o owner do file e pertencer ao grupo que se está a mudar ou o superuser.
Também tem a flag -R.


## umask: assign default permissions
Influencia as permissões default dadas ao file que se criou.
Cada processo tem um atributo unmask próprio.

P.158