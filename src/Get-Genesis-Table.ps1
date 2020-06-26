param ($table, $file, $cred, $format='ffcsv')
if ($file -eq $null) {
$file = ".\$($table).csv" 
}
if ($cred -eq $null) {
    $cred = ".\genesis-credentials.json" 
}
$cred = Get-Content .\genesis-credentials.json | ConvertFrom-Json
$baseurl="https://www-genesis.destatis.de/genesisWS/rest/2020"
$service="data"
$method="tablefile"
$username=$cred.username
$password=$cred.password
$url="$($baseurl)/$($service)/$($method)?username=$username&password=$password&name=$table&format=$format"
Invoke-RestMethod -Method 'Get' -Uri $url -OutFile $file