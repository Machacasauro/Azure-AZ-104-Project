# Azure-AZ-104-Project
Implement and manage virtual networking and VPN Ipsec/IKv2 with Mikrotik (All files are located above.)

Instead of manually creating all the resources, you have the option to upload a MyTemplate.zip file using the following command onn Azure CLI:

- az deployment group create --resource-group "resource-group-name" --template-file "path-to-template" 

Instead of manually create all configurations on the Mikrotik, you have the option to upload a IPsec-Config.rsc file using the following command on terminal:

- import file=IPsec-Config.rsc

•Azure Virtual Networks

•Azure VPN Gateway

•Network Security Groups (NSGs)

•Azure Bastion

•Configure your On-premises VPN Client in this case (Mikrotik ROS7)

Let’s break down the steps for setting up an Azure Virtual Network (VNet) with the mentioned features above:

1.	Log in to your Azure portal:

o	You can use the Azure CLI or the Azure Portal web interface. Here’s how you can do it using the Azure CLI:
o	az login \ 

2.	Navigate to Virtual networks and click + Add:

o	In the Azure Portal, go to Virtual networks and click the + Add button.

- Name: Choose a unique name for your VNet.
- Region: Select the Azure region where you want to create the VNet.
- Address space (CIDR block): Define the IP address range for your VNet (e.g., 10.0.0.0/16).
- Subnet ranges: Create subnets within the VNet for different purposes (e.g., WebApp, Database, Admin).  
  	*Example Code (Azure CLI):	az network vnet create

	    --name MyVNet 
	    --resource-group MyResourceGroup 
	    --location eastus 
	    --address-prefixes 10.0.0.0/16 
	    --subnet-name WebAppSubnet 
	    --subnet-prefixes 10.0.1.0/24

2. Set Up an Azure VPN Gateway:

	Create a Gateway Subnet:
	Within your VNet, create a subnet specifically for the VPN Gateway.
	Configure an Azure VPN Gateway:

o	Use the Azure Portal or Azure CLI to create an Azure VPN Gateway.
o	Define the necessary settings, including the on-premises VPN device settings (IP address, shared key, etc.).
	*Example Code (Azure CLI):	az network vnet-gateway create
 
	    --name MyVpnGateway 
	    --resource-group MyResourceGroup 
	    --vnet MyVNet 
	    --public-ip-address MyPublicIP 
	    --gateway-type Vpn 
	    --vpn-type RouteBased 
	    --sku VpnGw2
3. Deploy Test Resources (VMs):
	Create VMs within each subnet:

o	For example, deploy a web server VM in the WebApp subnet, a database server in the Database subnet, and an admin server in the Admin subnet.
	*Example Code (Azure CLI):	az vm create
 
	    --resource-group MyResourceGroup 
	    --name WebServer 
	    --image UbuntuLTS 
	    --admin-username azureuser 
	    --generate-ssh-keys 
	    --vnet-name MyVNet 
	    --subnet WebAppSubnet
     
4. Network Security Groups (NSGs):
	Create NSGs for each subnet:

o	Define inbound and outbound rules to allow only necessary traffic.
o	For instance, allow HTTP/HTTPS traffic to the WebApp subnet and restrict other protocols.
	*Example Code (Azure CLI):	az network nsg create
 
	    --resource-group MyResourceGroup 
	    --name WebAppNSG 
	
	az network nsg rule create
 
	    --resource-group MyResourceGroup 
	    --nsg-name WebAppNSG 
	    --name AllowHTTP 
	    --priority 100 
	    --source-address-prefixes '*' 
	    --destination-port-ranges 80 
	    --access Allow 
	    --protocol Tcp

5. Implement Azure Bastion:
	Set up Azure Bastion:

o	Azure Bastion provides secure RDP and SSH access to VMs without exposing them to the public internet.
o	Ensure you have an SSH key for added security.

6. Configure a Recovery Vault:
	Create a Recovery Services vault:

o	Configure backup policies for VMs within your VNet.
o	This ensures secure backups and reliable data recovery even if production servers are compromised.

Remember to replace placeholders like MyVNet, MyResourceGroup, and other specific values with your actual configuration.
