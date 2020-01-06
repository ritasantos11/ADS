
Cada processo tem pelo menos 3 canais de comunicação: STDIN (0), STDOUT (1) e STDERR (2).
<br />
Normalmente, STDIN lê do terminal e o STDOUT e STDERR escreve para o ecrã.
<br />
Maior parte dos comandos lêem o input do STDIN e escrevem o seu OUTPUT para o STDOUT e as mensagens de erro para o STDERR.

	< conecta o STDIN do comando ao conteúdo dum ficheiro.
	> e >> redirecionam o STDOUT.
	> substitui o conteúdo dum ficheiro existente e >> adiciona ao ficheiro.

Para redirecionar o STDOUT e o STDERR para o mesmo sítio usa-se >&.
<br />
Para redirecionar apenas o STDERR usa-se 2>.
<br /><br />
Para conectar o STDOUT de um comando ao STDIN de outro comando usa-se o |.
<br />
Para executar um comando só se o comando anterior completar com sucesso, usa -se && para separar os comandos.
<br />
Para executar um comando só se o anterior falhar, usa-se || para separar os comandos.
<br /><br />

Para ir buscar um valor a uma variável, usa-se o $. Nome de variáveis: Case Sensitive.
<br />
Ex: o echo imprime o conteúdo da variável var

	var='ola'
	echo $var  ou  echo &{var}

.

	`string` substitui string pelo output do comando lá escrito.
	Ex:
	echo "Existe `wc -l /etc/passwd` linhas."
	Existem 28 linhas.


### which
Retorna a localização do ficheiro executável do comando dado.

### whereis
Retorna a localização do ficheiro source/binário e do manual do comando dado.

### locate
Descobre os ficheiros por nome.

### find
	
	$ find [where to start searching from] [expression determines what to find] [-options] [what to find]

-o: ou
<br /><br />

-atime n: accedido n dias atrás
<br />
-mtime n: modificado n dias atrás
<br />
-size n: tem n blocos de tamanho (1 bloco = 512 bytes) (+5M: maior que 5M)
<br />
-type c: “ficheiro” é do tipo: f=regular, d=diretório, etc
<br />
-fstype type: tipo de sistema de ficheiros: 4.2 ou nfs, etc
<br />
-name nome: nome do ficheiro é nome
<br />
-user usr: dono do ficheiro é usr
<br />
-group grp: grupo dono do ficheiro é grp
<br />
-perm p: permissões do ficheiro são p
<br /><br />

-print: escreve o caminho do ficheiro que está a ser avaliado
<br />
-ls: versão detalhada (ls -l) do comando print
<br />
-exec cmd: executa o comando sobre o ficheiro
<br />
-ok cmd: o mesmo que o anterior, só que pergunta antes de executar o comando
<br /><br />

-xdev: Restringe a pesquisa ao sistema de ficheiros da pasta inicial que serve de raiz à pesquisa
<br />
-prune: Não desce abaixo da pasta encontrada

### awk
	
	ps -ef | grep "firefox" | awk '{print $1}'

	find /home -user auser -type f -ls | \
	awk '{sum+=$7}; END {print "Total de gasto \
	em disco = " sum}'

### xargs
Automatiza a aplicação de comandos sobre um grupo de objetos.
<br />
Normalmente elemento final de uma pipe para aplicar repetidamente um comando aos objetos produzidos pela pipe.

### cut
Separa linhas em campos.
<br />
Imprime partes selecionadas de cada linha do input.
<br />
O delimiter default é o tab.

### sort
Ordena linhas de input.

### uniq
Imprime linhas únicas.

### wc
Conta linhas, palavras e caracteres num ficheiro.

### tee
Copia input para 2 sítios.
<br />
Copia input para o STDOUT e para o ficheiro especificado no comando.

### head e tail
Lê o início e o fim do ficheiro respetivamente.
<br />
Default: 10 linhas

### tail -f
Espera por novas linhas no ficheiro e imprime-as à medida que são adicionadas.

### grep
Procura texto no input dado e imprime as linhas q correspondem ao que se está a procurar.

### df
Report file system disk space usage
<br />
-h:  print sizes in powers of 1024


## Bash scripting
Iniício do script: #!/bin/bash
<br />
Preparar o ficheiro para correr: chmod +x nome_do_script.sh
<br />
Executar:
	
	./nome_do_script.sh
	ou 
	bash nome_do_script.sh


## Expressões Regulares
There are as many captures as there are opening parentheses, regardless of the role (or lack of role) that each parenthesized group played in the actual matching. When a parenthesized group is not used (e.g., Mu( ' )?ammar when matched against “Muammar”), its corresponding capture is empty.
<br />
If a group is matched more than once, only the contents of the last match arereturned.
<br />
For example, with the pattern (I am the (walrus|egg man)\. ?){1,2} matching the text
	
	I am the egg man. I am the walrus.

there are two results, one for each set of parentheses:
	
	I am the walrus.
	walrus