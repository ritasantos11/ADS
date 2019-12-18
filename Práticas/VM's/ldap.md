### -Y EXTERNAL
-Y: especifica o mecanismo de SASL (Simple Authentication Security Layer)
EXTERNAL: permite ao cliente pedir ao servidor que use credenciais estabelecidas por meios externos ao mecanismo para autenticar o cliente

### -H ldapi:///
-H: especifica o URI (identificador uniforme de recurso) referente ao servidor LDAP
-H ldapi:/// : para usar a socket de domínio UNIX

### -x
Para usar a autenticação simples em vez da de SASL

### -D cn=Manager,... (Binding)
-D: usa o dn cn=Manager,... para vincular ao diretório LDAP

### -W
Solicitar autenticação simples

### -L
os resultados da pesquisa são exibidos no formato LDIF

### -b dc=grupoE,...
Indica o nível a partir do qual se inicia a procura

### -Q
Silencia o ouput sobre a ligação
