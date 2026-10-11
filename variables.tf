variable "elasticsearch_component_templates" {
  description = <<EOT
Map of elasticsearch_component_templates, attributes below
Required:
    - name
Optional:
    - metadata
    - timeouts
    - version
    - elasticsearch_connection (block):
        - api_key (optional)
        - bearer_token (optional)
        - ca_data (optional)
        - ca_file (optional)
        - ca_fingerprint (optional)
        - cert_data (optional)
        - cert_file (optional)
        - endpoints (optional)
        - es_client_authentication (optional)
        - headers (optional)
        - insecure (optional)
        - key_data (optional)
        - key_file (optional)
        - password (optional)
        - username (optional)
    - template (block):
        - alias (optional, block):
            - filter (optional)
            - index_routing (optional)
            - is_hidden (optional)
            - is_write_index (optional)
            - name (required)
            - routing (optional)
            - search_routing (optional)
        - data_stream_options (optional, block):
            - failure_store (optional, block):
                - enabled (optional)
                - lifecycle (optional, block):
                    - data_retention (optional)
        - mappings (optional)
        - settings (optional)
EOT

  type = map(object({
    name     = string
    metadata = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    version = optional(number)
    elasticsearch_connection = optional(list(object({
      api_key                  = optional(string)
      bearer_token             = optional(string)
      ca_data                  = optional(string)
      ca_file                  = optional(string)
      ca_fingerprint           = optional(string)
      cert_data                = optional(string)
      cert_file                = optional(string)
      endpoints                = optional(list(string))
      es_client_authentication = optional(string)
      headers                  = optional(map(string))
      insecure                 = optional(bool)
      key_data                 = optional(string)
      key_file                 = optional(string)
      password                 = optional(string)
      username                 = optional(string)
    })))
    template = optional(list(object({
      alias = optional(list(object({
        filter         = optional(string)
        index_routing  = optional(string)
        is_hidden      = optional(bool)
        is_write_index = optional(bool)
        name           = string
        routing        = optional(string)
        search_routing = optional(string)
      })))
      data_stream_options = optional(list(object({
        failure_store = optional(list(object({
          enabled = optional(bool)
          lifecycle = optional(list(object({
            data_retention = optional(string)
          })))
        })))
      })))
      mappings = optional(string)
      settings = optional(string)
    })))
  }))
}

