output "aks_cluster_name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.myaks.name
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.myrg.name
}

# Output the Kubernetes config file path
output "kube_config_path" {
  description = "Path to the Kubernetes configuration file."
  value       = "Use the Azure CLI to get the Kubernetes config file."
}

# Instructions for users to configure kubectl with the AKS cluster
output "kube_config_instructions" {
  description = "Instructions to get AKS credentials."
  value       = <<EOF
To configure kubectl with your AKS cluster, run the following command:

az aks get-credentials --resource-group ${azurerm_resource_group.myrg.name} --name ${azurerm_kubernetes_cluster.myaks.name}
EOF
}
