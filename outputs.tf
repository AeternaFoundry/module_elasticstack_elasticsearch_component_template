output "elasticsearch_component_templates_id" {
  description = "Map of id values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no id are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "elasticsearch_component_templates_elasticsearch_connection" {
  description = "Map of elasticsearch_connection values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no elasticsearch_connection are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.elasticsearch_connection if v.elasticsearch_connection != null && length(v.elasticsearch_connection) > 0 }
  sensitive   = true
}
output "elasticsearch_component_templates_metadata" {
  description = "Map of metadata values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no metadata are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "elasticsearch_component_templates_name" {
  description = "Map of name values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no name are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "elasticsearch_component_templates_template" {
  description = "Map of template values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no template are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.template if v.template != null && length(v.template) > 0 }
}
output "elasticsearch_component_templates_version" {
  description = "Map of version values across all elasticsearch_component_templates, keyed the same as var.elasticsearch_component_templates except keys with no version are omitted"
  value       = { for k, v in elasticstack_elasticsearch_component_template.elasticsearch_component_templates : k => v.version if v.version != null }
}

