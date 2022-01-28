variable "website-domain-main" {
  description = "altaidevops.com"
  type        = string
}

variable "website-domain-redirect" {
  description = "www.altaidevops.com"
  default     = null
  type        = string
}

variable "tags" {
  description = "My web resume"
  default     = {}
  type        = map(string)
}