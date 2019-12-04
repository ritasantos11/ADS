# PGINA
Note that pGina does not actually log the user on to the machine. It is the Windows OS itself that does that. This means that if a local account does not exist that matches the credentials, the logon will fail, even if the pGina plugins have registered success. Therefore, it is often the case that one of the plugins will be responsible for creating a local (often temporary) account. The plugin called “Local Machine” takes care of this in the Gateway stage. For details, see the documentation for the Local Machine plugin.

In a typical setup one wants to make sure that a local account exists or is created at the end of the pipeline. To do so, one should configure the LocalMachine plugin so that it executes last in the Gateway stage. It is the Gateway stage of the LocalMachine plugin that creates (if necessary) local accounts. If the LocalMachine plugin executes earlier, it may miss important information for the local account (such as group membership).


