class ChartsController < ApplicationController
   def index
    @g_chart1 = Chart.g_chart1

    @g_chart2 = Chart.g_chart2

    @pie_chart = Chart.pie_chart

    # @line_labels_chart = Chart.line_labels_chart
    @spline_chart = Chart.spline_chart
   end


end
