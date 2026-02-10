
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


## Auto Create a run
```shell
# auto create with an existing test (by test-id)
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs/auto_create.json \
-d '{"data": {"type": "instances", "attributes": {"set-id": 1234, "test-id": 5678, "exit-code": 0, "automated-execution-output": "All tests passed"}}}'

# auto create with a test name (finds existing or creates new)
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs/auto_create.json \
-d '{"data": {"type": "instances", "attributes": {"set-id": 1234, "exit-code": 0}, "test-attributes": {"name": "Login Test"}}}'

# auto create with test params (creates a new test with additional attributes)
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs/auto_create.json \
-d '{"data": {"type": "instances", "attributes": {"set-id": 1234, "exit-code": 0}, "test-attributes": {"name": "New Login Test", "test-type": "ApiTest", "description": "Verify login functionality"}}}'

# auto create with steps
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/runs/auto_create.json \
-d '{"data": {"type": "instances", "attributes": {"set-id": 1234}, "test-attributes": {"name": "Login Test"}, "steps": {"data": [{"name": "step one", "expected-results": "result", "status": "PASSED"}, {"name": "step two", "expected-results": "result2", "status": "FAILED"}]}}}'

```

> This command returns JSON structured like below:

```json
{
  "data": {
    "id": "49700",
    "type": "runs",
    "attributes": {
      "project-id": 4566,
      "status": "PASSED",
      "tester-id": 5380,
      "instance-id": 98142,
      "preconditions": null,
      "version": null,
      "test-id": 80893,
      "run-type": "AutomatedRun",
      "custom-fields": {},
      "automated-execution-output": "All tests passed",
      "run-duration": "00:00:00",
      "created-at": "2017-03-07T12:10:42+02:00",
      "updated-at": "2017-03-07T12:10:42+02:00"
    }
  },
  "meta": {
    "created-test": 80893,
    "created-instance": 98142
  }
}
```

This endpoint automatically finds or creates the necessary test and instance, then executes a run. It simplifies the process of uploading test results by handling test and instance lookup/creation in a single request.

<aside class="notice">The `meta` section in the response indicates which entities were created during the request. `created-test` appears only if a new test was created, and `created-instance` appears only if a new instance was created.</aside>

### How it works

1. **Test lookup**: If `test-id` is provided, it looks up the test by ID. Otherwise, it searches for an existing test by the `name` provided in `test-attributes`.
2. **Test creation**: If no matching test is found, a new test is created using the fields in `test-attributes`. Requires `tests_editor` PAT permission.
3. **Instance lookup**: Looks for an existing instance of the test in the specified test set.
4. **Instance creation**: If no instance exists, one is created automatically. Requires `instances_editor` PAT permission.
5. **Run execution**: A run is executed on the instance with the provided attributes, steps, and files.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/runs/auto_create.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/set-id | TestSet id (not display-id) where the run will be executed | true |
data/attributes/test-id | Test id (not display-id) to run. If not provided, the test is looked up by name from test-attributes | false (either test-id or test-attributes/name is required) |
data/attributes/exit-code | 0 for passed, otherwise failed | false |
data/attributes/run-type | AutomatedRun, ManualRun (default is AutomatedRun) | false |
data/attributes/run-date | date field of run-date - ManualRun only | false |
data/attributes/tester-id | tester user-id - ManualRun only | true for ManualRun (unless using PAT) |
data/attributes/run-duration | (HH:MM:SS), to update the run duration | false |
data/attributes/automated-execution-output | text output string for 'Execution output' field (up to 255 characters) - AutomatedRun only | false |
data/attributes/version | string of Run version | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/test-attributes/name | Test name - used to find an existing test or create a new one | true (unless test-id is provided) |
data/test-attributes/test-type | Test type for creation (e.g., ApiTest, ScriptedTest, BDDTest). Default is ApiTest | false |
data/test-attributes/description | Test description (used when creating a new test) | false |
data/test-attributes/preconditions | Test preconditions (used when creating a new test) | false |
data/test-attributes/status | Test status (used when creating a new test) | false |
data/test-attributes/priority | Test priority (used when creating a new test) | false |
data/test-attributes/version | Test version (used when creating a new test) | false |
data/test-attributes/tags | Test tags (used when creating a new test) | false |
data/test-attributes/custom-fields | a hash of custom-fields for the test (used when creating a new test) | false |
data/test-attributes/scenario | BDD scenario text (used when creating a BDDTest) | false |
data/test-attributes/duration-estimate | (HH:MM:SS) estimated duration (used when creating a new test) | false |
data/test-attributes/folder-id | folder id for the test (used when creating a new test) | false |
data/test-attributes/steps* | an array of test step definitions (used when creating a new test) | false |
data/steps/data** | an array of run steps that override the exit code | false |
data/files/data*** | an array of files | false |

\* Test steps (for test creation) include: name, description, expected-results, position.

** Run steps include: name, description, expected-results, actual-results, status.
Status can be one of the following: PASSED, FAILED, BLOCKED, NO RUN, N/A.
When using steps, the exit-code is ignored, and it calculates it according to the steps status.

*** Files would be as attachments in your automated test runs. It's a json hash that has two attributes: filename, and content_encoded.
We expect to get the file content encoded as BASE64.

### PAT Support
Supported - if the user has the `runs` permission. Additionally, `tests_editor` permission is required if a new test needs to be created, and `instances_editor` permission is required if a new instance needs to be created.
