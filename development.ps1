docker stop owlvey-grafana
docker rm owlvey-grafana
Start-Sleep 5

#$current_dir = Get-Location

docker build `
--build-arg "GRAFANA_VERSION=latest" `
--build-arg "GF_INSTALL_PLUGINS=digrich-bubblechart-panel,marcusolsson-calendar-panel,neocat-cal-heatmap-panel,jdbranham-diagram-panel,grafana-polystat-panel,marcusolsson-hourly-heatmap-panel,savantly-heatmap-panel,snuids-radar-panel,snuids-trafficlights-panel,marcusolsson-treemap-panel,magnesium-wordcloud-panel,agenty-flowcharting-panel,novatec-sdg-panel,vonage-status-panel,marcusolsson-hexmap-panel,briangann-datatable-panel,briangann-gauge-panel,grafana-piechart-panel" `
-t grafana-owlvey -f Dockerfile .

# -e "GF_INSTALL_PLUGINS=digrich-bubblechart-panel,marcusolsson-hourly-heatmap-panel,marcusolsson-calendar-panel,neocat-cal-heatmap-panel,jdbranham-diagram-panel,snuids-radar-panel,marcusolsson-treemap-panel,marcusolsson-hexmap-panel" `
#--mount type=bind,source="${current_dir}/dashboards",target=/etc/dashboards  `
#--mount type=bind,source="${current_dir}/provisioning",target=/etc/grafana/provisioning  `
docker run --name=owlvey-grafana `
    -e "GF_SECURITY_ADMIN_USER=admin"`
    -e "GF_SECURITY_ADMIN_PASSWORD=owlvey"`
    -e "GF_LOG_LEVEL=error"`
    -p 3000:3000 grafana-owlvey


