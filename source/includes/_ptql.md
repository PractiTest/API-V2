# PTQL — PractiTest Query Language (Beta)

> **Beta:** PTQL is currently in beta. The core syntax is stable, but minor changes may occur before the final release.

PTQL lets you filter entities (tests, requirements, issues, test sets, and runs) using a human-readable query syntax in the API.

Read the full [PTQL documentation here](https://www.practitest.com/help/data-management-and-analysis/ptql/).

## API Usage

```bash
# Find open, high-priority tests
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/tests.json" \
  --data-urlencode 'ptql=Status = "Open" AND Priority = "High"'

# Find issues assigned to the current user
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/issues.json" \
  --data-urlencode "ptql='Assigned To' = CURRENT_USER"

# Find requirements linked to failed tests
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/requirements.json" \
  --data-urlencode 'ptql=LINKED TO Test WHERE (Status = "Failed")'

# Find requirements linked to active milestones
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/requirements.json" \
  --data-urlencode 'ptql=LINKED TO Milestone WHERE (Status = "Active")'

# Find issues matching a saved view, with additional conditions
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/issues.json" \
  --data-urlencode 'ptql=VIEW "High Priority" AND Status = "Open"'

# Find issues matching a child view
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/issues.json" \
  --data-urlencode 'ptql=VIEW "All Bugs" / "Sprint 1"'

# Find issues matching a view by ID
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/issues.json" \
  --data-urlencode 'ptql=VIEW #42 AND updated_at IN LAST 7 days'
```

Pass the `ptql` query as the `ptql` parameter on entity listing endpoints.

Use `--data-urlencode` in curl to handle URL encoding automatically.

<aside class="notice">
  PTQL API is available for Corporate accounts only
</aside>


## Filtering Runs

```bash
# Find runs belonging to test sets that have tests not linked to any requirement
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/runs.json" \
  --data-urlencode 'ptql=LINKED TO Test WHERE (NOT (LINKED TO Requirement WHERE (Status IS NOT EMPTY)))'
```

For runs, the PTQL query filters **test sets** — runs belonging to matching test sets are returned. On the runs endpoint, `ptql` cannot be combined with `set-filter-id`.

## Filtering Instances

```bash
# Find instances in test sets linked to active milestones
curl -H "PTToken: YOUR_TOKEN" -G \
  "https://api.practitest.com/api/v2/projects/123/instances.json" \
  --data-urlencode 'ptql=LINKED TO Milestone WHERE (Status = "Active")'
```

Like runs, the PTQL query on the instances endpoint filters **test sets** — instances belonging to matching test sets are returned. On the instances endpoint, `ptql` cannot be combined with `set-filter-id`.

## Parameter Conflicts

The `ptql` parameter cannot be combined with:

- Tests, requirements, issues, test sets: `filter-id`, `autofilter-value`, `sub-autofilter-value`

- Runs, instances: `set-filter-id`
