resource "elasticstack_elasticsearch_component_template" "elasticsearch_component_templates" {
  for_each = var.elasticsearch_component_templates

  name     = each.value.name
  metadata = each.value.metadata
  timeouts = each.value.timeouts
  version  = each.value.version

  dynamic "elasticsearch_connection" {
    for_each = each.value.elasticsearch_connection != null ? each.value.elasticsearch_connection : []
    content {
      api_key                  = elasticsearch_connection.value.api_key
      bearer_token             = elasticsearch_connection.value.bearer_token
      ca_data                  = elasticsearch_connection.value.ca_data
      ca_file                  = elasticsearch_connection.value.ca_file
      ca_fingerprint           = elasticsearch_connection.value.ca_fingerprint
      cert_data                = elasticsearch_connection.value.cert_data
      cert_file                = elasticsearch_connection.value.cert_file
      endpoints                = elasticsearch_connection.value.endpoints
      es_client_authentication = elasticsearch_connection.value.es_client_authentication
      headers                  = elasticsearch_connection.value.headers
      insecure                 = elasticsearch_connection.value.insecure
      key_data                 = elasticsearch_connection.value.key_data
      key_file                 = elasticsearch_connection.value.key_file
      password                 = elasticsearch_connection.value.password
      username                 = elasticsearch_connection.value.username
    }
  }

  dynamic "template" {
    for_each = each.value.template != null ? each.value.template : []
    content {
      dynamic "alias" {
        for_each = template.value.alias != null ? template.value.alias : []
        content {
          filter         = alias.value.filter
          index_routing  = alias.value.index_routing
          is_hidden      = alias.value.is_hidden
          is_write_index = alias.value.is_write_index
          name           = alias.value.name
          routing        = alias.value.routing
          search_routing = alias.value.search_routing
        }
      }
      dynamic "data_stream_options" {
        for_each = template.value.data_stream_options != null ? template.value.data_stream_options : []
        content {
          dynamic "failure_store" {
            for_each = data_stream_options.value.failure_store != null ? data_stream_options.value.failure_store : []
            content {
              enabled = failure_store.value.enabled
              dynamic "lifecycle" {
                for_each = failure_store.value.lifecycle != null ? failure_store.value.lifecycle : []
                content {
                  data_retention = lifecycle.value.data_retention
                }
              }
            }
          }
        }
      }
      mappings = template.value.mappings
      settings = template.value.settings
    }
  }
}

