from math import sin, pi
from bokeh.layouts import row
from bokeh.models import ColumnDataSource
from bokeh.plotting import figure, curdoc
from timeAxis import TimeAxis

plot_width = 600
plot_height = 300

x = [float(x*0.1*pi) for x in range(0, 16001)]
y = [sin(i/200) for i in x]
source1 = ColumnDataSource(data=dict(x=x, y=y))

tools = "xwheel_zoom,xwheel_pan,reset,save"
plot1 = figure(
    title="Time Tick Axis", title_location="above",
    plot_width=plot_width, plot_height=plot_height, x_axis_type=None,
    tools=tools, active_scroll='xwheel_zoom'
)
plot1.line('x', 'y', source=source1)
plot1.add_layout(TimeAxis(), 'below')

plot2 = figure(
    title="Regular Axis", title_location="above",
    plot_width=plot_width, plot_height=plot_height,
    x_range=plot1.x_range, y_range=plot1.y_range
)
plot2.line('x', 'y', source=source1)

curdoc().add_root(row(plot1, plot2))
