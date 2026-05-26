# Milestones

## GET all Milestones in your project
```shell
# Get all milestones of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/milestones.json

# Get all milestones of project #4566 with linked entities:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/milestones.json?relationships=true

# Get milestones with pagination:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
"https://api.practitest.com/api/v2/projects/4566/milestones.json?page[number]=1&page[size]=10"
```

> This command: https://api.practitest.com/api/v2/projects/4566/milestones.json?relationships=true, returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "101",
      "type": "milestones",
      "attributes": {
        "project-id": 4566,
        "display-id": 1,
        "name": "Sprint 1",
        "description": "First sprint of the release",
        "milestone-status": "Active",
        "milestone-type": "Sprint",
        "start-date": "2025-01-01",
        "end-date": "2025-01-14",
        "author-id": 4370,
        "custom-fields": {
          "---f-8282": "High"
        },
        "created-at": "2025-01-01T10:00:00+00:00",
        "updated-at": "2025-01-02T08:30:00+00:00"
      },
      "relationships": {
        "requirements": {
          "data": [{ "id": "45001", "type": "requirements" }]
        },
        "issues": {
          "data": [{ "id": "73365", "type": "issues" }]
        },
        "suites": {
          "data": [{ "id": "9910", "type": "sets" }]
        }
      }
    }
  ],
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 1
  }
}
```
This endpoint retrieves all Milestones in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/milestones.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
relationships | shows entities linked to the milestone (requirements, issues, test sets); set to `true` to include |

* none of the parameters are required.

### PAT Support
Supported - if the user has the permissions to view Milestones


## Show a specific Milestone
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/milestones/101.json

# Show with linked entities:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/milestones/101.json?relationships=true
```

> This command: https://api.practitest.com/api/v2/projects/4566/milestones/101.json, returns JSON structured like below:

```json
{
  "data": {
    "id": "101",
    "type": "milestones",
    "attributes": {
      "project-id": 4566,
      "display-id": 1,
      "name": "Sprint 1",
      "description": "First sprint of the release",
      "milestone-status": "Active",
      "milestone-type": "Sprint",
      "start-date": "2025-01-01",
      "end-date": "2025-01-14",
      "author-id": 4370,
      "custom-fields": {
        "---f-8282": "High"
      },
      "created-at": "2025-01-01T10:00:00+00:00",
      "updated-at": "2025-01-02T08:30:00+00:00"
    }
  }
}
```
This endpoint shows a specific Milestone in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/milestones/YOUR_MILESTONE_ID.json`

Parameters* | Description |
--------- | ------- |
relationships | shows entities linked to the milestone (requirements, issues, test sets); set to `true` to include |

* none of the parameters are required.

### PAT Support
Supported - if the user has the permissions to view Milestones
