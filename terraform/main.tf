module "kube" {
  source     = "github.com/terraform-yc-modules/terraform-yc-kubernetes"
  network_id = "enp7p03l1cc21o48mvs4"

  master_locations   = [
    {
      zone      = "ru-central1-a"
      subnet_id = "e9bndk5h1io4rvpsieju"
    },
    {
      zone      = "ru-central1-b" 
      subnet_id = "e2ltfqv26ioehhd6thkl"
    },
    {
      zone      = "ru-central1-d" 
      subnet_id = "fl8asj5k87t7b2q71u25"
    }
  ]

  master_maintenance_windows = [
    {
      day        = "monday"
      start_time = "23:00"
      duration   = "3h"
    }
  ]

  node_groups = {
    "yc-k8s-ng-01" = {
      description  = "Kubernetes nodes group 01"
      fixed_scale   = {
        size = 3
      }
      node_labels   = {
        role        = "worker-01"
        environment = "testing"
      }
    },
    "yc-k8s-ng-02"  = {
      description   = "Kubernetes nodes group 02"
      auto_scale    = {
        min         = 2
        max         = 4
        initial     = 2
      }
      # node_locations   = [
      #   {
      #     zone      = "ru-central1-b"
      #     subnet_id = "e2ltfqv26ioehhd6thkl"
      #   }
      # ]
      node_labels   = {
        role        = "worker-02"
        environment = "dev"
      }
      max_expansion   = 1
      max_unavailable = 1
    }
  }
}
