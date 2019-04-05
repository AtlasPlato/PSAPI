<#
This powershell script when run will generate a permanent PAT token for the facebook app that pulls insights.

-------------app details------------------------
client_id - get from the developer.facebook.com page when you create an application - currently using my own for testing
client_Secret - get from the developer.facebook.com page when you create an application - currently using my own for testing
fb_exchange_token - the short lived token, able to be generated from the graph API explorer at https://developers.facebook.com/tools/explorer

#>


$client_id = "635609096863352"
$client_secret = "9467841693a6a14b2f87a0f88c0cc66b"
$fb_exchange_token= "EAAJCFUZAvPngBAAdmcYvDQ09e5Rs1hswm0UAF8PNv0i9HZC5tXlDn5CZBIeoTrD13aZBkCiFiqvKOVrX7xzy16mvHCEqMpOcDuBaFfrR2hJinfmNSzZA0YZAhE3H1rxiy8UOwZAXvRnwZBCXUZBLHvlPQtZBjnFRhbonEfZAAAwZBv1bP3CV8KGO2cKS74moaxy9Ams5KCSUO26fbZA7I8KpWOilz"
$API_URL = "https://graph.facebook.com/v3.2/"

$long_term_token_url = $API_URL + 'oauth/access_token?grant_type=fb_exchange_token&client_id='+ $client_id + '&client_secret=' + $client_secret + '&fb_exchange_token=' + $fb_exchange_token
$user_id_url = $API_URL + '/me?access_token='

## Generate me a long lived token!
# 1 - Generate long-lived Access Token
$long_term_token_response = Invoke-RestMethod -uri $long_term_token_url
$lttr_access_token = $long_term_token_response.access_token
$user_id_url = $API_URL + '/me?access_token=' + $lttr_access_token

# 2 - Get User ID
$user_id_response = Invoke-RestMethod -Uri $user_id_url
$user_id = $user_id_response.id
$user_id
$permanent_PAT_Response_url = $API_URL + '/' + $user_id + '/accounts?access_token=' + $lttr_access_token

# 3- Get Permanent Page Access Token
$permanent_PAT_response = Invoke-RestMethod -uri $permanent_PAT_Response_url
$permanent_pat_token = $permanent_PAT_response.data
$permanent_pat_token