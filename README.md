# Azure-AZ-104-Project
Implement and manage virtual networking and VPN Ipsec/IKv2 with Mikrotik

1.	Create an Azure Virtual Network (VNet) in your preferred region. Within this VNet, establish multiple subnets to effectively segregate resources. For example, you can create subnets for WebApp, Database, and Admin purposes.


2.	Set up an Azure VPN Gateway to establish a site-to-site VPN connection between your simulated on-premises environment (represented by a separate VNet) and your primary Azure VNet. Verify the connection to ensure seamless communication between resources, effectively simulating a hybrid environment.


3.	Deploy test resources (VMs) within each subnet of your primary Azure VNet. For instance, consider deploying a web server in one of the subnets.


4.	Utilize Network Security Groups (NSGs) to define inbound and outbound access rules for each subnet. These rules should allow only valid traffic. For example, restrict HTTP/HTTPS traffic to the WebApp Subnet.


5.	Implement Azure Bastion to securely manage RDP and SSH access to your virtual machines. By using Azure Bastion, you can avoid exposing your VMs directly to the public internet. Ensure that you have a SSH key for more security.


6.	Configure a Recovery Vault: With Recovery Services vaults, Azure Backup provides security capabilities to protect cloud backups. The security features ensure you can secure your backups, and safely recover data, even if production and backup servers are compromised.

