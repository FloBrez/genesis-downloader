param (
[string]$table, 
[string]$file, 
[string]$cred='.\destatis-credentials.json', 
[string]$format='ffcsv',
[Parameter(Mandatory=$false)]
[switch]$promptCredentials,
[Parameter(Mandatory=$false)]
[switch]$saveCredentials
)
if ($file -eq $null) {
    $file = ".\$($table).csv" 
}

# credentials
if($promptCredentials -or $saveCredentials -or (-not (Test-Path $cred))){
    $username=Read-Host -Prompt 'Enter your DESTATIS user name'
    $password=Read-Host -Prompt 'Enter your DESTATIS password'
    if($saveCredentials){
        @{username=$username;password=$password} | ConvertTo-Json | Out-File $cred
        Exit
    }
} else {
    $cred = Get-Content $cred | ConvertFrom-Json
    $username=$cred.username
    $password=$cred.password
}

# request
$baseurl="https://www-genesis.destatis.de/genesisWS/rest/2020"
$service="data"
$method="tablefile"
$url="$($baseurl)/$($service)/$($method)?username=$username&password=$password&name=$table&format=$format"
Invoke-RestMethod -Method 'Get' -Uri $url -OutFile $file