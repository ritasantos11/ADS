## Filesystem mounting and unmounting
*mount* mapeia um diretório dentro da árvode de ficheiros existente, chamado ponto de montagem (mount point), para a raiz do sistema de ficheiros recém criado.
<br>
O conteúdo anterior do mount point fica inacessível enquantou ou sistema estiver lá montado.
<br>
Os mount points são geralmente diretórios vazios.
<br>
Montar o dispositivo sda1 no diretório /boot:

	$ sudo mount /dev/sda1 /boot

Desmontar (estando todos os files fechados e nenhum processo a correr):

	$ umount /boot

O mount point de um filesystem pode ser qualquer dir, mas os files e subdirs dentro não são acessíveis se o filesystem estiver montado.

### *df*
Info sobre os filesystems.

### file */etc/fstab*
Lista de filesystems a serem montados no boot.

### *fsck*
Check and repair filesystem.

### *fuser*
Serve para ver quais os processos que mantêm referências para um dado filesystem.

### *lsof*
Lista de open files.

### Dir *lost+found*
Contém files cujo diretório pai não pode ser determinado, colocados lá pelo fsck.

## File types
• Ficheiro normal (-): ficheiros de texto, de dados, executáveis e librarias partilhadas.
<br>
• Diretórios (d).
<br>
• Ficheiro dispositivo de caracteres (c).
<br>
• Ficheiro dispositivo de blocos (b).
<br>
• Socket do domínio local (s).
<br>
• Pipe com nome (p).
<br>
• Link simbólico (l).

### Inodes
Estrutura de dados que guarda info básica sobre um file normal, um dir ou outro objeto do filesystem.

### Link Simbólico
Link para o file original.
<br>
Se se apagar o file original, o soft link não serve para nada.
<br>
Dá para ligar files através de diretórios.
<br>
Tem inodes e permissões diferentes que o file original.
<br>
As permissões não são atualizadas.
<br>
Contém apenas o caminho para o file original, não o seu conteúdo.
<br>
Quando o kernel, enquanto procura por um pathname, encontra um link simbólico, redireciona a sua atenção para o pathname guardado como conteúdo do link.
<br>
Criação: *ln -s*

### Hard link
Cópia do file original. Guarda o conteúdo do file original.
<br>
Se se apagar ou se mover o file original, o hard link continua com o conteúdo desse file original.
<br>
Não consgue ligar diretórios.
<br>
Tem o mesmo inode e permissões que o file original.
<br>
Se se alterar o conteúdo ou do file original ou do hard link as modificações são vistas em ambos.

## File attributes
Cada file possui um conjunto de 9 bits de permissão que controlam quem pode ler, escrever e executar o conteúdo do file. Juntamente com outros 3 bits que afetam principalmente a operação de programas executáveis, esses bits constituem o "modo" do file (file's mode).
<br>
Os 12 mode bits são guardados juntos com 4 bits de informação do tipo de file.
<br>
Os 4 bits do tipo de file são definidos quando o file é criado pela 1ºvez e não podem ser alterados, mas o owner do file ou o superuser podem modifcar os 12 mode bits com o comando *chmod*.

### The permission bits
9 permission bits determinam quais operações podem ser executadas num file e por quem.
<br>
3 conjuntos de permissões definem o acesso ao owner do file, aos group owners e a todos os outros.

### The setuid and setgid bits
Os bits com valores octais 4000 e 2000 são dos bits setuid e setgid.
<br>
Quando definidos em files executáveis, esses bits permitem que os programas acedam a files e processos que, de outra forma, estariam fora dos limites para o user que os executa.

### The sticky bit
Bit com o valor octal 1000.
<br>
Se o sticky bit estiver definido num dir, o filesystem não permitirá que qualquer pessoa apague ou renomeie os files a não ser que seja o owner do dir, o owner do file ou o superuser. Ter permissão de escrita não é suficente.
<br>
O dir /tmp contém files temporários criados por vários users. Para que não seja possível qualquer user apagar/renomear files temporários doutros users, o dir /tmp tem o sticky bit ativo.

### *chmod*: change permissions
O comando *chmod* altera as permissões dum file.
<br>
Só o owner do file ou o superuser pode alterar as permissões.
<br>
Com a opção *-R*, *chmod* faz update recursivamente às permissões dentro do dir.
<br>
Retira as permissões de execução de todos os users, incluindo o dono:

	chmod a-x

### *chown* and *chgrp*: change ownership and group
Só pode mudar o grupo do file o owner do file e pertencer ao grupo que se está a mudar ou o superuser.
<br>
Também tem a flag *-R*.

### *umask*: assign default permissions
Influencia as permissões default dadas ao file que se criou.
<br>
Cada processo tem um atributo unmask próprio.
