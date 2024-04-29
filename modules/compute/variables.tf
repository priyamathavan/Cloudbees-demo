variable "instance_type" {
  type    = map
  default = {
    dev  = "t2.nano"
    prod = "t2.nano"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "allocated_storage" {
  description = "Allocated storage size RDS"
  type        = number
  default     = 10
}

variable "engine" {
  description = "Database Engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "Database instance class or type"
  type        = string
  default     = "db.t3.micro"
}

variable "identifier" {
  description = "Name of RDS Instance"
  type        = string
  default     = "mysql-cloudbees"
}

variable "username" {
  description = "Database username"
  type        = string
  default     = "admin"
}


variable "skip_final_snapshot" {
  description = "Skip final Snapshot"
  type        = bool
  default     = true   #This is good when you are working in development environment, adjust as per your need.
}

