output "webapp_url" {
    value = "https://${azurerm_linux_web_app.example.default_hostname}"
}

output "web_app_outbound_ips" {
    value = join(",", azurerm_linux_web_app.example.outbound_ip_address_list)
}

output "web_app_publish_user" {
    value = azurerm_linux_web_app.example.site_credential[0].name
    sensitive = true
}