## Componentes de um processo
• Espaço de endereçamento
<br />
• Estado (sleeping, stopped, runnable, etc.)
<br />
• Prioridade de execução
<br />
• Informação sobre os recursos utilizados
<br />
• Informação sobre ficheiros e portas de rede abertos
<br />
• Máscara de sinais (registo dos sinais bloqueados)
<br />
• Dono do processo

## Processo
A process consists of an address space and a set of data structures within the kernel.
<br />
The address space is a set of memory pages that the kernel has marked for the process’s use.
<br />
It contains the code and libraries that the process is executing, the process’s variables, its stacks, and various extra information needed by the kernel while the process is running.
<br />
O kernel atribui um ID uníco a cada processo.
<br />
Cada processo tem um parent pid que corresponde ao pid do processo que o criou.

P.122


## Niceness
A prioridade de agendamento de um processo determina quanto tempo de CPU ele recebe.
<br />
O kernel usa um algoritmo para calcular prioridades.
<br />
O kernel presta atenção a um valor definido administrativamente, chamado de nice value ou niceness.


## Sinais
kill consegue enviar qualquer sinal, por default envia o sinal TERM.
<br />
	
	kill [-signal] pid
	
	kill sem sinal nao significa que o processo morra, pq o sinal TERM pode ser apanhado, bloqueado ou ignorado

<br />
Garante que o processo morre. O sinal 9 não pode ser apanhado.

	kill -9 pid
	
O comando killall em Linuxx mata processos por nome. Noutros sistemas, mata todos os processos correntes do user, fazendo-o como root mata o init e a máquina desliga-se.


P.128

