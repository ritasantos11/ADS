## Tapes
Leitura sequêncial: tem de se começar a ler do início.
<br />
Escrita acrescentando: o espaço descartado não fica livre até se re-formatar a tape escrita.
<br />
Escrita e leitura rápida.
<br />
Procura lenta.
<br />
Software específico para a leitura/escrita.

## Full backups
Inclui todo o conteúdo do filesystem

## Backup incremental
Inclui só files alterados desde o último backup.
<br />
Têm vários níveis que servem para minimizar o tempo de restauração do sistema.

## Deduplication
Copia só os files alterados desde o último backup completo.

## *dump*
Cria backups incrementais.
<br />
Especificar o nível do backup.
<br />
Nível N: faz backup de todos os files alterados desde o último backup feito com um nível inferior a N.
<br />
Nível 0: full backup.
<br />
*dump* cria uma lista de files que foram modificados desde o último dump e põe esses files num grande file para armazenar num dispositivo externo.

### Vantagens do *dump*
• Backups podem abranger várias tapes. <br />
• Files de qualquer tipo (até dispositivos) podem ser copiados e restaurados. <br />
• Permissões, propriedades e tempos de modificações são preservados. <br />
• Files com holes são tratados corretamente. <br />
• Backups podem ser realizados incrementalmente (só os files modificados recentemente são escritos na tape).

### Limitações do *dump*/*restore*
• Apenas filesystems que *dump* condiga ler. <br />
• Não suporta filesystems remotos (ex: NFS). <br />
• Ter de fazer *dump* de um filesystem de cada vez. <br />
• O *restore* irá recuperar files que foram apagados. <br />
• O uso de tapes implica que o seu tamanho seja tido em conta.

## Notas
Quantos mais backups se fazem menos dados serão perdidos se o sistema crashar. No entanto, os backups usam muitos recursos e tempo do sistema.
<br />
Deve-se fazer mais ou menos backups conforme o uso do sistem: fazer backups regularmente aos ficheiros que são usados constantemente, por exemplo os diretórios home dos utilizadores.

### *tar*
Permite ler mais do que um ficheiro e colocá-lo num arquivo (ex: tape). E copiar diretórios.
<br />
Permite usar compressão usando programas externos

### *dd*
Leitura, conversão e escrita de ficheiros.
<br />
Pode ser usado para copiar “bit por bit”.

### *rsync*
Sincronização de pastas.
<br />
Sincronização de diferenças.

## ZFS (Zetabyte File System)
Sistema de ficheiros.
<br />
Permite criação de snapshots pelo próprio user: cria  no próprio armazenamento do filesystem (utiliza o Copy-on-write).
<br />
Permite enviar (*zfs send*) e receber (*zfs receive*) snapshots: tem de enviar todo o sistema e para restaurar tem de se restaurar todo o sistema.
