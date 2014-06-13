class Chart < ActiveRecord::Base
  # attr_accessible :title, :body

  class << self

    def g_chart1
      @g_chart1 = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
        f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
        f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
        f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

        f.yAxis [
          {:title => {:text => "GDP in Billions", :margin => 70} },
          {:title => {:text => "Population in Millions"}, :opposite => true},
        ]
        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"column"})
      end
    end

      def g_chart2
        @g_chart2 = LazyHighCharts::HighChart.new('graph') do |f|
          f.title({ :text=>"Combination chart"})
          f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
          f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
          f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
          f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
          f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
          f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
          f.series(:type=> 'pie',:name=> 'Total consumption',
            :data=> [
              {:name=> 'Jane', :y=> 13, :color=> 'red'},
              {:name=> 'John', :y=> 23,:color=> 'green'},
              {:name=> 'Joe', :y=> 19,:color=> 'blue'}
            ],
            :center=> [100, 80], :size=> 100, :showInLegend=> false)
        end
      end


      def line_labels_chart
        @line_labels_chart = LazyHighCharts::HighChart.new('line_labels') do |f|
          f.chart({
             type: 'line'
          })
          f.title({
            text: 'Monthly Average Temperature'
          })
          f.subtitle({
              text: 'Source: WorldClimate.com'
          })
          f.xAxis({
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
          })
          f.yAxis({
             title: { text: 'Temperature (°C)'}
          })
          f.tooltip({
            enabled: false,
            formatter: %|function() {
                                 return '<b>'+ this.series.name +'</b><br/>'+
                                     this.x +': '+ this.y +'°C';
                             }|.js_code

          })
          f.plotOptions({
             line: {
                                 dataLabels: {
                                                         enabled: true
                                                     },
                                 enableMouseTracking: false
                             }
          })

          f.series({
             name: 'Tokyo',
             data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
          })
          f.series({
              name: 'London',
              data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]

          })

        end
      end

      def  pie_chart
        @pie_chart = LazyHighCharts::HighChart.new('pie') do |f|
        f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
          series = {
                   :type=> 'pie',
                   :name=> 'Browser share',
                   :data=> [
                      ['Firefox',   45.0],
                      ['IE',       26.8],
                      {
                         :name=> 'Chrome',
                         :y=> 12.8,
                         :sliced=> true,
                         :selected=> true
                      },
                      ['Safari',    8.5],
                      ['Opera',     6.2],
                      ['Others',   0.7]
                   ]
          }
          f.series(series)
          f.options[:title][:text] = "THA PIE"
          f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
          f.plot_options(:pie=>{
            :allowPointSelect=>true,
            :cursor=>"pointer" ,
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>"13px Trebuchet MS, Verdana, sans-serif"
              }
            }
          })
      end
    end

    def spline_chart
        @spline_chart = LazyHighCharts::HighChart.new('spline_label') do |f|
          f.chart({
             type: 'spline'
          })
          f.title({
            text: 'Monthly Average Temperature'
          })
          f.subtitle({
              text: 'Source: WorldClimate.com'
          })
          f.xAxis({
            type: 'datetime',
            dateTimeLabelFormats: {
                    month: '%e. %b',
                    year: '%b'
          },title: {
                    text: 'Date'
                }
                })
          f.yAxis({
              title: {
                    text: 'Snow depth (m)'
                },
                min: 0
          })
          f.tooltip({
                headerFormat: '<b>{series.name}</b><br>',
                pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'

          })
          f.plotOptions({
             line: {
                                 dataLabels: {
                                                         enabled: true
                                                     },
                                 enableMouseTracking: false
                             }
          })

          f.series({
             name: 'Winter 2007-2008',
             data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
          })
          f.series({
              name: 'London',
              data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]

          })
          f.series({
              name: 'Japan',
              data: [6.9, 8.2, 3.7, 9.5, 16.9, 11.2, 14.0, 15.6, 12.2, 11.3, 8.6, 9.8]

          })

        end
      end

  end
end
