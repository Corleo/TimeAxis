LinearAxis = require "models/axes/axis"
TimeTickFormatter = require "./time_tick_formatter"
TimeTicker = require "./time_ticker"

# https://github.com/bokeh/bokeh/blob/0.12.3/bokehjs/src/coffee/models/axes/datetime_axis.coffee

class TimeAxisView extends LinearAxis.View

class TimeAxis extends LinearAxis.Model
    default_view: TimeAxisView

    type: 'TimeAxis'

    @override {
        ticker:    () -> new TimeTicker.Model()
        formatter: () -> new TimeTickFormatter.Model()
    }

module.exports =
    Model: TimeAxis
    View: TimeAxisView
