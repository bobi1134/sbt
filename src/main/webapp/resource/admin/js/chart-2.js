 // 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('chart-2'));

// 指定图表的配置项和数据
var option = {
    title: {
        text: '用户数量图'
    },
    tooltip: {},            
    xAxis: {
        data: ["2010","2011","2012","2013","2014", "2015", "2016"]
    },
    yAxis: {},
    series: [{
        name: '用户数量',
        type: 'bar',
        data: [50, 200, 360, 1000, 1200, 1600, 2000]
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);