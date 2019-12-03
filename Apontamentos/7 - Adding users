## /etc/passwd
O ficheiro /etc/passwd é a lista de users.
O sistema consulta o ficheiro na altura do login para determinar o UID do user e o diretório home, entre outras coisas.
O file contém um x no campo da password encriptada no Linux, Solaris e HP-UX e um ! oou * no AIX.
As passwords encriptadas são guardadas no ficheiro /etc/shadow.
Por definição, o root tem UID 0. Muitos sistemas também definem pseudo users
como bin e daemon para serem donos  de comandos e de ficheiros de configurações.
GID (id do grupo) 0 é reservado para o grupo chamado root ou system.
O ficheiro /etc/group define os grupos, com o campo GID do /etc/passwd fornecendo um GID default no momento de login.

## /etc/shadow
Só o superuser consegue ler este ficheiro, porque este contém as passwords encriptadas.
Também guarda info adicional sobre as contas que não foram guardadas no /etc/passwd.
O name do login é o mesmo que está no /etc/passwd.

## /etc/group
Este file cont+em os nomes dos grupos e a lista dos sues membros.
O comando useradd por default coloca os users nos seus grupos pessoais.

## /etc/skel
Guarda os files de startup.

# LDAP
É um repositório generalizado, semelhante a um banco de dados, que pode armazenar dados de gerenciamento de users e outros
tipos de dados.
Usa um modelo hierárquico de cliente/servidor que suporta vários servidores e vários clientes simultâneamente.
Uma das grandes vantagens do LDAP como repositório em todo o site para dados de login é que ele pode impor UIDs e GIDs únicos
em todos os sistemas.
