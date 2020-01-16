## SAMBA
Servidor CIF para Linux.
<br />
Não serve apenas aqruivos de servidor através do CIFS, mas também pode executar as funções básicas  de um controlador do Windows Active Directory.
<br />
Como controlador de domínio, o SAMBA suporta recursos avançados, como logins de domínio do Windows, perfis de user móvel do Windows e spool de impressões CIFS.
<br />
Ao contrário do NFS, que requer suporte ao nível do kernel, SAMBA não requer nenhumas modificações de drivers ou de kernel e corre como um processo de user.

### Serviços do CIF
• Partilha de files (*smbd*). <br />
• Impressão por rede (*smbd*). <br />
• Autenticação e autorização (*smbd*). <br />
• Resolução de nome (*nmbd*). <br />
• Anuncio de serviços (*nmbd*).

### daemon *smbd*
Após autenticação corre como o user que o invoca.
<br />
Adiciona lock de files, semelhante ao esperado pelo cliente Windows.

### daemon *nmbd*

### Instalar o SAMBA
Modificar o file */etc/samba/smb.conf*, adicionando os diretórios e printers a serem exportados, os direitos de acesso e outros parâmetros do SMABA.

#### Segurança
• Identificar máquinas que podem aceder (hosts allow). <br />
• Bloquear (firewall) acesso de fora da rede local. <br />
• Transporte de dados é sem cifra: apenas a autenticação tem cifra.

#### Autenticação
Uso de um sistema de credencias que não o */etc/shadow*: <br />
• Local. <br />
• Usando LDAP.
<br />
Opção que encripta a troca de password entre o cliente Windows e o servidor do SAMBA:

    encrypt passwords = true

O server SAMBA guarda uma password hash para cada user.
<br />
*smbpasswd* para configurar password.
