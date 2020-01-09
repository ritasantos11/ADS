## LDAP (Lightweight Directory Access Protocol)
Permite fazer a gestão de utilizadores e dos seus atributos.
<br />
Permite ter UIDs e GIDs únicos num domínio (vários sistemas).
<br />
Base de dados que armazena dados de forma hierárquica.
<br />
Para autenticar um user no LDAP, é necessário descobrir o seu DN e a sua password: <br />
• Sabendo o nome do user ou email, procurar por todas as entradas esse DN.

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
• Aplicações podem aceder à informação centralizada para as suas funções:
- Ex.: servidor de email verificar endereços válidos <br />
• Aplicações podem autenticar utilizadores:
- Ex.: Mooshak, codex, Proxmox, etc. <br />
• Ferramentas para linha de comandos:
- Permite scripts <br />
• Mudanças no LDAP são visíveis imediatamente. <br />


