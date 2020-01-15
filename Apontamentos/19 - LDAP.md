## LDAP (Lightweight Directory Access Protocol)
É um repositório generalizado, semelhante a um banco de dados, que pode armazenar dados de gerenciamento de users e outros tipos de dados.
<br />
Usa um modelo hierárquico de cliente/servidor que suporta vários servidores e vários clientes simultâneamente.
<br />
Uma das grandes vantagens do LDAP como repositório em todo o site para dados de login é que ele pode impor UIDs e GIDs únicos em todos os sistemas.
<br />
Permite fazer a gestão de utilizadores e dos seus atributos.
<br />
Permite ter UIDs e GIDs únicos num domínio (vários sistemas).
<br />
Base de dados que armazena dados de forma hierárquica.
<br />
Para autenticar um user no LDAP, é necessário descobrir o seu *dn* e a sua password: <br />
• Sabendo o nome do user ou email, procurar por todas as entradas esse *dn*.

### Estrutura do LDAP
Cada entrada do LDAP consiste num conjunto de atributos com os seus valores associados.
<br />
Cada entrada é identificada pelo seu *dn* (distinguished name).
<br />
As entradas são esquemetizadas através do uso do atributo *objectClass*. As Objects Classes especificam os atributos que a entrada pode conter.
<br />
O nível mais alto da árvore de classes é o *top*, que indica que a entrada contém um atributo *objectClass*.

### Aplicações do LDAP
• Repositório central de informação sobre utilizadores. <br />
• Aplicações podem aceder à informação centralizada para as suas funções: <br />
    ---- Ex.: servidor de email verificar endereços válidos <br />
• Aplicações podem autenticar utilizadores: <br />
    ---- Ex.: Mooshak, codex, Proxmox, etc. <br />
• Ferramentas para linha de comandos: <br />
    ---- Permite scripts <br />
• Mudanças no LDAP são visíveis imediatamente.

### *slapd*
Standard LDAP server daemon.
<br />
Contém os ficheiros de configuração e utilitários.

### *slurpd*
Serve, para quando existem vários servidores LDAP, para manter a replicação aos servidores súbditos.

### OpenLDAP
*suffix* é o nome de base do LDAP. É a raiz da parte do espaço para nome LDAP (LDAP namespace), semelhante ao conceito ao DNS domain name.
<br />
*rootdn* é o nome do administrador.
<br />
*rootpw* é a password do administtrador

### Migration tools
Permite migrar estrutura existente para o LDAP.

### Atributos
• *dc*: domain componente <br />
• *cn*: common name <br />
• *ou*: organization unit

### Esquemas
Estão já alguns definidos em */etc/openldap/schema/*.

### SASL (Simple Authentication and Security Layer)

### Certificados self-signed
A chave privada do prórpio certificado assina o certificado.
<br />
O CA (certificate authority) é a entidade do próprio certificado.

### Interlúdio autenticação
##### *authselect*
Permite configurar onde aceder a autenticação e identificação.
<br />
Substitui o *authconfig*.
<br />
Define profiles para diminuir erros de mudar vários ficheiros.

### SSSD (System Security Services Daemon)
Daemon de gestão para consulta de diretórios de informação e autenticação.
<br />
Permite configurar diretório LDAP e o seu acesso.

## Variações do protocolo LDAP
• *ldap://:*: protocolo LDAP básico. <br />
• *ldaps://*: quando se usa SSL/TLS para encriptar o tráfego de dados. <br />
• *ldapi://*: quando se usa IPC para conectar de forma segura com um sistema local de LDAP. Comunicação feita através de sockets em vez de portas de redes exportas.
