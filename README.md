# Azure-AZ-104-Project
Implement and manage virtual networking and VPN Ipsec/IKv2 with Mikrotik

•	Azure Virtual Networks
•	Azure VPN Gateway
•	Network Security Groups (NSGs)
•	Azure Bastion
•	Configure your On-premises (Mikrotik ROS7)

Let’s break down the steps for setting up an Azure Virtual Network (VNet) with the mentioned features:

1.	Create an Azure Virtual Network (VNet):

o Log in to your Azure portal.
o	Navigate to Virtual networks and click + Add.
o	Choose a name, region, address space (CIDR block), and subnet ranges for your VNet.
o	Create subnets within the VNet for different purposes (e.g., WebApp, Database, Admin).

3.	Set Up an Azure VPN Gateway:

o	In your VNet, create a Gateway Subnet.
o	Configure an Azure VPN Gateway to establish a site-to-site VPN connection.
o	Define the on-premises VPN device settings (IP address, shared key, etc.).
o	Verify the connection status to ensure communication between on-premises and Azure resources.

4.	Deploy Test Resources (VMs):

o	Create virtual machines (VMs) within each subnet.
o	For example, deploy a web server VM in the WebApp subnet, a database server in the Database subnet, and an admin server in the Admin subnet.

5.	Network Security Groups (NSGs):

o	Create NSGs for each subnet.
o	Define inbound and outbound rules to allow only necessary traffic.
o	For instance, allow HTTP/HTTPS traffic to the WebApp subnet and restrict other protocols.

6.	Implement Azure Bastion:

o	Set up Azure Bastion to securely manage RDP and SSH access to VMs.
o	It provides a browser-based interface without exposing VMs to the public internet.
o	Ensure you have an SSH key for added security.

7.	Configure a Recovery Vault:
o	Create a Recovery Services vault.
o	Configure backup policies for VMs within your VNet.
o	This ensures secure backups and reliable data recovery even if production servers are compromised.
