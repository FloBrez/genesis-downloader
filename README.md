# GENESIS Downloader

A set of Powershell scripts that simplify downloading data from GENESIS, the German Federal Statistical Office's database. The scripts are available in `src` folder.

## Usage

### Table Download via Get-Genesis-Table.ps1
1. `-table`: the code for the table you want to download, which has the format "XXXXX-XXXX" in DESTATIS`s GENESIS database. Put the code in double-quotes.
2. `-file` (optional): the filename of the output file. The default uses the table code "XXXXX-XXXX.csv" in your current directory.
3. `-cred` (optional): the filename of your credentials file. The default assumes "destatis-credentials.json" in your current directory.
4. `-promptCredentials` (optional): instead of using stored credentials, you can choose to provide them interactively.
4. `-saveCredentials` (optional): a method that prompts for credentials and stores them in the provided `cred` destination. No data will be downloaded.
4. `-format` (optional): the file format of the output file. The default uses the tidy `ffcsv` format. Other options are `csv`,  `datencsv`, `xlsx` and `html`.

## Binaries
.exe binaries are available, e.g. Get-Genesis-Table.ps1 is converted to destatis-downloader, see [my blog post](http://sweet-mustard-compiler.s3-website.eu-central-1.amazonaws.com/2020/06/26/destatis-windows-downloader/).