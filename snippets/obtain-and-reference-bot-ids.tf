/*
* This snippet shows you how to obtain bot ids for you to use in your security
* configs without having to reference them by hard coded bot id strings
*/

/*
*  Return a list of all bots
*
* Output will be a list of bot objects as follows:-
* 
* {
*  "bots": [
*    {
*      "addedDate": "2015-08-12",
*      "botId": "3d556ce3-0fb1-4fd1-9467-2a08bc04e890",
*      "botName": "360Spider",
*      "categoryId": "4e14219f-6568-4c9d-9bd8-b29ca2afc422",
*      "description": "http://www.360.cn",
*      "updatedDate": "2024-12-12"
*    },
*    ...
*  ]
* }
*/
data "akamai_botman_akamai_defined_bot" "defined_bots" {
}

/*
* You can also specify a single bot by name
*
* Output will still be a list of bot objects but will only contain one
* element as follows:-
*{
*  "bots": [
*    {
*      "addedDate": "2015-08-12",
*      "botId": "3d556ce3-0fb1-4fd1-9467-2a08bc04e890",
*      "botName": "360Spider",
*      "categoryId": "4e14219f-6568-4c9d-9bd8-b29ca2afc422",
*      "description": "http://www.360.cn",
*      "updatedDate": "2024-12-12"
*    }
*  ]
*}
*/
data "akamai_botman_akamai_defined_bot" "defined_bots" {
  bot_name = "360Spider"
}

/*
* In both cases, you can decode the json and reference as follows:-
*/
output "defined_bots_json" {
  value = jsondecode(data.akamai_botman_akamai_defined_bot.defined_bots.defined_bots_json).bots[0].botId
}
