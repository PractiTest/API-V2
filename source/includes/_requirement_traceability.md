# Requirement traceability

## GET all tests linked to a specific requirement

This endpoint retrieves all tests linked to a specific requirement

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

### PAT Support
Supported - if the user has the permissions to view Requirements


## Replace linked tests for a specific requirement
```shell
# Some request examples:

# Replace tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```

This endpoint replaces linked tests for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements

## Link tests to a specific requirement
```shell
# Some request examples:

# Add tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```

This endpoint links tests to a specific requirement

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Delete linked tests for a specific requirement
```shell
# Some request examples:

# Remove tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/tests.json \
-d '{"data": [{ "id": TEST_ID, "type": "tests" },{ "id": ANOTHER_TEST_ID, "type": "tests" }]}'

```
This endpoint removes linked tests for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/tests.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## GET all test sets linked to a specific requirement

This endpoint retrieves all test sets linked to a specific requirement

Each linked test set is returned with its `id`, `type` ("sets"), `name` and `run_status`.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/sets.json`

### PAT Support
Supported - if the user has the permissions to view Requirements


## Replace linked test sets for a specific requirement
```shell
# Some request examples:

# Replace test sets linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/sets.json \
-d '{"data": [{ "id": SET_ID, "type": "sets" },{ "id": ANOTHER_SET_ID, "type": "sets" }]}'

```

This endpoint replaces linked test sets for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/sets.json`

You can find at the right area an example of the JSON request and response

A requirement can have at most 10 linked test sets. A request that would exceed this limit links nothing and returns a 422 error.

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Link test sets to a specific requirement
```shell
# Some request examples:

# Add test sets linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/sets.json \
-d '{"data": [{ "id": SET_ID, "type": "sets" },{ "id": ANOTHER_SET_ID, "type": "sets" }]}'

```

This endpoint links test sets to a specific requirement

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/sets.json`

You can find at the right area an example of the JSON request and response

A requirement can have at most 10 linked test sets. A request that would exceed this limit links nothing and returns a 422 error.

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Delete linked test sets for a specific requirement
```shell
# Some request examples:

# Remove test sets linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/sets.json \
-d '{"data": [{ "id": SET_ID, "type": "sets" },{ "id": ANOTHER_SET_ID, "type": "sets" }]}'

```
This endpoint removes linked test sets for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/sets.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## GET all issues linked to a specific requirement

This endpoint retrieves all issues linked to a specific requirement

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

### PAT Support
Supported - if the user has the permissions to view Requirements


## Replace linked issues for a specific requirement
```shell
# Some request examples:

# Replace tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```

This endpoint replaces linked issues for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Link issues to a specific requirement
```shell
# Some request examples:

# Add tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```

This endpoint links issues to a specific requirement

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Delete linked issues for a specific requirement
```shell
# Some request examples:

# Remove tests linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/issues.json \
-d '{"data": [{ "id": ISSUE_ID, "type": "issues" },{ "id": ANOTHER_ISSUE_ID, "type": "issues" }]}'

```

This endpoint removes linked issues for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/issues.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## GET all milestones linked to a specific requirement

This endpoint retrieves all milestones linked to a specific requirement

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/milestones.json`

### PAT Support
Supported - if the user has the permissions to view Requirements


## Replace linked milestones for a specific requirement

```shell
# Request example:

# Replace milestones linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PATCH https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/milestones.json \
-d '{"data": [{ "id": MILESTONE_ID, "type": "milestones" },{ "id": ANOTHER_MILESTONE_ID, "type": "milestones" }]}'

```
This endpoint replaces linked milestones for a specific requirement

### HTTP Request

`PATCH https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/milestones.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Link milestones to a specific requirement

```shell
# Request example:

# Add milestones linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/milestones.json \
-d '{"data": [{ "id": MILESTONE_ID, "type": "milestones" },{ "id": ANOTHER_MILESTONE_ID, "type": "milestones" }]}'

```
This endpoint links milestones to a specific requirement

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/milestones.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements


## Delete linked milestones for a specific requirement

```shell
# Request example:

# Remove milestones linked to the requirement in project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/73365/relationships/milestones.json \
-d '{"data": [{ "id": MILESTONE_ID, "type": "milestones" },{ "id": ANOTHER_MILESTONE_ID, "type": "milestones" }]}'

```
This endpoint removes linked milestones for a specific requirement

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID/relationships/milestones.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Requirements
