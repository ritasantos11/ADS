## Bootstraping
Bootstrapping is the standard term for “starting up a computer.”
<br />
Durante o bootstrapping, o kernel é carregado para a memória e começa a executar. Muitas tarefas de inicializações são desempenhadas e o sistema torna-se válido para os users.
<br />
Quando um computador é ligado, executa em primeiro lugar código de boot que está guardado na ROM. Esse código tenta entender como carregar e começar o kernel. O kernel investiga o hardware do sistema e cria o processo *init*, que é sempre o número 1.
<br />
Antes que o sistema esteja completamente inicializado, os sistemas de ficheiros têm de ser verificados e montados e os daemons do sistema inicializados. Esses procedimentos são gerados por uma série de scripts de shell que são executados em sequência pelo init.
<br />
Caso um disco falhe ou haja um problema de configuração que impede que o sistema se ligue totalmente, os sistemas UNIX conseguem inicializar apenas o suficiente para executar uma shell na consola do sistema. Essa opção é conhecida por booting to single-user mode ou recovery mode. Acede-se passando um argumento ao kernel no  momento da inicialização.

### Típico processo de bootstrapping:
• Ler do boot loader a partir do master boot record (MBR).
<br />
• Carregamento e inicialização do kernel.
<br />
• Deteção e configuração de dispositivos.
<br />
• Criação de processos do kernel: o kernel cria vários processos espontâneos (não são criados pelo *fork*).
<br />
• Interveção do administrador (quando em modo single-user: tem de se pôr a password do root. Só a partição do root está montada, logo se se quiser usar outros programas tem de se montar esses outros filesystems).
<br />
• Execução de scripts de arranque (de startup) do sistema sequencialmente pelo init.

## Grub (The Grand Unfied Boot Loader)
Default boot loader para alguns sistemas.
<br />
Por defauld, o grub lê o file de configuração de boot default no início.

## Multibooting
Cada partição de disco tem o seu próprio second-stage boot loader.
<br />
Numa configuração multibooting tem de se decidir qual boot loader vaii ser o master.

## Systemd
Gere o sistema e os seus serviços.

## *init*
Responsável pelas seguintes atividades no arranque: <br />
• Executar os scripts de startup do sistema. <br />
• Verificar integridade dos sistemas de ficheiros. <br />
• Montar discos locais (/etc/fstab). <br />
• Iniciar áreas de swap. <br />
• Limpar e verificar sistemas de ficheiros (Quotas, remoção de ficheiros temporários) <br />
• Arrancar rede e montar discos remotos. <br />
• Arrancar serviços (daemons) para impressão, email, logging, cron, etc. (alguns como de log podem ser lançados antes) <br />
• Ativar mecanismos de login.
<br /><br />
Em Linux o *init* é configurado de modo a proceder a um arranque ao estilo “System V”.
<br />
Num “System V” existem uma série de estados de execução (run levels) designados por um caracter, geralmente um número. Um sistema encontra-se num destes estados. O sistema muda de estado através de comandos administrativos.

## Níveis do init
#### Nível 0
O sistema está todo desligado.
#### Nível 1 e S
Single-user mode.
#### Nível 2-5
Tem suport para networking.
#### Nível 6
Nível de reboot.
