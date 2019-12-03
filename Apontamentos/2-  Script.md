
Cada processo tem pelo menos 3 canais de comunicação: STDIN (0), STDOUT (1) e STDERR (2).
Normalmente, STDIN lê do terminal e o STDOUT e STDERR escreve para o ecrâ.
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


## cut
Separa linhas em campos.
Imprime partes selecionadas de cada linha do input.
O delimiter default é o tab.

## sort
Ordena linhas de input.

## uniq
Imprime linhas únicas.

## wc
Conta linhas, palavras e caracteres num ficheiro.

## tee
Copia input para 2 sítios.
Copia input para o STDOUT e para o ficheiro especificado no comando.

## head e tail
Lê o início e o fim do ficheiro respetivamente.
Default: 10 linhas

## tail -f
Espera por novas linhas no ficheiro e imprime-as à medida que são adicionadas.

## grep
Procura texto no input dado e imprime as linhas q correspondem ao que se está a procurar.


## BASH SCRIPTING
Iniício do script: #!/bin/bash
Preparar o ficheiro para correr: chmod +x nome_do_script.sh
Executar: ./nome_do_script.sh
	ou 
bash nome_do_script.sh

P.40
