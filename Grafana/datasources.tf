resource "grafana_data_source" "prometheus" {
    access_mode         = "proxy"
    basic_auth_enabled  = false
    basic_auth_username = null
    database_name       = null
    is_default          = true
    json_data_encoded   = jsonencode(
        {
            httpMethod = "POST"
        }
    )
    name                = "prometheus"
    org_id              = "1"
    type                = "prometheus"
    uid                 = "cefc2ykjf6iv4f"
    url                 = "http://prometheus:9090"
    username            = null
}