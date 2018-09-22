# dashing-linechart

## Preview

![LineChart](https://raw.githubusercontent.com/wiki/jorgemorgado/dashing-linechart/linechart.png)

## Description

Simple [Smashing](https://smashing.github.io/)/[Dashing](http://shopify.github.com/dashing)
widget (and associated job) to render line charts. Uses [Chart.js](http://www.chartjs.org/) library.

## Dependencies

Download the latest v2.x.x release of `Chart.bundle.min.js` from
[https://github.com/chartjs/Chart.js/releases](https://github.com/chartjs/Chart.js/releases)
and copy it into `assets/javascripts`. Make sure to remove any older versions
of Chart.js from the `assets/javascripts` folder.

NOTE: `dashing-linechart` is compatible with v2 of Chart.js. If you still
want to use the older version of Chart.js, you need to download the latest v1
of `Chart.min.js` and install [v1.0](https://github.com/jorgemorgado/dashing-linechart/releases/tag/v1.0)
of this widget. Although, remember that older versions are not maintained
anymore.

## Usage

Create the directory `widgets/line_chart` and copy this widget's files
into that folder.

Add the following code on the desired dashboard:

```erb
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="linechart" data-view ="LineChart" data-title="Line Chart" data-moreinfo=""></div>
</li>

```

Create your line chart job `my_linechart_job.rb`:

```ruby
# Note: change this to obtain your chart data from some external source
labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']
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
options = { }

send_event('linechart', { labels: labels, datasets: data, options: options })
```

### Title Position

By default the title will be displayed in the center of the widget. If you
prefer to move it to the top, change the `$title-position` variable on the
SCSS file. Example:

```scss
$title-position:    top;
```

### Margins

You can also adjust the chart's margins: top, left, right and bottom. By
default they are all 0 (pixels) to use the whole available space. But if
needed you can change their value using the `data-` attributes. Example:

```erb
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="linechart" data-view ="LineChart" data-left-margin="5" data-top-margin="10"></div>
</li>
```

If not set, both right and bottom margins will be equal to left and top margins
respectively. This is likely what you want to keep the chart centered within
the widget. If not, set their values also using the `data-` attributes:

```erb
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="linechart" data-view ="LineChart" data-right-margin="10" data-bottom-margin="5"></div>
</li>
```

## Contributors

- [Jorge Morgado](https://github.com/jorgemorgado) (Author)
- [Steve Wells](https://github.com/SteveWells)

## License

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Other Chart.js Widgets

- [Bar Chart](https://github.com/jorgemorgado/dashing-barchart)
- [Bubble Chart](https://github.com/jorgemorgado/dashing-bubblechart)
- [Doughnut Chart](https://github.com/jorgemorgado/dashing-doughnutchart)
- [Pie Chart](https://github.com/jorgemorgado/dashing-piechart)
- [Polar Chart](https://github.com/jorgemorgado/dashing-polarchart)
- [Radar Chart](https://github.com/jorgemorgado/dashing-radarchart)
