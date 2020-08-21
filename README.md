# Grafana Panel Graph
This Terraform module provides a basic template for creating Graph panels for use within a Grafana dash-board.  


Example Usage:
```terraform
###################################################
# AWS ALB Grafana - RequestCount/TargetResponseTime
###################################################
module "grafana_alb_request_response" {
  source = "../grafana-panel-graph/"

  title            = "ALB ${local.name} RequestCount / TargetResponseTime"
  series_overrides = [{ alias = "TargetResponseTime_Average", yaxis = 2 }]
  grid_position    = { h = 5, w = 12, x = 12, y = 0 }
  id               = 1

  queries = [
    {
      refId      = "A"
      region     = local.region
      namespace  = "AWS/ApplicationELB"
      metricName = "RequestCount"
      statistics = ["Sum"]
      dimensions = { LoadBalancer = local.loadbalancer_name }
      period     = "$__interval"
    },
    {
      refId      = "B"
      region     = local.region
      namespace  = "AWS/ApplicationELB"
      metricName = "TargetResponseTime"
      statistics = ["Average"]
      dimensions = { LoadBalancer = local.loadbalancer_name }
      period     = "$__interval"
    }
  ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.6 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| queries | List of queries as map objects | `list(any)` | n/a | yes |
| alias\_colors | Map representing aliasColors override. | `map(string)` | `{}` | no |
| bars | If true, graph will render bars. | `bool` | `false` | no |
| dash\_length | Number between 0-10 which controls the dash length. | `number` | `2` | no |
| dashes | If true, graph will render dashes. | `bool` | `false` | no |
| datasource | Data source for panel. | `string` | `"$datasource"` | no |
| description | Text description for panel. | `string` | `null` | no |
| fill | Number between 0-10 which controls the fill opacity. 0 is no fill and 10 is solid. | `number` | `10` | no |
| fill\_gradient | Number between 0-10 which controls the fill gradiant. | `number` | `10` | no |
| grid\_position | Grid Position and size for panel. | `object({ h = number, w = number, x = number, y = number, })` | <pre>{<br>  "h": 10,<br>  "w": 24,<br>  "x": 0,<br>  "y": 0<br>}</pre> | no |
| id | Unique numeric ID for panel. | `number` | `0` | no |
| interval | Minimum time interval for this data source. | `string` | `"30s"` | no |
| legend | Map representing the graphs legend. | `object({ alignAsTable = bool, avg = bool, current = bool, max = bool, min = bool, show = bool, sort = string, sortDesc = bool, total = bool, values = bool })` | <pre>{<br>  "alignAsTable": true,<br>  "avg": true,<br>  "current": true,<br>  "max": true,<br>  "min": true,<br>  "show": true,<br>  "sort": "current",<br>  "sortDesc": true,<br>  "total": false,<br>  "values": true<br>}</pre> | no |
| line\_width | Number between 0-10 which controls the line width. | `number` | `1` | no |
| lines | If true, graph will render lines. | `bool` | `true` | no |
| null\_point\_mode | Null point mode can be one of 'connected', 'null', 'null as zero' | `string` | `"connected"` | no |
| percentage | Used with stacking mode, if true renders stacks as a percentage. | `bool` | `false` | no |
| point\_radius | Number between 0.5-10 which controls the point radius. | `number` | `2` | no |
| points | If true, graph will render pointsÎ. | `bool` | `false` | no |
| series\_overrides | List of maps containing time seriies overrides. | `list` | `[]` | no |
| space\_length | Number which controls spaceLength property. Unknown effect. | `number` | `10` | no |
| stack | If true, graph will be stacked. | `bool` | `false` | no |
| staircase | If true, line graphs will be rendered with staircase/stepped line. | `bool` | `false` | no |
| title | Title for panel. | `string` | `"Graph"` | no |
| transparent | If true, panel will be rendered transparent. | `bool` | `false` | no |
| xaxis | An Object representation of the X-Axis. | `object({ show = bool, buckets = number, mode = string, name = string, values = list(string), min = number, max = number })` | <pre>{<br>  "buckets": null,<br>  "max": null,<br>  "min": null,<br>  "mode": "time",<br>  "name": null,<br>  "show": true,<br>  "values": []<br>}</pre> | no |
| yaxes | An Object representation of the Y-Axes | `list(object({ show = bool, decimals = number, format = string, label = string, logBase = number, min = number, max = number }))` | <pre>[<br>  {<br>    "decimals": null,<br>    "format": "none",<br>    "label": null,<br>    "logBase": 1,<br>    "max": null,<br>    "min": 0,<br>    "show": true<br>  },<br>  {<br>    "decimals": null,<br>    "format": "s",<br>    "label": null,<br>    "logBase": 1,<br>    "max": null,<br>    "min": 0,<br>    "show": true<br>  }<br>]</pre> | no |
| yaxis | An Object representation of the Y-Axis. | `object({ align = bool, alignLevel = number })` | <pre>{<br>  "align": false,<br>  "alignLevel": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| panel | Map containing panel. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->