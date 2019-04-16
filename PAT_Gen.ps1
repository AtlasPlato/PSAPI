<#
This powershell script when run will generate a permanent PAT token for the facebook app that pulls insights.

-------------app details------------------------
client_id - get from the developer.facebook.com page when you create an application - currently using my own for testing
client_Secret - get from the developer.facebook.com page when you create an application - currently using my own for testing
fb_exchange_token - the short lived token, able to be generated from the graph API explorer at https://developers.facebook.com/tools/explorer

#>


$client_id = "316843725654882"
$client_secret = "24f029669419df99c494aa37698cfb68"
$fb_exchange_token= "EAAEgKu23i2IBAIkxq7Ywl4CX7kUwQrC1EGzKvBg6m9Ag1QZAYZCZCE6LQn1A2NaxQQXzQhywZAE7YChYGvTnXUWXQ8tPORJ7ORtFFDN2tWthrGVBri6JblKu9WOZCnMClcTeZCB36RxH7JHiHPeW2yjFipOFLkPKxXmoAGXdIPqJ2ZAfvoTDc195kuqGTtgaOHMyWlZBNaKYxnZBNx0ZBkXItVKVgRWKC57a1ygxP9l26tb7T8ae8CQ4uaQjGyN7FdWxQZD"
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