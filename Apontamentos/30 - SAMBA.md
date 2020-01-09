## SAMBA
Servidor CIF para Linux.
<br />
Não serve apenas aqruivos de servidor através do CIFS, mas também pode executar as funções básicas  de um controlador do Windows Active Directory.
<br />
Como controlador de domínio, o SAMBA suporta recursos avançados, como logins de domínio do Windows, perfis de user móvel do Windows e spool de impressões CIFS.

### Serviços do CIF
• Partilha de files
• Impressão por rede
• Autenticação e autorização
• Resolução de nome
• Anuncio de serviços

### daemon smbd
Implementa sefviços de arquivos e impressão, autenticação e autorização.

### daemon nmbd
FOrnece outros componentes do CIFS: resolução de nome e anúncio de serviços.

Unlike NFS, which requires kernel-level support, Samba requires no drivers or kernel modifications and runs entirely as a user process. It binds to the sockets used for CIFS requests and waits for a client to request access to a resource. Once a request has been authenticated, smbd forks an instance of itself that runs as the user who is making the requests. As a result, all normal file-access permissions (including group permissions) are obeyed. The only special functionality that smbd adds on top of this is a file-locking service that gives client PCs the locking semantics to which they are accustomed.
