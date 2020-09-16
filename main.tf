locals {
  panel = {
    # General Settings
    type        = "graph"
    grid        = {}
    gridPos     = var.grid_position
    id          = var.id
    datasource  = var.datasource
    aliasColors = var.alias_colors
    editable    = true
    error       = false
    isNew       = true
    title       = var.title
    transparent = var.transparent
    description = var.description

    # Draw Modes
    bars        = var.bars
    lines       = var.lines
    points      = var.points
    dashes      = var.dashes
    spaceLength = var.space_length

    # Mode Options
    fill         = var.fill
    fillGradient = var.fill_gradient
    linewidth    = var.line_width
    pointradius  = var.point_radius
    steppedLine  = var.staircase
    dashLength   = var.dash_length

    # Stacking and Null
    stack         = var.stack
    nullPointMode = var.null_point_mode
    percentage    = var.percentage

    # Series overrides
    seriesOverrides = var.series_overrides

    # Axes
    xaxis = var.xaxis
    yaxis = var.yaxis
    yaxes = var.yaxes

    # Legend
    legend = var.legend
    links  = [],

    options = {
      dataLinks = []
    },

    renderer = "flot",



    targets     = var.queries
    interval    = var.interval
    thresholds  = [],
    timeFrom    = null,
    timeRegions = [],
    timeShift   = null,

    tooltip = {
      msResolution = false,
      shared       = true,
      sort         = 0,
      value_type   = "cumulative"
    },


    hiddenSeries = false
  }
}
