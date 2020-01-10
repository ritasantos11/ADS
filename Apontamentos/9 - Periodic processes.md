## Processos periódicos
Execução de scrips ou programas com determinada frequeência sem intervenção humana.

### cron daemon
Serviço que corre tarefas periódicas, previamente agendadas.
<br />
Começa quando o sistema s eliga e corre até se desligar.
<br />
*cron* lê os files de configuração que contém uma lista de linhas de comandos e a hora a que estas devem ser invocadas.
<br />
Tudo o que se faz na shell pode ser feito pelo *cron*.
<br />
O file de configuração do *cron* é o *crontab*.
<br />
Essesm files para cada user são guardados em */var/spool/cron*.
<br />
O nome dos *crontabs* são os nomes de login do user a que o file pertence. O *cron* usa esses nomes para obter o UID a usar quando correr os comandos que o file contém.

### Outras funcionalidades
Definir no file *crontab* variáveis de ambiente: <br />
• MAILTO: usado para indicar quem deve receber os emaisl resultantes dos comandos do *crontabb*. <br />
• SHELL <br />
• PATH <br />
• HOME

### Datas especiais
• @reboot: executar após o reboot. <br />
• @yearly: executar uma vez por ano, i.e. "0 0 1 1 *". <br />
• @annually: executar uma vez por ano, i.e. "0 0 1 1 *". <br />
• @monthly: executar uma vez por mês, i.e. "0 0 1 * *". <br />
• @weekly: executar uma vez por semana, i.e. "0 0 * * 0". <br />
• @daily: executar uma vez por dia, i.e. "0 0 * * *". <br />
• @hourly: executar uma vez por hora, i.e. "0 * * * *".

### *crontab -e*
