var dom = document.getElementById("chart-1");
var myChart = echarts.init(dom);
var app = {};
option = null;
var geoCoordMap = {		
	'北京': [116.4551,40.2539],
	'上海': [121.477362,31.236552],	
	'广州': [113.5107,23.2196],	
    

    '哈尔滨': [126.536668,45.811198],
    '海口': [110.318533,20.045846],
    '乌鲁木齐': [87.621014,43.830933],
    '拉萨': [91.121312,29.650716],
    '西宁': [101.780819,36.624172],
    '漠河': [122.538159,52.983157], 
    '成都': [103.9526,30.7617],

    '雅安': [103.049235,30.01765],
    '宜宾': [104.650978,28.759763]
};

var BJData = [
	[{name:'北京'}, {name:'哈尔滨',value:50}],
	[{name:'北京'}, {name:'海口',value:50}],
	[{name:'北京'}, {name:'乌鲁木齐',value:50}],
	[{name:'北京'}, {name:'拉萨',value:50}],
	[{name:'北京'}, {name:'西宁',value:50}],
	[{name:'北京'}, {name:'漠河',value:50}],
   	[{name:'北京'}, {name:'成都',value:50}],	   
];

var SHData = [
    [{name:'上海'}, {name:'哈尔滨',value:50}],
	[{name:'上海'}, {name:'海口',value:50}],
	[{name:'上海'}, {name:'乌鲁木齐',value:50}],
	[{name:'上海'}, {name:'拉萨',value:50}],
	[{name:'上海'}, {name:'西宁',value:50}],
	[{name:'上海'}, {name:'漠河',value:50}],
   	[{name:'上海'}, {name:'成都',value:50}],
];

var GZData = [
    [{name:'广州'}, {name:'哈尔滨',value:50}],
	[{name:'广州'}, {name:'海口',value:50}],
	[{name:'广州'}, {name:'乌鲁木齐',value:50}],
	[{name:'广州'}, {name:'拉萨',value:50}],
	[{name:'广州'}, {name:'西宁',value:50}],
	[{name:'广州'}, {name:'漠河',value:50}],
   	[{name:'广州'}, {name:'成都',value:50}],
];

var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var dataItem = data[i];
        var fromCoord = geoCoordMap[dataItem[0].name];
        var toCoord = geoCoordMap[dataItem[1].name];
        if (fromCoord && toCoord) {
            res.push({
                fromName: dataItem[0].name,
                toName: dataItem[1].name,
                coords: [fromCoord, toCoord]
            });
        }
    }
    return res;
};

var color = ['#a6c84c', '#ffa022', '#46bee9'];
var series = [];
[['北京', BJData], ['上海', SHData], ['广州', GZData]].forEach(function (item, i) {
    series.push({
        name: item[0],
        type: 'lines',
        zlevel: 1,
        effect: {
            show: true,
            period: 6,
            trailLength: 0.7,
            color: '#fff',
            symbolSize: 3
        },
        lineStyle: {
            normal: {
                color: color[i],
                width: 0,
                curveness: 0.2
            }
        },
        data: convertData(item[1])
    },
    {
        name: item[0],
        type: 'lines',
        zlevel: 2,
        effect: {
            show: true,
            period: 6,
            trailLength: 0,
            symbol: planePath,
            symbolSize: 15
        },
        lineStyle: {
            normal: {
                color: color[i],
                width: 1,
                opacity: 0.4,
                curveness: 0.2
            }
        },
        data: convertData(item[1])
    },
    {
        name: item[0],
        type: 'effectScatter',
        coordinateSystem: 'geo',
        zlevel: 2,
        rippleEffect: {
            brushType: 'stroke'
        },
        label: {
            normal: {
                show: true,
                position: 'right',
                formatter: '{b}'
            }
        },
        symbolSize: function (val) {
            return val[2] / 8;
        },
        itemStyle: {
            normal: {
                color: color[i]
            }
        },
        data: item[1].map(function (dataItem) {
            return {
                name: dataItem[1].name,
                value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
            };
        })
    });
});

option = {
    backgroundColor: '#404a59',
    title : {
        text: '车次信息',
        subtext: '-- by Mr.x',
        left: 'center',
        textStyle : {
            color: '#fff'
        }
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        orient: 'vertical',
        top: 'bottom',
        left: 'right',
        data:['北京', '上海', '广州'],
        textStyle: {
            color: '#fff'
        },
        selectedMode: 'single'
    },
    geo: {
        map: 'china',
        label: {
            emphasis: {
                show: false
            }
        },
        roam: true,
        itemStyle: {
            normal: {
                areaColor: '#323c48',
                borderColor: '#404a59'
            },
            emphasis: {
                areaColor: '#2a333d'
            }
        }
    },
    series: series
};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}