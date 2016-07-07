clear 
$StorageAccountName = "[storage_account_name]"
$Key = "[storage_account_key]"
$Context = New-AzureStorageContext -StorageAccountKey $Key -StorageAccountName $StorageAccountName
$CorsRules = (@{
    AllowedHeaders=@("*");
    AllowedOrigins=@("*");
    ExposedHeaders=@("content-length");
    MaxAgeInSeconds=200;
    AllowedMethods=@("Get","Connect", "Head")})
Set-AzureStorageCORSRule -ServiceType Blob -CorsRules $CorsRules -Context $Context
$CORSrule = Get-AzureStorageCORSRule -ServiceType Blob -Context $Context
echo "Current CORS rules: "
echo $CORSrule