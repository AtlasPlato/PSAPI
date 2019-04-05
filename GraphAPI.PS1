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
atlasplato page ID -1587144278192439
DTE - 180135068711676
#>

$page_access_token = "EAAJCFUZAvPngBAAXLidXKyaaqgh6qWJXf2yY9NEaoIO2aVtA2yHQmX2ZAThkVf7A9K3mlWLRR76KSOsUp337ZCRatVjEonoX91rfgLWR0mhPErDQaM41LZAZCvFAzYktMbqLJXdBEtsJyoqy4ICnxZCx4gtrxDcAwS52rWL3AlA9ErJcRHEiwn2HZCV3RuBHZBAZD"
$object_id ="180135068711676"
$API_URL = "https://graph.facebook.com/v3.2/"
$endpoint = "/insights"
$metric = "/page_engaged_users/days_28"


$insights_url = $API_URL + $object_id + $endpoint + $metric + '?access_token=' + $page_access_token
$Insights_data = Invoke-RestMethod -Uri $insights_url 

$Insights_data | ConvertTo-Json -depth 100 | Out-File "C:\Users\gulld\Desktop\KCCInsights.json"

