class Dashing.LineChart extends Dashing.Widget

  ready: ->
    # Margins: zero if not set or the same as the opposite margin
    # (you likely want this to keep the chart centered within the widget)
    left = @get('leftMargin') || 0
    right = @get('rightMargin') || left
    top = @get('topMargin') || 0
    bottom = @get('bottomMargin') || top

    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1) - left - right
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey")) - 35 - top - bottom

    # Lower the chart's height to make space for moreinfo if not empty
    if !!@get('moreinfo')
      height -= 20

    $holder = $("<div class='canvas-holder' style='left:#{left}px; top:#{top}px; position:absolute;'></div>")
    $(@node).append $holder

    canvas = $(@node).find('.canvas-holder')
    canvas.append("<canvas width=\"#{width}\" height=\"#{height}\" class=\"chart-area\"/>")

    @ctx = $(@node).find('.chart-area')[0].getContext('2d')
    @myData = {
      labels: @get('labels')
      datasets: @get('datasets')
    }

    @myChart = new Chart(@ctx).Line(@myData, $.extend({
      responsive: false
      datasetStroke: true
    }, @get('options')))

  onData: (data) ->
    # Load new values, ie,
    #   @myChart.datasets[0].points[0].value = data.datasets[0].data[0]
    #   @myChart.datasets[0].points[1].value = data.datasets[0].data[1]
    #   ...
    #   @myChart.datasets[1].points[0].value = data.datasets[1].data[0]
    #   ...
    if @myChart && data.datasets
      for i in [0..@myChart.datasets.length - 1]
        for j in [0..@myChart.datasets[i].points.length - 1]
          @myChart.datasets[i].points[j].value = data.datasets[i].data[j]

      @myChart.update()
