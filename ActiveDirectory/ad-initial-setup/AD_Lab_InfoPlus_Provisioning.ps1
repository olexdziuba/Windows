<# 
SCRIPT DE LABORATOIRE – Active Directory
Création d’une structure AD pour une entreprise fictive "InfoPlus"
NE PAS MONTRER AUX ÉTUDIANTS
#>

Import-Module ActiveDirectory

$DomainDN = "DC=infoplus,DC=lan"
$RootOU   = "OU=InfoPlus,$DomainDN"
$Pwd     = ConvertTo-SecureString "strongpassword" -AsPlainText -Force

# ======================================================
# CRÉATION DES UNITÉS D’ORGANISATION
# ======================================================

New-ADOrganizationalUnit -Name "InfoPlus" -Path $DomainDN -Description "OU racine de la corporation"

New-ADOrganizationalUnit -Name "Vente"     -Path $RootOU -Description "Département des ventes"
New-ADOrganizationalUnit -Name "Achat"     -Path $RootOU -Description "Département des achats"
New-ADOrganizationalUnit -Name "Direction" -Path $RootOU -Description "Département de la direction"
New-ADOrganizationalUnit -Name "TI"        -Path $RootOU -Description "Département TI"

New-ADOrganizationalUnit -Name "Groupes"   -Path $RootOU -Description "Groupes de sécurité"
New-ADOrganizationalUnit -Name "Ressources"-Path $RootOU -Description "Ressources publiées"

# ======================================================
# CRÉATION DES GROUPES GLOBAUX
# ======================================================

New-ADGroup -Name "GG_Vendeurs"    -Path "OU=Groupes,$RootOU" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "GG_Acheteurs"   -Path "OU=Groupes,$RootOU" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "GG_Directeurs"  -Path "OU=Groupes,$RootOU" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "GG_Techniciens" -Path "OU=Groupes,$RootOU" -GroupScope Global -GroupCategory Security

# ======================================================
# CRÉATION DES UTILISATEURS
# ======================================================

# VENTES
New-ADUser -Name "Vent1" -DisplayName "Vendeur 1" -SamAccountName "vent1" `
  -Path "OU=Vente,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

New-ADUser -Name "Vent2" -DisplayName "Vendeur 2" -SamAccountName "vent2" `
  -Path "OU=Vente,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

# ACHATS
New-ADUser -Name "Ach1" -DisplayName "Acheteur 1" -SamAccountName "ach1" `
  -Path "OU=Achat,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

New-ADUser -Name "Ach2" -DisplayName "Acheteur 2" -SamAccountName "ach2" `
  -Path "OU=Achat,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

# DIRECTION
New-ADUser -Name "Dir1" -DisplayName "Directeur 1" -SamAccountName "dir1" `
  -Path "OU=Direction,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

New-ADUser -Name "Dir2" -DisplayName "Directeur 2" -SamAccountName "dir2" `
  -Path "OU=Direction,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

# TI
New-ADUser -Name "TechAdmin" -DisplayName "Technicien Admin" -SamAccountName "techadmin" `
  -Path "OU=TI,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

New-ADUser -Name "TechJunior" -DisplayName "Technicien Junior" -SamAccountName "techjunior" `
  -Path "OU=TI,$RootOU" -AccountPassword $Pwd -Enabled $true -PasswordNeverExpires $true

# ======================================================
# AJOUT DES UTILISATEURS AUX GROUPES
# ======================================================

Add-ADGroupMember -Identity "GG_Vendeurs"    -Members vent1,vent2
Add-ADGroupMember -Identity "GG_Acheteurs"   -Members ach1,ach2
Add-ADGroupMember -Identity "GG_Directeurs"  -Members dir1,dir2
Add-ADGroupMember -Identity "GG_Techniciens" -Members techadmin,techjunior
