# Users

## GET all users at your account
```shell
    curl -H "Content-Type: application/json" \
     -u YOUR_EMAIL:YOUR_TOKEN  \
    https://api.practitest.com/api/v2/users.json
# IS THE SAME AS:
    curl -H "Content-Type: application/json" \
    https://api.practitest.com/api/v2/users.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN
```

```csharp
string token = "xxx";
string developerEmail = "my@email.address";

var request = WebRequest.Create("https://api.practitest.com/api/v2/users.json");
//request.PreAuthenticate = true;
string authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(developerEmail + ":" + token));
request.Headers["Authorization"] = "Basic " + authInfo;

var response = request.GetResponse();
Console.WriteLine(response.Headers);
```


> This command: https://api.practitest.com/api/v2/users.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "53811",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "chris.z@rd.com",
        "email": "chris.z@rd.com",
        "time-zone": "UTC",
        "created-at": "2016-05-30T16:45:02+03:00"
      }
    },
    {
      "id": "538724",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "monica@gmail.com",
        "email": "monica@gmail.com",
        "time-zone": "UTC",
        "created-at": "2016-06-20T14:35:19+03:00"
      }
    },
    {
      "id": "539467",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "pascal@most.com",
        "email": "pascal@most.com",
        "time-zone": "UTC",
        "created-at": "2016-07-07T17:44:15+03:00"
      }
    },
    {
      "id": "539598",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "phillip.rik@pt.com",
        "email": "phillip.rik@pt.com",
        "time-zone": "UTC",
        "created-at": "2016-07-27T15:08:14+03:00"
      }
    },
    {
      "id": "539976",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "beck735306@pt.com",
        "email": "beck735306@pt.com",
        "time-zone": "UTC",
        "created-at": "2016-08-08T15:05:13+03:00"
      }
    }
  ],
  "links": {},
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 5
  }
}
```

This endpoint retrieves all users.

### HTTP Request

`https://api.practitest.com/api/v2/users.json`

### Query Parameters - [pagination](#pagination)

Here's the examples of the JSON requests and response that you may get when submitting a GET request

### PAT Support
Shows list of users only to projects that a user belongs to.

<aside class="notice">
  Remember, you can see examples in the dark area to the right.
</aside>
