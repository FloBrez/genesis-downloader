# PowerShell script file to be executed as a AWS Lambda function. 
# 
# When executing in Lambda the following variables will be predefined.
#   $LambdaInput - A PSObject that contains the Lambda function input data.
#   $LambdaContext - An Amazon.Lambda.Core.ILambdaContext object that contains information about the currently running Lambda environment.
#
# The last item in the PowerShell pipeline will be returned as the result of the Lambda function.
#
# To include PowerShell modules with your Lambda function, like the AWS.Tools.S3 module, add a "#Requires" statement
# indicating the module and version. If using an AWS.Tools.* module the AWS.Tools.Common module is also required.

#Requires -Modules @{ModuleName='AWS.Tools.Common';ModuleVersion='4.0.6.0'}
#Requires -Modules @{ModuleName='AWS.Tools.Lambda';ModuleVersion='4.0.6.0'}
<<<<<<< HEAD
#Requires -Modules @{ModuleName='AWS.Tools.S3';ModuleVersion='4.0.6.0'}

$format=$env:format
$table=$env:table
$username=$env:username
$password=$env:password

# request
$file="$($table).csv" 
=======


$username="DEH4E2B8WT"
$password="WdyKa6ZYyVSp89Y"
$format="ffcsv"
$table="12411-0001"

# request
>>>>>>> e5a048037d3aa1acaf8cd0915016350e867b89eb
$baseurl="https://www-genesis.destatis.de/genesisWS/rest/2020"
$service="data"
$method="tablefile"
$url="$($baseurl)/$($service)/$($method)?username=$username&password=$password&name=$table&format=$format"
<<<<<<< HEAD
$response=Invoke-RestMethod -Method 'Get' -Uri $url
Write-S3Object -BucketName "data-destatis" -Key $file -Content $response
=======
Invoke-RestMethod -Method 'Get' -Uri $url -OutFile $file
>>>>>>> e5a048037d3aa1acaf8cd0915016350e867b89eb
