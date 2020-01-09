## Filesystem mounting and unmounting
mount mapeia um diretório dentro da árvode de ficheiros existente, chamado ponto de montagem (mount point), para a raiz do sistema de ficheiros recém criado.
<br />
O conteúdo anterior do mount point fica anecessível enquantou ou sistema estiver lá montado.
<br />
Os mount points são geralmente diretórios vazios.
<br />
Montar o dispositivo sda1 no diretório /boot:

	$ sudo mount /dev/sda1 /boot

Desmontar (estando todos os files fechados e nenhum processo a correr):

	$ umount /boot

O mount point de um filesystem pode ser qualquer dir,  mas os files e subdirs dentro não são acessíveis se o filesystem estiver montado.

### Comando df
Info sobre os filesystems.

### file /etc/fstab
Lista de filesystems a serem montados no boot.

### Comando fsck
Check and repair filesystem.

### Comando fuser
Serve para ver quais os processos que mantêm referências para um dado filesystem.

### Comando lsof
Lista de open files.

### Dir lost+found
Contém files cujo diretório pai não pode ser determinado, colocados lá pelo fsck.


## File types
• Ficheiro normal (-): ficheiros de texto, de dados, executáveis e librarias partilhadas
<br />
• Diretórios (d)
<br />
• Ficheiro dispositivo de caracteres (c)
<br />
• Ficheiro dispositivo de blocos (b)
<br />
• Socket do domínio local (s)
<br />
• Pipe com nome (p)
<br />
• Link simbólico (l)

### Link Simbólico
Aponta para um file por nome.
<br />
Quando o kernel, enquanto procura por um pathname, encontra um link simbólico, redireciona a sua atenção para o pathname guardado como conteúdo do link.
<br />
Hard link: referência direta.
<br />
Symbolic link: referência por nome. Podem conter caminhos arbitrários e podem-se referir a files noutros filesystems ou até files que nao existem.
<br />
Criação: ln -s


## File attributes
Cada file possui um conjunto de 9 bits de permissão que controlam quem pode ler, escrever e executar o conteúdo do file. Juntamente com outros 3 bits que afetam principalmente a operação de programas executáveis, esses bits constituem o "modo" do file (file's mode).
<br />
Os 12 mode bits são guardados juntos com 4 bits de informação do tipo de file.
<br />
Os 4 bits do tipo de file são definidos quando o file é criado pela 1ºvez e não podem ser alterados, mas o owner do file ou o superuser podem modifcar os 12 mode bits com o comando chmod.

### The permission bits
9 permission bits determinam quais operações podem sewr executadas num file e por quem.
<br />
3 conjuntos de permissões definem o acesso ao owner do file, aos group owners e a todos os outros.

### The setuid and setgid bits
Corre o programa comos e fosse o dono dele.
<br />
Os bits com valores octais 4000 e 2000 são dos bits setuid e setgid.
<br />
Quando definidos em files executáveis, esses bits permitem que os programas acedam a files e processos que, de outra forma, estariam fora dos limites para o user que os executa.
<br />
Quando definido num dir, o bit setgid faz com que os files recém criados no dir assumam a propriedade do grupo do dir, em vez do grupo default do user que criou o file.

### The sticky bit
Bit com o valor octal 1000.
<br />
Se o sticky bit estiver definido num dir, o filesystem não permitirá que qualquer pessoa apague ou renomeie o file a não ser que seja o owner do dir, o owner do file ou o superuser. Ter permissão de escrita não é suficente.

### chmod: change permissions
O comando chmod altera as permissões dum file.
<br />
Só o owner do file ou o superuser pode alterar as permissões.
<br />
Com a opção -R, chmod faz update recursivamente às permissões dentro do dir.
<br />
Retira as permissões de execução de todos os users, incluindo o dono:

	chmod a-x

### chown and chgrp: change ownership and group
Só pode mudar o grupo do file o owner do file e pertencer ao grupo que se está a mudar ou o superuser.
<br />
Também tem a flag -R.

### umask: assign default permissions
Influencia as permissões default dadas ao file que se criou.
<br />
Cada processo tem um atributo unmask próprio.
