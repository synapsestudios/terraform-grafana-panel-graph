# Panel General Settings
variable "title" {
  type        = string
  description = "Title for panel."
  default     = "Graph"
}

variable "description" {
  type        = string
  description = "Text description for panel."
  default     = null
}

variable "grid_position" {
  type        = object({ h = number, w = number, x = number, y = number, })
  description = "Grid Position and size for panel."
  default     = { h = 10, w = 24, x = 0, y = 0, }
}

variable "id" {
  type        = number
  description = "Unique numeric ID for panel."
  default     = 0
}

variable "transparent" {
  type        = bool
  description = "If true, panel will be rendered transparent."
  default     = false
}

# Queries
variable "datasource" {
  type        = string
  description = "Data source for panel."
  default     = "$datasource"
}

variable "alias_colors" {
  type        = map(string)
  description = "Map representing aliasColors override."
  default     = {}
}

variable "queries" {
  type        = list(any)
  description = "List of queries as map objects"
}

variable "interval" {
  type        = string
  description = "Minimum time interval for this data source."
  default     = "30s"
}

# Visualization Display
# Draw Modes
variable "bars" {
  type        = bool
  description = "If true, graph will render bars."
  default     = false
}

variable "lines" {
  type        = bool
  description = "If true, graph will render lines."
  default     = true
}

variable "points" {
  type        = bool
  description = "If true, graph will render pointsÎ."
  default     = false
}

variable "dashes" {
  type        = bool
  description = "If true, graph will render dashes."
  default     = false
}

# Mode Options
variable "fill" {
  type        = number
  description = "Number between 0-10 which controls the fill opacity. 0 is no fill and 10 is solid."
  default     = 10
}

variable "fill_gradient" {
  type        = number
  description = "Number between 0-10 which controls the fill gradiant."
  default     = 10
}

variable "line_width" {
  type        = number
  description = "Number between 0-10 which controls the line width."
  default     = 1
}

variable "staircase" {
  type        = bool
  description = "If true, line graphs will be rendered with staircase/stepped line."
  default     = false
}

variable "point_radius" {
  type        = number
  description = "Number between 0.5-10 which controls the point radius."
  default     = 2
}

variable "dash_length" {
  type        = number
  description = "Number between 0-10 which controls the dash length."
  default     = 2
}

variable "space_length" {
  type        = number
  description = "Number which controls spaceLength property. Unknown effect."
  default     = 10
}

# Stacking and Null Values
variable "stack" {
  type        = bool
  description = "If true, graph will be stacked."
  default     = false
}

variable "percentage" {
  type        = bool
  description = "Used with stacking mode, if true renders stacks as a percentage."
  default     = false
}

variable "null_point_mode" {
  type        = string
  description = "Null point mode can be one of 'connected', 'null', 'null as zero'"
  default     = "connected"
}

# Series Overrides
variable "series_overrides" {
  # type        = list
  description = "List of maps containing time seriies overrides."
  default     = []
}

# Axes
variable "xaxis" {
  type        = object({ show = bool, buckets = number, mode = string, name = string, values = list(string), min = number, max = number })
  description = "An Object representation of the X-Axis."
  default     = { buckets = null, mode = "time", name = null, show = true, values = [], min = null, max = null }
}

variable "yaxis" {
  type        = object({ align = bool, alignLevel = number })
  description = "An Object representation of the Y-Axis."
  default     = { align = false, alignLevel = null }
}

variable "yaxes" {
  type        = list(object({ show = bool, decimals = number, format = string, label = string, logBase = number, min = number, max = number }))
  description = "An Object representation of the Y-Axes"
  default     = [{ show = true, decimals = null, format = "none", label = null, logBase = 1, max = null, min = 0 }, { show = true, decimals = null, format = "s", label = null, logBase = 1, max = null, min = 0 }]
}

# legend
variable "legend" {
  type        = object({ alignAsTable = bool, avg = bool, current = bool, max = bool, min = bool, show = bool, sort = string, sortDesc = bool, total = bool, values = bool })
  description = "Map representing the graphs legend."
  default     = { alignAsTable = true, avg = true, current = true, max = true, min = true, show = true, sort = "current", sortDesc = true, total = false, values = true }
}

