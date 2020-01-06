
Cada processo tem pelo menos 3 canais de comunicação: STDIN (0), STDOUT (1) e STDERR (2).
Normalmente, STDIN lê do terminal e o STDOUT e STDERR escreve para o ecrã.
Maior parte dos comandos lêem o input do STDIN e escrevem o seu OUTPUT para o STDOUT e as mensagens de erro para o STDERR.

	< conecta o STDIN do comando ao conteúdo dum ficheiro.
	> e >> redirecionam o STDOUT.
	> substitui o conteúdo dum ficheiro existente e >> adiciona ao ficheiro.

Para redirecionar o STDOUT e o STDERR para o mesmo sítio usa-se >&.
Para redirecionar apenas o STDERR usa-se 2>.

Para conectar o STDOUT de um comando ao STDIN de outro comando usa-se o |.
Para executar um comando só se o comando anterior completar com sucesso, usa -se && para separar os comandos.
Para executar um comando só se o anterior falhar, usa-se || para separar os comandos.

Para ir buscar um valor a uma variável, usa-se o $. Nome de variáveis: Case Sensitive.
Ex: o echo imprime o conteúdo da variável var
	var='ola'
	echo $var  ou  echo &{var}

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

-atime n: accedido n dias atrás
-mtime n: modificado n dias atrás
-size n: tem n blocos de tamanho (1 bloco = 512 bytes) (+5M: maior que 5M)
-type c: “ficheiro” é do tipo: f=regular, d=diretório, etc.
-fstype type: tipo de sistema de ficheiros: 4.2 ou nfs, etc.
-name nome: nome do ficheiro é nome
-user usr: dono do ficheiro é usr
-group grp: grupo dono do ficheiro é grp
-perm p: permissões do ficheiro são p

-print: escreve o caminho do ficheiro que está a ser avaliado
-ls: versão detalhada (ls -l) do comando print.
-exec cmd: executa o comando sobre o ficheiro.
-ok cmd: o mesmo que o anterior, só que pergunta antes de executar o comando

-xdev: Restringe a pesquisa ao sistema de ficheiros da pasta inicial que serve de raiz à pesquisa
-prune: Não desce abaixo da pasta encontrada.

### awk
	
	ps -ef | grep "firefox" | awk '{print $1}'

	find /home -user auser -type f -ls | \
	awk '{sum+=$7}; END {print "Total de gasto \
	em disco = " sum}'

### xargs
Automatiza a aplicação de comandos sobre um grupo de objetos.
Normalmente elemento final de uma pipe para aplicar repetidamente um comando aos objetos produzidos pela pipe.

### cut
Separa linhas em campos.
Imprime partes selecionadas de cada linha do input.
O delimiter default é o tab.

### sort
Ordena linhas de input.

### uniq
Imprime linhas únicas.

### wc
Conta linhas, palavras e caracteres num ficheiro.

### tee
Copia input para 2 sítios.
Copia input para o STDOUT e para o ficheiro especificado no comando.

### head e tail
Lê o início e o fim do ficheiro respetivamente.
Default: 10 linhas

### tail -f
Espera por novas linhas no ficheiro e imprime-as à medida que são adicionadas.

### grep
Procura texto no input dado e imprime as linhas q correspondem ao que se está a procurar.

### df
Report file system disk space usage
-h:  print sizes in powers of 1024




## Bash scripting
Iniício do script: #!/bin/bash
Preparar o ficheiro para correr: chmod +x nome_do_script.sh
Executar:
	
	./nome_do_script.sh
	ou 
	bash nome_do_script.sh

P.40


