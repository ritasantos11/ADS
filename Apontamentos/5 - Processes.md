## Componentes de um processo
• Espaço de endereçamento.
<br />
• Estado (sleeping, stopped, runnable, etc.).
<br />
• Prioridade de execução.
<br />
• Informação sobre os recursos utilizados.
<br />
• Informação sobre ficheiros e portas de rede abertos.
<br />
• Máscara de sinais (registo dos sinais bloqueados).
<br />
• Dono do processo.

## Processo
Consiste num espaço de endereçamento e um conjunto de estrutura de dados dentro do kernel.
<br />
O espaço de endereçamento é um conjunto de páginas de memória que o kernel deu para o processo usar. Contém o código e as librarias que o processo está a executar, as variáveis, as pilhas e outras infos que o kernel precisa enquando o processo está a correr.
<br />
O kernel atribui um ID uníco a cada processo: PID.
<br />
Cada processo tem um parent pid (PPID) que corresponde ao pid do processo que o criou.
<br />
UID e EUID: real and effective user ID:
<br />
• ID do utilizador que criou o processo (cópia do UID do pai).
<br />
• EUID pode ser diferente do UID. Ex: setuid.
<br />
GID e EGID: real and effective group ID.

## UID and EUID: real and effective user ID
UID do processo é nº de identificação do user que o criou, aka a cópia do UID do processo pai.
<br />
Só o dono e o superuser podem manipular processos,
<br />
EUID é o UID efetivo do user, um UID extra para determinar que recursos e files um processo tem permissões para aceder num dado momento.
<br />
Para muitos processos, o UID e o EUID são o mesmo. Só diferem nos programas com setuid.
<br />
Existem UID e EUID para diferenciar identificação com permissões e porque um programa com setuid pode não querer operar com todas as permissões sempre.

## GID and EGID: real and effective group ID
GID é o nº de identificação do grupo do processo.
<br />
EGID relaciona-se com o GID como o EUID se relaciona com o UID.
<br />
Um processo pode ser membro de vários grupos ao mesmo tempo. A lista de grupos completa é guardada em separado do GID e do EGID.
<br />
Para determinsar as permissões de acesso tem se em atenção o EGID e a lista de grupos e não o GID.
<br />
O GID entra em ação quando um processo cria novos files. Dependendo como as permissões do filesystem estão configuradas, novos files podem herdar o GID do processo que os criou.

## Niceness
A prioridade de agendamento de um processo determina quanto tempo de CPU ele recebe.
<br />
Só o root pode aumentar a prioridade de um processo.
<br />
Outro user que não o root pode aumentar o valor nice dos seus processos para torná-los menos prioritários.
<br />
O kernel usa um algoritmo dinâmico para calcular prioridades.
<br />
O kernel presta atenção a um valor definido administrativamente, chamado de nice value ou niceness.
<br />
-20 a +19
<br />
Nº grande: prioridade baixa.
<br />
Nº pequeno ou negativo: prioridade alta.
<br />
Serve para o kernel escalonar os processos.
<br />
Processo herda valor do pai.
<br />
Pode ser aumentado pelo utilizador, mas não diminuído.
<br />
O valor nice não tem nenhum efeito na gestão da memória feita pelo kernel ou no I/O.
<br />
Comando *nice* para atribuir o valor nice na criação do processo. Comando *renice* para alterar mais tarde.

	$ nice -n 5 ~/bin/longtask
	$ sudo renice -5 8829
	$ sudo renice 5 -u boggs

## Terminal de controlo
Determina ligações default para os canais de *STDIN*, *STDOUT* e *STDERR*.
<br />
Quando se corre um programa na shell, a janela do terminal passa a ser no terminal de controlo do processo.

## Sinais
Meio de comunicação entre processos.
<br />
Terminar, interromper ou suspender um processo pelo terminal.
<br />
Enviados pelo kernel a processos que cometem infrações (ex: divisão por zero).
<br />
Avisos do kernel ao processo (morte de um filho, disponibilidade de um canal de I/O).
<br />
*kill* consegue enviar qualquer sinal, por default envia o sinal TERM.
<br />
*kill* sem sinal não significa que o processo morra, porque o sinal TERM pode ser apanhado, bloqueado ou ignorado.	
	
	kill [-signal] pid

Garante que o processo morre, porque o sinal 9 não pode ser apanhado:

	kill -9 pid
	
Se um processo estiver à espera de algum recurso mesmo com o sinal KILL, o processo não morre. Também processos zombies não morrem. É necessário fazer reboot para libertar o sistema destes processos.
<br />
O comando *killall* em linux mata processos por nome. Noutros sistemas mata todos os processos correntes do user, fazendo-o como root mata o *init* e a máquina desliga-se.
<br />
Os processos que não tiverem um handler definido (para apanhar o sinal), o kernel trata deles com um tratamento default que varia de sinal para sinal.

### Estados dos processos
Runnable: o processo pode ser executado.
<br />
Sleeping: o processo está a espera de algum recurso.
<br />
Zombie: o processo está a tentar morrer.
<br />
Stopped: o processo está suspenso, não pode executar.

## *ps*
Informações sobre os processos correntes do sistema.

	ps aux # BSD style options
	ou
	ps –ef # standard options

## *top*
Mostra dados semelhantes ao *ps*, mas continuamente.

## */proc*
Pseudo sistema de ficheiros.
<br />
Contém vários dados sobre o sistema.
<br />
Dados sobre os processos em */proc/PID/*.

## *strace*
Dá informação sobre as chamadas de sistema (system call) do processo.

## *uptime*
Dá utilização do sistema em processos.
<br />
Em intervalos de 1, 5 e 15 min.
