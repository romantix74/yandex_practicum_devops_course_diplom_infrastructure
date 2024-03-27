module "std-022-024_k8s_cluster" {
    source = "./modules/yc-k8s"
    k8s_version = "1.27"
    cloud_id = var.cloud_id
    folder_id = var.folder_id
    nodes_count = 2
}