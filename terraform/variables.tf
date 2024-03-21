variable "cloud_id" {
  type        = string
  description = "cloud ID"
  
  sensitive = true
  nullable = false
} 

variable "folder_id" {
  type        = string
  description = "folder ID, where instance created"

  sensitive = true
  nullable = false
} 

variable "zone" {
  default     = "ru-central1-a"
  type        = string
  description = "Instance availability zone"
  validation {
    condition     = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  sensitive = true
  nullable = false
} 