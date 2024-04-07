# Azure AZ-104 Virtual Networking and VPN (IPsec/IKEv2)
Implement and manage virtual networking and VPN Ipsec/IKv2 with Mikrotik (All files are located above.)

Instead of manually creating all the resources, you have the option to upload a template.json file using the following command on Azure CLI:

It is necessary to create the Resource Group first 😊
```css
az group create -l "MyLocation" -n "resource-group-name"
```
and then
```css
az deployment group create --resource-group "resource-group-name" --template-file "path-to-template\template.json"
```
or
Enter in https://portal.azure.com/#create/Microsoft.Template and deploy the file via GUI Azure portal interface.

Instead of manually create all configurations on the Mikrotik, you have the option to upload a IPsec-Config.rsc file using the following command on terminal:
```css
import file=IPsec-Config.rsc
```
•Azure Virtual Networks

•Azure VPN Gateway

•Network Security Groups (NSGs)

•Azure Bastion

•Configure your On-premises VPN Client, in this case (Mikrotik ROS7)

# This are the steps for setting up an Azure Virtual Network (VNet) with the mentioned features above:

### 1.	Log in to your Azure portal:

o	You can use the Azure CLI or the Azure Portal web interface. Here’s how you can do it using the Azure CLI:
```css
az login
```  
### 2.	Navigate to Virtual networks and click + Add:

o	In the Azure Portal, go to Virtual networks and click the + Add button.

- Name: Choose a unique name for your VNet.
- Region: Select the Azure region where you want to create the VNet.
- Address space (CIDR block): Define the IP address range for your VNet (e.g., 10.0.0.0/16).
- Subnet ranges: Create subnets within the VNet for different purposes (e.g., WebApp, Database, Admin).  
  	*Example Code (Azure CLI):	
```css
az network vnet create --name "MyVNet" --resource-group "MyResourceGroup" --location eastus --address-prefixes 10.0.0.0/16 --subnet-name "WebAppSubnet" --subnet-prefixes 10.0.1.0/24
```
### 3. Set Up an Azure VPN Gateway:

o	Use the Azure Portal or Azure CLI to create an Azure VPN Gateway.
o	Define the necessary settings, including the on-premises VPN device settings (IP address, shared key, etc.).
	*Example Code (Azure CLI):	
```css
az network vnet-gateway create --name "MyVpnGateway" --resource-group MyResourceGroup --vnet "MyVNet" --public-ip-address "MyPublicIP" --gateway-type Vpn --vpn-type RouteBased --sku VpnGw2
```
### 4. Deploy Test Resources (VMs):


o	For example, deploy a web server VM in the WebApp subnet, a database server in the Database subnet, and an admin server in the Admin subnet.
	*Example Code (Azure CLI):	
```css
az vm create --resource-group "MyResourceGroup" --name WebServer --image UbuntuLTS --admin-username "azureuser" --generate-ssh-keys --vnet-name "MyVNet" --subnet "WebAppSubnet"
```
### 5. Network Security Groups (NSGs):


o	Define inbound and outbound rules to allow only necessary traffic. For instance, allow HTTP/HTTPS traffic to the WebApp subnet and restrict other protocols.
	*Example Code (Azure CLI):	
```css
az network nsg create --resource-group "MyResourceGroup" --name "WebAppNSG"
```
and then
```css
az network nsg rule create --resource-group "MyResourceGroup" --nsg-name "WebAppNSG" --name AllowHTTP --priority 100 --source-address-prefixes '*' --destination-port-ranges 80 --access Allow  --protocol Tcp
```
### 6. Implement Azure Bastion:


o	Azure Bastion provides secure RDP and SSH access to VMs without exposing them to the public internet. Ensure you have an SSH key for added security.

### 7. Configure a Recovery Vault:


o	Configure backup policies for VMs within your VNet. This ensures secure backups and reliable data recovery even if production servers are compromised.

### Remember to replace placeholders like "MyVNet", "MyResourceGroup", and other specific values with your actual configuration.
