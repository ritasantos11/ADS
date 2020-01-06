# Setuid e setgid
Ferramenta de segurança que permite aos users executar determinados programas com privelégios.
Quando o kernel executa um file executável com os seus bits de permissão setuid ou setgid configurados, ele altera o UID ou GID efetivo do processo resultante para o UID ou GID do file que contém a imagem do programa em vez do UID ou GID do user que executou o comando. Os privilégios do user são promovidos apenas para a execução desse comando específico.

Os users devem poder alterar as suas passwords. Mas como as passwords são guardadas no file /etc/shadow, os users precisam de um comando setuid passwd para aceder.
O comando passwd verifica quem está executando e personaliza o seu comportamento:
•os users só podem alterar apenas as suas passwords.
•o root pode alterar qualquer senha.



P.107

