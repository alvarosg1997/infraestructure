resource "grafana_dashboard" "node_exporter" {
  folder        = "aefc2xu3avu2oe" 
  org_id        = "0"                         
  config_json   = file("${path.module}/files/dashboards/node_exporter.json") 
}

resource "grafana_dashboard" "blackbox_exporter" {
  folder        = "aefc2xu3avu2oe" 
  org_id        = "0"                     
  config_json   = file("${path.module}/files/dashboards/blackbox_exporter.json") 
}

