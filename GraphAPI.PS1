<#
Simple script that uses the Invoke-RestMethod to Call the Facebook Graph API


Page for reference is :https://www.facebook.com/Knoxcouncil/
Facebook Graph API - https://developers.facebook.com/docs/graph-api/reference/v3.2/insights

The below code constructs the following URI:
https://graph.facebook.com/v3.2/12345/insights/page_engaged_users?access_tokenabcde

Page engagement is the name of the game -
page_engaged_users:
Description: The number of people who engaged with your Page. Engagement includes any click.
Values for 'period' day, week, days_28

-----------------facebook pages = object_id---------------
Knox page - 195935530460725
#>

$page_access_token = "EAAEgKu23i2IBACEa4tNtMZARBfahUL1qtEY2AL9i8k8zuAr0SQT8xNkCClc2wdekNBuf3R9NXhNGePmlDCtfy1VLqLZAn4lZCR4K4052lhc0dkPXCk6Y15za8kxXWZABo2G5lB9LH6ga1TRnAt57ErZB2RgijBhFVtkGzQ8pilhA6KmU2kKQob2BUutO7h54ZD"
$object_id ="195935530460725"
$API_URL = "https://graph.facebook.com/v3.2/"
$endpoint = "/insights"
$metric = "/page_engaged_users/days_28"
$pathToJsonFile = "C:\Users\gulld\Desktop\KCCInsights.json"
$pathToOutputFile = "C:\Users\gulld\Desktop\KCCInsights.csv"

$insights_url = $API_URL + $object_id + $endpoint + $metric + '?access_token=' + $page_access_token
$Insights_data = Invoke-RestMethod -Uri $insights_url 

$Insights_data | ConvertTo-Json -depth 100 | Out-File $pathToJsonFile


#Convert to CSV
((Get-Content -Path $pathToJsonFile) | ConvertFrom-Json).data.values |
    ConvertTo-Csv -NoTypeInformation |
    Set-Content $pathToOutputFile
