## Full backups
Inclui todo o conteúdo do filesystem

## Backup incremental
Inclui só files alterados desde o último backup.

## Deduplication
Deteta files já existentes e em backup e não faz dump desses (ou mesmo remove duplicados).

## dump
Especificar o nível do backup.
<br />
Nível N: faz backup de todos os files alterados desde o último backup feito com um nível inferior a N.
<br />
Nível 0: full backup.
<br />
*dump* cria uma lista de files que foram modificados desde o último dump e põe esses files num grande file para armazenar num dispositivo externo.

#### Vantagens do dump
• Backups can span multiple tapes.
•Files of any type (even devices) can be backed up and restored.
•Permissions, ownerships, and modification times are preserved.
•Files with holes are handled correctly. 6
•Backups can be performed incrementally (with only recently modified files being written out to tape).

### Comando tar
Permite ler mais do que um ficheiro e colocá-lo num arquivo (ex.: tape). E copiar diretórios.
<br />
Permite usar compressão usando programas externos

### Comando dd
Leitura, conversão e escrita de ficheiros.
<br />
Pode ser usado para copiar “bit por bit”.

### Comando rsync
Sincronização de pastas.
<br />
Sincronização de diferenças.

## ZFS (zetabyte file system)
Sistema de ficheiros.
<br />
Permite criação de snapshots pelo próprio user: cria  no próprio armazenamento do filesystem (utiliza o Copy-on-wire).
<br />
Permite enviar (*zfs send*) e receber (*zfs receive*) snapshots: tem de enviar todo o sistema e para restaurar tem de se restaurar todo o sistema.
