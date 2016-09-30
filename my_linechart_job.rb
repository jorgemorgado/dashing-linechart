source = 'http://some.remote.host/linechart.xml'

labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']

SCHEDULER.every '10s', :first_in => 0 do |job|

  data = [
    {
      label: 'First dataset',
      data: Array.new(labels.length) { rand(40..80) },
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
      borderWidth: 1,
    }, {
      label: 'Second dataset',
      data: Array.new(labels.length) { rand(40..80) },
      backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
      borderWidth: 1,
    }
  ]

  send_event('linechart', { labels: labels, datasets: data })
end
