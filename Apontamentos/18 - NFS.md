## NFS (Network File Services)
Partilha de files via network entre computadores.
<br />
Quando um server NFS cai nenhuma info é perdida.
<br /> <br />
Wide area networks têm altas latências, que fazem com que as operações se comportem de maneira irregular, e baixa largura de banda, o que resulta num desempenho lento para files maiores. A maioria dos protocolos de serviço de files, incluindo o NFS, têm técnicas para minimizar problemas de desempenho em redes locais e de área ampla (wide area networks).
<br />
A maioria dos protocolos tenta minimizar o nº de pedidos de rede.
<br />
Por exemplo, a cache de leitura antecipada pré carrega partes de um file num buffer de memória local para evitar atrasos quando uma nova secção do file é lida.
<br />
Uma pequena largura de banda de rede extra é consumida num esforço para evitar uma troca completa de ida e volta com o server.
<br />
Algumas caches escrevem em memória e enviam as suas atualizações em lotes, reduzindo o atraso na comunicação das operações de escrita para o servidor.

### Manutenção de estado
• Servidor com estado (Stateful): mantém estado sobre todos os ficheiros que todos os clientes têm abertos no servidor, o que pode levar a incoerência com crashes do servidor ou cliente. <br />
• Servidor sem estado (stateless): todos os pedidos são independentes uns dos outros. Não sabe quem tem que ficheiros abertos. Não gere a concorrência (o estado do ponto de vista dos clientes).

### Performance
• Fazer cache de escritas no cliente. <br />
• “Ler da rede” parte dos ficheiros abertos antes de ser necessário, ou seja, pré carrega partes de um file num buffer local. <br />
• Objetivo: diminuir os pedidos à rede do conteúdo dos ficheiros: diminuir tempo de acesso

### NFS v4
Usa TCP.
<br />
Mantém estado: mantém info sobre locks e files abertos.

### Controlo acesso
• *AUTH_NONE*: sem autenticação. <br />
• *AUTH_SYS*: autenticação usa mapeamento do UID e GID enviado pelo cliente para ser mapeado num UID e GID do server (utilizando o */etc/passwd*). <br />
• *RPCSEC_GSS*: definição de autenticação para controlo de acesso, integridade e privacidade. <br />
• Servidores V4 têm de implementar RPCSEC_GSS. <br />

### Mapeamento de utilizadores
Mapeia utilizadores do cliente em utilizadores do servidor: <br />
• Servidor utiliza o */etc/passwd* local para mapear UID e GID em user@server. <br />
• Cliente mapeia user usando */etc/passwd* local para um UID. <br />
Não é utilizado para controlo de acesso: para controlo de acesso são utilizados os UID e GID diretamente.
<br />
Pode-se alterar o UID e GID default para o root no file exports.

### *root squash*
Utilizador root é mapeado no utilizador nobody (utilizador anónimo do cliente).
<br />
Existe a possibilidade de fazer o mesmo para todos os
utilizadores, ou seja, mapear os UIDs dos users para UIDs de users anónimos no cliente: *all_squash*

### State
Um cliente deve montar um NFS filesystem antes de usá-lo, assim como um cliente deve montar um filesystem armazenado num disco local.
<br />
NFSv4 é um protocolo estável: o cliente e o server mantêm info sobre files abertos e bloqueios. Quando o server falha, o cliente auxilia no processo de recuperação relatando ao server as suas infos sobre o estado anterior à falha. Um server de retorno espera durante um período predefinido que os clientes antigos relatem as suas infos antes de permitir novas operações de bloqueios

### File system exports
NFS servers mantêm uma lista dos diretórios que estão disponíveis para os clientes pela network. Todos os servers exportam pelo menos 1 diretório.
<br />
No NFSv4, cada server exporta um único pseudo filesystem hierárquico que incorpora todos os seus diretórios exportados.

### Partilha de files
• No server NFS, listar os dir a exportar no file */etc/exports* e correr o comando *exportfs*. <br />
• No cliente, usar o comando *mount* para monar os dir exportados.

## Server side NFS
Um server com NFS exporta um diretório quando coloca o diretório disponível para uso por outras máquinas.
<br />
*mountd* (pedidos de mount) e *nfsd* (serviço de files) devem começar quando o sistema se liga e devem correr até o sistema se desligar.
<br />
Os scripts de início devem correr os daemons automáticamente se houver exports configurados.

### *exportfs -a*
Exporta o filesystem indicado no file */etc/exports*.

### */etc/exports*
Lista de dirs exportados e opções associadas.
<br />
Filesystems listados sem hosts especificados são montados por todas as máquinas (security hole).
<br />
Dar acesso a /home a todos os hosts numa LAN como 192.168.0.0:

	/home 192.168.0.0/24(rw,sync)

## Client side NFS
*mount*: hostname:dir.
<br />
Acrescentar o dir a ser montado no boot no file */etc/fstab*.
