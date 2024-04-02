
# Runs

## GET all runs in your project
```shell
# Some request examples:

# Get all runs of project #4566:

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/runs.json

# Get all runs of project #4566, of Test-ids 80895

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/runs.json?test-ids=80895

```

> This command: https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
   "data":[
      {
         "id":"49676",
         "type":"runs",
         "attributes":{
            "project-id":4566,
            "status":"NO RUN",
            "tester-id":5380,
            "instance-id":98016,
            "preconditions": null,
            "version": "2",
            "test-id":80893,
            "run-type":"ManualRun",
            "custom-fields":{
              "---f-47889": "Mac"
            },
            "automated-execution-output":null,
            "run-duration":"00:53:20",
            "created-at":"2017-03-07T11:10:42+02:00",
            "updated-at":"2017-03-07T12:04:44+02:00"
         }
      },
      {
         "id":"49663",
         "type":"runs",
         "attributes":{
            "project-id":4566,
            "status":"NOT COMPLETED",
            "tester-id":5380,
            "instance-id":98016,
            "preconditions": null,
            "version": "1.5",
            "test-id":80893,
            "run-type":"ManualRun",
            "custom-fields":{

            },
            "automated-execution-output":null,
            "run-duration":"00:00:00",
            "created-at":"2017-02-21T13:25:34+02:00",
            "updated-at":"2017-02-21T13:25:34+02:00"
         }
      }
   ],
   "links":{
      "self":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=1&page%5Bsize%5D=2",
      "next":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=2&page%5Bsize%5D=2",
      "last":"https://api.practitest.com/api/v2/projects/4566/runs.json?api_token=xx&developer_email=pt%40gmail.com&page%5Bnumber%5D=41&page%5Bsize%5D=2"
   },
   "meta":{
      "current-page":1,
      "next-page":2,
      "prev-page":null,
      "total-pages":41,
      "total-count":81
   }
}
```

This endpoint retrieves all runs.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
test-ids | filters runs that are related to a certain test_id/ids, separated by comma (NOT display-id!) |
set-ids | filter by TestSets ids, separated by comma (NOT display-id) |
instance-ids | filter by Instances ids, separated by comma (NOT display-id) |
run-type: 'AutomatedRun |ManualRun' | filters run by Run Type: Automated or Manual  |
set-filter-id | the testSet's filter id -> showing runs of TestSets which are in this filter |
set-filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
updated-hours-ago | showing runs that were updated # hours ago |


* None of the parameters are required. You can also combine multiple parameters if needed.
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view runs



## Create a run
```shell
# upload test results with a file attachment
curl -H "Content-Type:application/json" \
   -u test@pt.com:YOUR TOKEN \
   -X POST https://api.practitest.com/api/v2/projects/1/runs.json \
   -d '{"data": { "type": "instances", "attributes": {"instance-id": 3254471, "exit-code": 0 }, "files": {"data": [{"filename": "one.log", "content_encoded": "'"$( base64 /tmp/one.log)"'" }, {"filename": "two.log", "content_encoded": "'"$( base64 /tmp/two.log)"'" }]} }  }'

# upload test results with a file attachment to a specific step
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json \
-d '{"data": {"type": "instances", "attributes": {"instance-id": 124356}, "steps": {"data": [{"name": "step one", "expected-results": "result", "status": "FAILED", "files": {"data":[{"filename": "log.html", "content_encoded": "'"$(base64 /tmp/log.html) "'" }] }}, {"name": "step two", "expected-results": "result2", "status": "PASSED"} ] }}}'


# upload test results with the automated-execution-output
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs.json \
-d '{"data": { "type": "instances", "attributes": {"instance-id": 98142, "exit-code": 0, "automated-execution-output": "THIS IS MY OUTPUT" }}} '

# example with steps
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs.json \
-d '{"data": {"type": "instances", "attributes": {"instance-id": 98142}, "steps": {"data": [{"name": "step one", "expected-results": "result", "status": "FAILED"}, {"name": "step two", "expected-results": "result2", "status": "PASSED"}] }}}'

# example with custom-fields
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X POST https://api.practitest.com/api/v2/projects/4566/runs.json \
-d '{"data": { "type": "instances", "attributes": {"instance-id": 98142, "exit-code": 0, "custom-fields": { "---f-45293": "Win" }}}} '

# example with the double quotes and the backslash
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X POST https://api.practitest.com/api/v2/projects/4566/runs.json \
-d "{\"data\": { \"type\": \"instances\", \"attributes\": {\"instance-id\": 13691064, \"exit-code\": 0 }, \"files\": {\"data\": [{\"filename\": \"one.log\", \"content_encoded\": \"$( base64 /tmp/one.log )\" }]} } }"

# example with updating multiple instances with results
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json \
-d '{"data": [{ "type": "instances", "attributes": {"instance-id": 105716, "exit-code": 0, "automated-execution-output": "THIS IS MY OUTPUT"}}, { "type": "instances", "attributes": {"instance-id": 105717, "exit-code": 0, "automated-execution-output": "THIS IS MY OUTPUT"}}]}'


# example for ManualTest run
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs.json \
-d '{"data": {"type": "instances", "attributes": {"instance-id": 98142}, "run-type": "ManualRun", "tester-id": 333, "steps": {"data": [{"name": "step one", "expected-results": "result", "status": "FAILED"}, {"name": "step two", "expected-results": "result2", "status": "PASSED"}] }}}'


```
<!-- preserving old link to work as well (we external links to here) -->

<a id="create-a-run-automated-test"></a>



This endpoint upload new run results to your project.


<aside class="notice">This method can be used for uploading automated Tests results from your CI / Automated Test scripts.</aside>

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/instance-id* | Instance id (not display-id) | true |
data/attributes/exit-code | 0 for passed, otherwise failed | false |
data/attributes/run-type | AutomatedRun, ManualRun (default is AutomatedRun) | false |
data/attributes/run-date |  date field of run-date - ManualRun only | false |
data/attributes/tester-id | tester user-id - used - ManualRun only | true for ManualRun (unless using PAT) |
data/attributes/run-duration | (HH:MM:SS), to update the run duration of a specific instance | false |
data/attributes/automated-execution-output | text output string that will be shown in ‘Execution output’ field (up to 255 characters)  - AutomatedRun only | false |
data/attributes/version | string of Run version | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/steps/data** | an array of steps override the exit code | false |
data/files/data*** | an array of files  | false |
data/steps/data/files/data**** | an array of files | false


* Users can update 20 instances (maximum) with results by sending one request. See a curl example in the dark area to the right.

** Steps array includes steps json hash, with these attributes: name, description, expected-results, actual-results, status.
Status can be one of the following: PASSED, FAILED, BLOCKED, NO RUN, N/A
When using steps, the exit-code is ignored, and it calculates it according to the steps status.

*** Files would be as attachments in your automated test runs. It's a json hash that has two attributes: filename, and content_encoded.
We expect to get the file content encoded as BASE64. See code examples: shell with curl to your right, <a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/ruby/runs.rb" target="blank">Ruby example</a>, <a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/create_run_attachments_v2.py" target="blank">Python version 2 example</a>, <a
href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/python/create_run_attachments_v3.py" target="blank">Python version 3 example</a>, <a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/java/src/main/java/com/practitest/examples/RunWithAttachments.java" target="blank">Java example</a>, <a href="https://github.com/PractiTest/pt-api-examples/blob/master/api.v2/csharp/create_run_attachments.cs" target="blank">C sharp (.Net) example</a>.

**** This parameter allows to attach files to specific step/s.

### PAT Support
Supported - if the user has the permissions to run tests
