variable "cloud_id" {
  type        = string
  description = "cloud ID"

  sensitive = true
  nullable  = false
}

variable "folder_id" {
  type        = string
  description = "folder ID, where instance created"
  sensitive = true
  nullable  = false
}

variable "network_id" {
  type        = string
  description = "network ID"
  default     = "enp7p03l1cc21o48mvs4"
}


variable "cluster_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Cluster availability zone"
  validation {
    condition     = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.cluster_zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  sensitive = true
  nullable = false
}


variable "v4_cidr_blocks" {
  type        = string
  default     = "192.168.0.0/16"
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "node_memory" {
  type        = number
  default     = 3
}

variable "node_cores" {
  type        = number
  default     = 2
}

variable "node_core_fraction" {
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  type        = string
  default     = "network-hdd"
}

variable "boot_disk_size" {
  type        = number
  default     = 64
}

variable "nodes_count" {
  type        = number
  default     = 3
}

variable "k8s_version" {
  type        = string
  default     = "1.26"
}