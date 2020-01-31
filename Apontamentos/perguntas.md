#### Porque é que os dados das contas se encontram distribuídas por dois ficheiros?
Uma questão de segurançã. As passwords estando no ficheiro /etc/shadow estão encriptadas, desta forma só o root tem acesso às passwords e nenhum programa de cracar passwords consegue decifrá-las.

#### Verifique as permissões do /etc/shadow e diga porque é que só a root pode ter permissões de leitura?
Porque neste ficheiro encontram-se as passwords encriptadas de todos os utilizadores. Assim as passwords estão seguras e não é possível terceiros descobri-las.

#### Sendo assim, porque é que o ficheiro /etc/passwd precisa de poder ser lido por todos os utilizadores?
Este ficheiro contém outras informações relativas a cada user, não contendo as passwords.

#### Quais são as contas com password no /etc/shadow?
Diferentes de * e ! no 2ºcampo. Sendo que ! significa que a conta está bloquada, porque ainda não se atribuiu passowrd a essa conta.
    