## Prática 1
### Contas do sistema
3.
a)

    cut -d -f1 /etc/passwd | sort

b)

    wc -l /etc/passwd

c)

    cut -d: -f7 /etc/passwd | sort | uniq | wc -l

d)

    cut -d: -f7 /etc/passwd | sort | uniq -c

e)
    
    cut -d: -f1,2 shadow | grep -E [a-z]+:[^*\!] | cut -d: -f1

f)
    
    cut -d: -f1,2 shadow | grep -v -E [a-z]+:[^*\!] | cut -d: -f1


### Procurar ficheiros
1)

    
    find .config -exec md5sum {} + > somas_md5_myHome

4)
    

    find / -executable -ls -type f

5)

    
    find / -executable -ls -type f | grep -v root

6)


    sudo find / -executable -type f -print0 | xargs -0 ls -lrt | head -n 1 
    find /home -executable -type f -print0 | xargs -0 ls -lrt | head -n 1
    find /home -executable -type f -printf '%T+ %p\n' | sort | head -n 1

7)


    sudo find / -executable -type f -print0 | xargs -0 ls -lt | grep root | head -n 1
    sudo find / -executable -type f -user root | xargs ls -lt | head -n 1
    sudo find / -executable -type f -user root -print0 | xargs -0 ls -lt | head -n 1 

8)


## Prática 2
### Grupos
1)

    chmod +x grupos1.sh 
    ./grupos1.sh nome

### AWK ou PERL
1)
    

    ls -l /etc | awk '{sum+=$5}; END {div=sum/NR; print div}'

    ls -Sl /etc | awk '{sum+=$5}; END {div=sum/NR; print div;  print}'



## PRATICA 3
### Processos
1)
    

    ps aux | grep "[k"

2)
    

    killall firefox

### /PROC
1)
firefox <br />
a)
    
    ls /proc/<PID>

2)
    

    
    cat /proc/mounts
    mount

