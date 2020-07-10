# dependencies
#Requires -Modules @{ModuleName='AWS.Tools.Common';ModuleVersion='4.0.6.0'}
#Requires -Modules @{ModuleName='AWS.Tools.Lambda';ModuleVersion='4.0.6.0'}
#Requires -Modules @{ModuleName='AWS.Tools.S3';ModuleVersion='4.0.6.0'}

# variables from environment
$format=$env:format
$table=$env:table
$username=$env:username
$password=$env:password
$s3bucket=$env:s3bucket
$s3key=$env:s3key

# build the url
$baseurl="https://www-genesis.destatis.de/genesisWS/rest/2020"
$service="data"
$method="tablefile"
$url="$($baseurl)/$($service)/$($method)?username=$username&password=$password&name=$table&format=$format"

# request
$response=Invoke-RestMethod -Method 'Get' -Uri $url

# upload to S3
Write-S3Object -BucketName $s3bucket -Key $s3key -Content $response
