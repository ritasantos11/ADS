## Elementos do controlo de acesso
Sujeito - entidade que pode aceder a objetos: <br>
• Um processo. <br>
• Em geral mapeado em 3 classes: dono, grupo e todos. <br>

Objeto - recurso a que se controla o acesso: <br>
• Ex: ficheiros, diretórios, registos, programas. <br>
• Número/tipo depende do ambiente. <br>

Direito de acesso - modo como o sujeito acede ao objeto: <br>
•Ex: ler, escrever, executar, apagar, criar, procurar.
<br>
<br>
O dono do processo pode mandar sinais e alterar a prioridade.

## *root*
UID 0.
<br>
Exemplos de operações restritas ao UID 0: <br>
• *chroot*: mudar o diretório raiz de um processo. <br>
• Criar ficheiros de dispositivos. <br>
• Acertar o relógio. <br>
• Prioridades de processos (*nice* e *renice*). <br>
• Mudar limites de utilização de recursos. <br>
• Nome do Sistema (hostname). <br>
• Configurar interfaces de redes. <br>
• Abrir portas privilegiadas (abaixo de 1024).

## *setuid* e *setgid*
Ferramenta de segurança que permite aos users executar determinados programas com privelégios.
<br>
Quando o kernel executa um file executável com os seus bits de permissão *setuid* ou *setgid* configurados, ele altera o UID ou GID efetivo do processo resultante para o UID ou GID do file que contém a imagem do programa em vez do UID ou GID do user que executou o comando. Os privilégios do user são promovidos apenas para a execução desse comando específico.
<br>
*setuid*: usado em files executáveis. O user corre o programa como se fosse o dono dele.
<br>
*setgid*: usado em diretórios e files. Quando definido num dir, o bit setgid faz com que os files desse dir assumam o grupo do dir, em vez do grupo default dos users que criaram os files.
<br>
Os users devem poder alterar as suas passwords. Mas como as passwords são guardadas no file /etc/shadow, os users precisam de um comando *setuid* *passwd* para aceder.
<br>
O comando *passwd* verifica quem está a executar e personaliza o seu comportamento: <br>
• os users só podem alterar apenas as suas passwords. <br>
• o *root* pode alterar qualquer senha. <br>

## Problemas com sistemas de controlo de acesso
• *root*: se é comprometido, a integridade de todo o sistema é violada.
<br>
• Sub-divisão de privilégios com programas *setuid*: dificuldade de os tornar seguros.
<br>
• Controlo de acesso embebido nos programas.
<br>
• Utilizadores com acesso físico à máquina tornam-na insegura na rede onde está.
<br>
• Multi-Level-Security (MLS) não é possível sem extras.
<br>
• Pouco suporte para auditoria.

## Extensões para controlo de acesso
#### RBAC (Role-Based Access Control)
Adiciona uma camada de indireção para cálculos de acesso de controlo.
<br>
Em vez de as permissões serem atribuídas diretamente aos users, são atribuídas a construtores intermediários (roles) e esses roles são atribuídos a users à vez.
<br>
Para se fazer uma decisão de controlo de acesso, a libraria de acesso de controlo enumera os roles do user currente e verifica se algum desses roles têm as permissões adequadas.

### SELinux (Security-Enhanced Linux)
Projeto da NSA, disponível e integrado no kernel.
<br>
Disponibiliza o MAC (Mandatory Access Control), um sistema de controlo de acesso onde todas as permissões são atribuídas por administradores.
<br>
Não há delegação de privilégios. No MAC, users não podem delegar o seu acesso ou atribuir parâmetros de controlo de acesso aos objetos a que lhe pertencem.

### Access Control Lists (ACLs)
Generelização do modelo de permissões user/group/other tradicional que acomoda permissões para múltiplos users e groups de uma vez.
<br>
É necessário associar users a files.
<br>
Cada file ou dir pode ter associado um ACL que lista as regras de permissões a ser aplicadas a eles. Cada regra é uma entrada no ACL (ACE).
<br>
Cada ACE identifica o user ou group a aplicar a regra e especifica o conjunto de permissões a serem dadas.

## Vantagens do *sudo*
• Registo dos comandos efetuados e por quem. <br>
• Operadores podem executar sem ter privilégios de *root*. <br>
• Mais rápido do que *su* (password). <br>
• Revogação de privilégios sem mudar password de *root*. <br>
• Único ficheiro para controlar o acesso de toda a rede. <br>

## Desvantagens do *sudo*
• Conta de utilizador passa a ser ponto de falha. <br>
• *sudo su*.
