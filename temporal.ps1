$user = 'admin'
$pass = 'owlvey'
$pair = "$($user):$($pass)"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"

$headers = @{
    Authorization = $basicAuthValue
}

$dashboard = @{
    "title"="Dyantrace Data Raw";
    "timezone"= "browser";
    "refresh"= "25s";    
} 
    
$params = @{
    "dashboard"=$dashboard
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri http://localhost:3000/api/dashboards/db -Method POST -Body $params -ContentType "application/json" -Headers $headers

Write-Host $response

#Write-Host $response.key 

$key = ConvertTo-SecureString $key -AsPlainText -Force


$datasource = @{    
    "name"= "MySQL2";
    "type"= "mysql";    
    "access"= "proxy";
    "url"= "192.168.18.10:3306";
    "password"= "thefalcon123";
    "user"= "root";
    "database"= "owlveydb";  
    "isDefault"= $true;  
} | ConvertTo-Json

$response = Invoke-WebRequest -Uri http://localhost:3000/api/datasources -Method POST -ContentType "application/json" -Body $datasource -Authentication "Bearer" -Token $key -AllowUnencryptedAuthentication 
Write-Host $response 

$response = Invoke-WebRequest -Uri http://localhost:3000/api/datasources -Method GET -Authentication "Bearer" -Token $key -AllowUnencryptedAuthentication 
Write-Host ($response | ConvertFrom-Json)


docker exec -it owlvey-grafana grafana-cli plugins install digrich-bubblechart-panel
docker exec -it owlvey-grafana grafana-cli plugins install marcusolsson-calendar-panel
docker exec -it owlvey-grafana grafana-cli plugins install neocat-cal-heatmap-panel
docker exec -it owlvey-grafana grafana-cli plugins install jdbranham-diagram-panel
docker exec -it owlvey-grafana grafana-cli plugins install grafana-polystat-panel
docker exec -it owlvey-grafana grafana-cli plugins install marcusolsson-hourly-heatmap-panel
docker exec -it owlvey-grafana grafana-cli plugins install savantly-heatmap-panel
docker exec -it owlvey-grafana grafana-cli plugins install snuids-radar-panel
docker exec -it owlvey-grafana grafana-cli plugins install snuids-trafficlights-panel
docker exec -it owlvey-grafana grafana-cli plugins install marcusolsson-treemap-panel
docker exec -it owlvey-grafana grafana-cli plugins install magnesium-wordcloud-panel
docker exec -it owlvey-grafana grafana-cli plugins install agenty-flowcharting-panel
docker exec -it owlvey-grafana grafana-cli plugins install novatec-sdg-panel
docker exec -it owlvey-grafana grafana-cli plugins install vonage-status-panel
docker exec -it owlvey-grafana grafana-cli plugins install marcusolsson-hexmap-panel

