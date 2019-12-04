# LDAP
Cada entrada é identificada pelo seu DN (distinguished name).

Para atutenticar um user no LDAP, é necessário descobrir o seu DN e a sua password:
	-Sabendo o nome do user ou email, procurar por todas as entradas esse DN.

LDAP entries are typically schematized through the use of an objectClass attri-
bute. Object classes specify the attributes that an entry can contain, some of which
may be required for validity. The schema also assigns a data type to each attribute.
Object classes nest and combine in the traditional object-oriented fashion. The
top level of the object class tree is the class named top , which specifies merely that
an entry must have an objectClass attribute.



