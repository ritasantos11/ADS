## Processos periódicos
Execução de scrips ou programas com determinada frequência sem intervenção humana.

### *cron* daemon
Serviço que corre tarefas periódicas previamente agendadas.
<br>
Começa quando o sistema se liga e corre até se desligar.
<br>
*cron* lê os files de configuração que contêm uma lista de linhas de comandos e a hora a que estas devem ser invocadas.
<br>
Tudo o que se faz na shell pode ser feito pelo *cron*.
<br>
O file de configuração do *cron* é o *crontab*.
<br>
Esses files para cada user são guardados em */var/spool/cron*.
<br>
O nome dos *crontabs* são os nomes de login do user a que o file pertence. O *cron* usa esses nomes para obter o UID a usar quando correr os comandos que o file contém.

### Outras funcionalidades
Definir no file *crontab* variáveis de ambiente: <br>
• *MAILTO*: usado para indicar quem deve receber os emails resultantes dos comandos do *crontab*. <br>
• *SHELL* <br>
• *PATH* <br>
• *HOME*

### Datas especiais
• *@reboot*: executar após o reboot. <br>
• *@yearly*: executar uma vez por ano, i.e. "0 0 1 1 *". <br>
• *@annually*: executar uma vez por ano, i.e. "0 0 1 1 *". <br>
• *@monthly*: executar uma vez por mês, i.e. "0 0 1 * *". <br>
• *@weekly*: executar uma vez por semana, i.e. "0 0 * * 0". <br>
• *@daily*: executar uma vez por dia, i.e. "0 0 * * *". <br>
• *@hourly*: executar uma vez por hora, i.e. "0 * * * *".
<br><br>
Instalar filename como um *crontab*, substituindo alguma versão anterior:

    crontab filename

Verificat uma cópia do *crontab*, abrindo no editor especificado com a variável de ambiente *EDITOR* e submete para o dir do *crontab*:

    crontab -e

Listar os conteúdos do *crontab* para o *STDOUT*:

    crontab -l

Remover o *crontab*, deixando de existir algum file *crontab*:

    crontab -r

Remover o *crontab* do user *rita*:

    crontab -r rita

### Files de configuração
• */etc/cron.allow*:  se existir, apenas utilizadores listado no ficheiro podem aceder ao *crontab*. O *cron.deny* é ignorado. <br>
• */etc/cron.deny*: se existir (e cron.allow não existir),
utilizadores listados não podem aceder ao *crontab*. <br>
• Se nenhum dos ficheiros existir, apenas utilizadores com super privilégios podem aceder ao *crontab*.

### *anacron*
Executa comandos periódicamente, mas não necessariamente às
horas certas: Máquina pode não estar sempre ligada.
<br>
Verifica se o comando foi corrido tendo em conta o período. Se não foi, espera o delay e executa-o.
<br>
Ficheiros: <br>
• configuração: */etc/anacrontab*. <br>
• local onde guarda os timestamps: */var/spool/anacron*.

### *at*, *batch*
Não é para execuções periódicas.
<br>
Para correr comandos uma vez num tempo específico: executar comandos em file_with_comands daqui a 3 horas:
    
    at -f file_with_comands now + 3 hours

Guarda trabalhos em: <br>
• */var/spool/at/spool* <br>
*batch* tem em conta a carga (load) do sistema para executar.
