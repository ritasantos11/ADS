## Kernel
### Funcionalidades/Responsabilidades
• Processos. <br />
• Sinais e semáforos. <br />
• Memória virtual. <br />
• Sistema de ficheiros. <br />
• Entrada/saída genérica. <br />
• Comunicação entre processos (IPCs).

### Tipos
##### Kernel monolítico
• Todos os serviços são executados a nível do kernel (kernel space): IPCs, sistemas de ficheiros, memória virtual, etc. <br />
• Módulos podem ser carregados se necessário. <br />
• Kernel do linux.

##### Micro-kernel
• Alguns dos serviços correm em user-space. <br />
• Linux tem FUSE (File system in USEr space), UIO (Userspace I/O), FUSD (Framework for User-Space Devices) (abandonado?) e outros.


## */dev/*
Os dispositivos são vistos como files.
<br />
Acesso mapeado por programas são mapeados em chamadas ao kernel (driver).
<br />
Tem um número major e minor: <br />
• Major: define o tipo. <br />
• Minor: define a instância específica.
