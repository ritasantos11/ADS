## */etc/passwd*
O ficheiro */etc/passwd* contém uma lista dos users do sistema.
<br />
O sistema consulta o ficheiro na altura do login para determinar o UID do user e o diretório home, entre outras coisas.
<br />
O file contém um x no campo da password encriptada no Linux, Solaris e HP-UX e um ! ou * no AIX.
<br />
As passwords encriptadas são guardadas no ficheiro */etc/shadow*.
<br />
Se as contas dos users forem partilhadas através do LDAP, o file passwd pode conter entradas que começam por + ou -. Servem para dizer ao sistema como integrar os dados desse serviço (LDAP) com o conteúdo do */etc/passwd*.
<br />
Por definição, o root tem UID 0.
<br />
Muitos sistemas também definem pseudo users como bin e daemon para serem donos  de comandos e de ficheiros de configurações.
<br />
GID (id do grupo) 0 é reservado para o grupo chamado root ou system.
<br />
O ficheiro */etc/group* define os grupos, com o campo GID do */etc/passwd* fornecendo um GID default no momento de login.

## */etc/shadow*
Só o superuser consegue ler este ficheiro, porque este contém as passwords encriptadas. Assim nem outro user nem programas de cracar passwords conseguem descobrir as passwords.
<br />
Também guarda info adicional sobre as contas que não foram guardadas no */etc/passwd*.
<br />
O name do login é o mesmo que está no */etc/passwd*.

## */etc/group*
Este file contém os nomes dos grupos e a lista dos sues membros.
<br />
O comando useradd por default coloca os users nos seus grupos pessoais.
<br />
Os grupos podem ter passwords (comando *gpasswd*).

## */etc/skel*
Guarda os files de startup.
