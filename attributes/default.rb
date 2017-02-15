default[:pgina][:installer_url]      = "https://github.com/MutonUfoAI/pgina/releases/download/3.2.4.1/pGinaSetup-3.2.4.1.exe"
default[:pgina][:application_string] = "pGina v3.2.4.1"
default[:pgina][:motd]               = "pGina Version: %v"
default[:pgina][:disable_default_provider]      = false
default[:pgina][:tile_image]         = ""
                
# LDAP Plugin
default[:pgina][:ldap][:enabled]                = false
default[:pgina][:ldap][:require_server]         = true
default[:pgina][:ldap][:hosts]                  = [ "ldap.example.com" ]
default[:pgina][:ldap][:port]                   = "389"
default[:pgina][:ldap][:timeout]                = "10"
default[:pgina][:ldap][:ssl_enabled]            = "False"
default[:pgina][:ldap][:tls_enabled]            = "False"
default[:pgina][:ldap][:require_cert]           = "False"
default[:pgina][:ldap][:server_cert_file]       = ""
default[:pgina][:ldap][:user_dn_pattern]        = "uid=%u,dc=example,dc=com"
default[:pgina][:ldap][:search_enabled]         = "False"
default[:pgina][:ldap][:bind_with_user_credentials] = "True"
default[:pgina][:ldap][:search_dn]              = ""
default[:pgina][:ldap][:search_filter]          = ""
default[:pgina][:ldap][:search_contexts]        = [ ]
default[:pgina][:ldap][:require_groups]         = [ ]

=begin
#Doesn't work anymore
default[:pgina][:ldap][:always_add_to_groups]   = [ "Remote Desktop Users" ]
default[:pgina][:ldap][:add_to_groups_if]       = { }
default[:pgina][:ldap][:add_to_groups_not_if]   = { }
=end

#caution we need to separate every data by a tab (\t)
#GroupGatewayRules If BASE PATH FILTER LOCAL_GROUP ( (if=0 / if not=1 & base=0 / oneleve=1 / subtree=2)
#ex if base = 0\t0\t  / if not subtree = 1\t2\t / ...
#CAUTION always =2\t0\t  !!!can't be anything else!!!
#S-1-5-32-545=Administrators S-1-5-32-544=Authentified_Users but you can use Administrators ou Users to, I prefers the Windows ID for less error and multiple languages. 
#
#ex : if base path=(ldap group administrator) filter=(member of) local_group = administrator
#ex : always local_group = users
default[:pgina][:ldap][:group_gateway_rules]	= [
	"0\t0\tcn=administrator,ou=groups,dc=exemple,dc=com\t(&(memberUid=%u))\tS-1-5-32-544",
	"2\t0\tS-1-5-32-545" ]
