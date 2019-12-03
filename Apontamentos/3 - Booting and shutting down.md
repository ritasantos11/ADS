# BOOTSTRAPPING
Bootstrapping is the standard term for “starting up a computer.”
Durante o bootstrapping, o kernel é carregado para a memória e começa a executar. Muitas tarefas de inicializações são desempenhadas e o sistema torna-se válido para os users.
Quando um computador é ligado, executa em primeiro lugar código de boot que está guardado em ROM. Esse código tenta entender como carregar e começar o kernel. O kernel investiga o hardware do sistema e cria o processo init, que é sempre o número 1.
Antes que o sistema esteja completamente inicializado, os sistemas de ficheiros têm de ser verificados e montados e os daemons do sistema inicializados. Esses procedimentos são gerenciados por uma série de scripts de shell que são executados em sequência pelo init.

Sistemas UNIX conseguem inicializar apenas o suficiente paa executar uma shell na consola do sistema. Essa opção é conhecida por Booting to single-User mode. Acede-se passando um argumento ao kernel no  momento da inicialização.

## Típico processo de bootstrapping:
	Ler do boot loader a partir do master boot de inicialização.
	Carregamento e inicialização do kernel
	Deteção e configuração de dispositivos
	Criação de processos do kernel
	Interveção do administrador (só single-user mode)
	Execução de scripts de inicialização do sistema


# GRUB
Default boot loader para alguns sistemas.

P.83