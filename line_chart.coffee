class Dashing.LineChart extends Dashing.Widget

  ready: ->
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
