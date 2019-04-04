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


atlasplato page ID
1587144278192439

DTE
180135068711676


#>

$access_token = "EAAJCFUZAvPngBAFZC9V7JfiHFHYucrWglCQ0eIMQVRDZCN0BHTjBtlJZCMhVqRTu5Npv0hLDlQuZBHwkhItt9yDFFX6fJSsoAY7ul7uGFyamrj3pLZCLr1LRpCpfV6P7nElrHLRvXKF83f0xk57WQokiCft8UftEwNfIuyc1YuxJwiH2GG5jNoss0aDDdhDXMeeVKZBUOkO9dGdqCJ6wvav"
$object_id ="180135068711676"
$API_URL = "https://graph.facebook.com/v3.2/"
$endpoint = "/insights"
$metric = "/page_engaged_users/days_28"
#$field = 'period'


$url = $API_URL + $object_id +$endpoint + $metric + '?access_token=' + $access_token

$url
#Invoke-RestMethod -Method 'GET'-Uri $url | Format-Table

