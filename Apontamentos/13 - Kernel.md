## Kernel
Esconde o hardware debaixo de uma interface de programação abstrata e de alto nível.
<br />
Contém device drivers que gerem a sua interação com específicas partes do hardware. O resto do kernel é independente de dispositivos.

### Funcionalidades/Responsabilidades
• Processos. <br />
• Sinais e semáforos. <br />
• Memória virtual (swapping, paging, mapping). <br />
• Sistema de ficheiros. <br />
• I/O genérico. <br />
• Comunicação entre processos (IPCs).

### Tipos
#### Kernel monolítico
Kernel do linux.
<br />
Todos os serviços são executados a nível do kernel (kernel space): IPCs, sistemas de ficheiros, memória virtual, etc. 
<br />
Módulos podem ser carregados se necessário.

#### Micro-kernel
Alguns dos serviços correm em user-space.
<br />
Linux tem FUSE (File system in USEr space), UIO (Userspace I/O), FUSD (Framework for User-Space Devices) (abandonado?) e outros.

## Device driver
Porgrama que gere a interação do sistema com um tipo específico de hardware.
<br />
O driver traduz entre os comandos de hardware compreendidos pelo dispositivo e a interface de programação usada pelo kernel.
<br />
A camada driver ajuda o kernel a ficar razoavelmente independente do dispositivo.
<br />
Apesar dos device drivers serem parte do kernel e não processos de user, o driver tanto pode ser acedido por dentro do kernel como pelo espaço do user.
<br />
O acesso ao driver pelo espaço do user é feito pelos dispositivos (que são vistos como files) que estão em */dev*.

### */dev/*
O kernel mapeia operações nestes files em chamadas ao código do driver.
<br />
Tem um número major e minor, que são usados pelo kernel para mapear as referências do device file no driver correspondente: <br />
• Major: define o tipo do dispositivo. <br />
• Minor: define a instância específica.

### Tipos de device files
• Bloco (b): xlido ou escrito em blocos de bytes. <br />
• Caracter (c): lido ou escrito byte a byte.

### Pseudo dispositivos
Entradas no */dev* que não representam hardware, mas apenas fornecem interface idênticas a estes. <br />
Ex: <br />
• */dev/random* <br />
• */dev/zero* <br />
• */dev/urandom* <br />
• */dev/null*

### Criação de device files
• Manual: usando o comando *mknod*:

    mknod filename type major minor

• Automática: usando o daemon *udevd* que lê mensagens do kernel que contêm estados de  mudança no dispositivo. Baseado na info de configuração em */etc/udev* e */lib/udev*, *udevd* pode executar várias ações quando um dispositivo é descoberto ou desconectado. Por definição cria device files em */dev*.

## Dir */proc/sys*
Configuração de parâmetros do kernel, em que alguns não são de escrita.
<br />
As modificações diretas não são mantidas após reninciar.
<br />
Usar o comando *sysctl*.

## Construir o Kernel
• É possível fazer download da dource, configurar e fazer make.
<br />
• Pode ser necessário construir dirvers com patches. Necessário o código fonte, mas não construir todo o kernel.

## Carregar módulos/drivers
É possível adicionar ou remover módulos enquanto o sistema corre, mas pode causar um kernel-panic.
<br />
Listar os módulos: *lsmod*.
<br />
Inserir: *insmod*. Passar parâmetros com:

    insmod /caminho/mod.ko io=0xXXX irq=X

Remover: *rmmod* ou *modprobe -r* (mais aconselhável).
<br />
Descobrir e carregar as dependências: *modprobe*.

## */sys*
Info sobre os dispositivos e as suas características.

## Utilitários para informação
• comando *udevadm*: permite filtrar deteções e associar ações. Ex: Quando é detetado uma pen-drive, lançar o driver e montar no sistema. <br />
• *lsusb* <br />
• *lspci* <br />
• *lspcu* <br />
• *lsscsi* (necessário instalar pacote lsscsi) <br />
• *lsdev* (necessário instalar pacote procinfo) <br />
• *lshw* (necessário instalar pacote lshw)
