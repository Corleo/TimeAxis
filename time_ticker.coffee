AdaptiveTicker = require "models/tickers/adaptive_ticker"
CompositeTicker = require "models/tickers/composite_ticker"

ONE_MILLI = 1e-3
ONE_SECOND = 1.0
ONE_MINUTE = 60.0 * ONE_SECOND
ONE_HOUR = 60 * ONE_MINUTE

# https://github.com/bokeh/bokeh/blob/0.12.3/bokehjs/src/coffee/models/tickers/datetime_ticker.coffee

class TimeTicker extends CompositeTicker.Model
    type: 'TimeTicker'

    @override {
        num_minor_ticks: 5
        tickers: () -> [
            # Sub-seconds.
            new AdaptiveTicker.Model({
                mantissas: [1, 2, 5],
                base: 10,
                min_interval: 1e-9,
                max_interval: 500 * ONE_MILLI,
                num_minor_ticks: 5
            }),

            # Seconds, minutes.
            new AdaptiveTicker.Model({
                mantissas: [1, 2, 5, 10, 15, 20, 30],
                base: 60,
                min_interval: ONE_SECOND,
                max_interval: 30 * ONE_MINUTE,
                num_minor_ticks: 4
            }),

            # Hours.
            new AdaptiveTicker.Model({
                mantissas: [1, 2, 4, 6, 8, 12],
                base: 24.0,
                min_interval: ONE_HOUR,
                max_interval: null,
                num_minor_ticks: 4
            })
        ]
    }

module.exports =
    Model: TimeTicker
