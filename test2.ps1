$user = 'admin'
$pass = 'owlvey'
$pair = "$($user):$($pass)"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"

$headers = @{
    Authorization = $basicAuthValue
}

# create user
$params = @{
    "name"="guest";
    "email"="guest@owlvey.com";
    "login"="guest";
    "password"="guest";    
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri http://localhost:3000/api/admin/users -Method POST -Body $params -ContentType "application/json" -Headers $headers

# setup api key
$params = @{
    "name"="owlveyadmin2";
    "role"="Admin";
    "secondsToLive"=86400;
} | ConvertTo-Json
$response = Invoke-RestMethod -Uri http://localhost:3000/api/auth/keys -Method POST -Body $params -ContentType "application/json" -Headers $headers


