## Processo
O kernel atribui um ID uníco a cada processo.
Cada processo tem um parent pid que corresponde ao pid do processo que o criou.

P.122


## Niceness
A prioridade de agendamento de um processo determina quanto tempo de CPU ele recebe.
O kernel usa um algoritmo para calcular prioridades.
O kernel presta atenção a um valor definido administrativamente, chamado de nice value ou niceness.


## Sinais
kill consegue enviar qualquer sinal, por default envia o sinal TERM.

kill [-signal] pid
	kill sem sinal nao significa que o processo morra, pq o sinal TERM pode ser apanhado, bloqueado ou ignorado

kill -9 pid
	Garante que o processo morre. O sinal 9 não pode ser apanhado.

O comando killall em Linuxx mata processos por nome. Noutros sistemas, mata todos os processos correntes do user, fazendo-o como root mata o init e a máquina desliga-se.


P.128
