output "kube_cluster_id" {
  description = "Kubernetes cluster ID."
  value       = try(yandex_kubernetes_cluster.k8s_zonal_cluster.id, null)
}

# output "kube_cluster_name" {
#   description = "Kubernetes cluster name."
#   value       = try(k8s_zonal_cluster.cluster_name, null)
# }

output "external_v4_address" {
  description = "Connection string to external Kubernetes cluster."
  value       = try(yandex_kubernetes_cluster.k8s_zonal_cluster.master[0].external_v4_address, null)
}

# output "kube_cluster_id" {
#   description = "Kubernetes cluster ID."
#   value       = try(module.kube.cluster_id, null)
# }

# output "kube_cluster_name" {
#   description = "Kubernetes cluster name."
#   value       = try(module.kube.cluster_name, null)
# }

# output "external_cluster_cmd_str" {
#   description = "Connection string to external Kubernetes cluster."
#   value       = try(module.kube.external_cluster_cmd, null)
# }

