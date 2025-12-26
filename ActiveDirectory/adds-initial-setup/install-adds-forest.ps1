# CE SCRIPT EST UTILISÉ POUR LA MISE EN PLACE DU SERVEUR
# DE LA TÂCHE 1 DE PARTAGE DE RESSOURCE
# USAGE STRICTEMENT PÉDAGOGIQUE

# ----------------------------------------------------
# INSTALLATION DU RÔLE AD DS ET DES OUTILS D’ADMINISTRATION
# ----------------------------------------------------
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# ----------------------------------------------------
# PROMOTION DU SERVEUR EN CONTRÔLEUR DE DOMAINE
# DOMAINE : infoplus.lan
# ----------------------------------------------------
Install-ADDSForest `
    -DomainName "infoplus.lan" `
    -DomainNetbiosName "INFOPLUS" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "strongpassword!" -AsPlainText -Force) `
    -InstallDns:$true `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -DomainMode "Win2012R2" `
    -ForestMode "Win2012R2" `
    -NoRebootOnCompletion:$false `
    -Force:$true
