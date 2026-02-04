# Step Run traceability

## GET all issues linked to a specific step run

This endpoint retrieves all issues linked to a specific step run

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/step_runs/YOUR_STEP_RUN_ID/relationships/issues.json`

### PAT Support
Supported - if the user has the permissions to view Test Runs

## Replace linked issues for a specific step run

```shell
# Request example:

# Replace issues linked to the step run in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/step_runs/98765/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
This endpoint replaces linked issues for a specific step run

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/step_runs/YOUR_STEP_RUN_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests

## Link issues to a specific step run
```shell
# Request example:

# Add issues linked to the step run in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/step_runs/98765/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```
This endpoint links issues to a specific step run

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/step_runs/YOUR_STEP_RUN_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests


## Delete linked issues for a specific step run
```shell
# Request example:

# Remove issues linked to the step run in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/step_runs/98765/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'
```

This endpoint removes linked issues for a specific step run

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/step_runs/YOUR_STEP_RUN_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests
