source = 'http://some.remote.host/linechart.xml'

labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

SCHEDULER.every '10s', :first_in => 0 do |job|

  send_event('linechart', {
    labels: labels,
    datasets: [
      {
        label: 'My First dataset',
        fillColor: 'rgba(220,220,220,0.5)',
        strokeColor: 'rgba(220,220,220,0.8)',
        highlightFill: 'rgba(220,220,220,0.75)',
        highlightStroke: 'rgba(220,220,220,1)',
        data: Array.new(labels.length) { rand(40..80) },
      }, {
        label: 'My Second dataset',
        fillColor: 'rgba(151,187,205,0.5)',
        strokeColor: 'rgba(151,187,205,0.8)',
        highlightFill: 'rgba(151,187,205,0.75)',
        highlightStroke: 'rgba(151,187,205,1)',
        data: Array.new(labels.length) { rand(40..80) },
      }
    ]
  })
end
