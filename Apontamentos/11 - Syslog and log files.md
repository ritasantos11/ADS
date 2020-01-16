## Log files
Registos que contêm track de informação importante: mensagens sobre o server, incluindo sobre o kernel, serviços e aplicações a correr no server.
<br />
1 linha com data e hora, tipo e severidade do evento, entre outros detalhes relevantes.
<br />
Os files logs que são administrados pelo *syslog* (logger de eventos do sistem) contêm eventos de múltiplas fontes.
<br />
Os files logs encontram-se em */var/log*. Mas podem ser definidas pelas aplicações: */var/log/samba*.

## *syslog*
Sistema de logging.
<br />
Objetivos: <br />
• Ajudar os programados a não terem que ecrever files logs. <br />
• Pôr os adminisradores em controlo do logging. <br />

## *rsyslog* (rocket-fast system for log processing)
Sistema usado por defeito em linux. <br />
• Daemon: *rsyslogd*. <br />
• Bibliotecas: *syslog*. <br />
• Linha de comando: *logger*.

#### Objetivos do *rsyslog*
Receber mensagem de log e guardá-las nos locais “apropriados”: Na configuração estipular esses locais.

## *journalctl*
Sistema de journaling do systema.
<br />
Consegue cooperar com *rsyslog*.

## *AuditD*
Userspace daemon responsável por registar eventos para auditoria do sistema.
<br />
Usado pelo SELinux.
<br />
Desenvolvido pela RedHat, sistema de log de eventos ligados à segurança do sistema.

## Notas
Os timestamps são os locais. Quando se envia para a máquina remota serão os dessa máquina: a sincronização pode ser desnecessária.
<br />
Muitos logs se não estiverem bem distribuídos por files podem "poluir" os mesmos logs.
<br />
O kernel logging tem suporte no rsyslogd ou journal; o arranque tem um sistema para escrever o log: guardado num buffer, é escrito quando o sistema arranca.

## Ferramentas
### *logrotate*
Rotação dos logs, comprimindo-os.
<br />
Corre fora do cron 1 vez por dia.

### Parsing e "monotorização" dos logs
