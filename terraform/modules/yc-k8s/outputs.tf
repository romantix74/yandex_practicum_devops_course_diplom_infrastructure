output "kube_cluster_id" {
  description = "Kubernetes cluster ID."
  value       = try(yandex_kubernetes_cluster.k8s_zonal_cluster.id, null)
}

output "kube_cluster_status" {
  description = "Kubernetes cluster status."
  value       = try(yandex_kubernetes_cluster.k8s_zonal_cluster.status, null)
}

output "external_v4_address" {
  description = "Connection string to external Kubernetes cluster."
  value       = try(yandex_kubernetes_cluster.k8s_zonal_cluster.master[0].external_v4_address, null)
}

# public ip with kube config download command 
output "external_cluster_cmd" {
  description = <<EOF
    Kubernetes cluster public IP address.
    Use the following command to download kube config and start working with Yandex Managed Kubernetes cluster:
    `$ yc managed-kubernetes cluster get-credentials --id <cluster_id> --external`
    This command will automatically add kube config for your user; after that, you will be able to test it with the
    `kubectl get cluster-info` command.
  EOF
  value       = yandex_kubernetes_cluster.k8s_zonal_cluster.master[0].public_ip ? "yc managed-kubernetes cluster get-credentials --id ${yandex_kubernetes_cluster.k8s_zonal_cluster.id} --external" : null
}


