
//function getChart(jsonfile){
function getChart(){
    let myChart = document.getElementById('myChart').getContext('2d');
        
    //Global Options
   
    Chart.defaultFontSize=18;
    Chart.defaultFontColor='#777';
        
        
    //표 성질
    var jsonfile = {
        "jsonarray": [{
           "standard": "지표1",
           "grade": 5
        }, {
            "standard": "지표2",
            "grade": 3
        }, {
            "standard": "지표3",
            "grade": 2
        }, {
            "standard": "지표4",
            "grade": 3
        }, {
            "standard": "지표5",
            "grade": 4
        }]
     };
     var labels = jsonfile.jsonarray.map(function(e) {
        return e.standard;
     });
     var data = jsonfile.jsonarray.map(function(e) {
        return e.grade;
     });;
     
     
     var config = {
        type:'bar', // bar, horizontalBar, pie,line , doughnut
        data:{
            labels:labels,
            datasets:[{
                label:'평점',
                data:data,
                // backgroundColor:'green'
                backgroundColor:
                'rgba(63, 127, 191, 0.6)'
                ,
                borderWidth:1,
                borderColor:'#777',
                hoverBorderwidth:3,
                hoverBorderwidth:'#000'
            }],
            
            
        },
        options:{
            title:{
                display:false,
                text:'세부 지표',
                fontSize:12
            },
            legend:{
                display:false,
                position:'right',
                labels:{
                    fontColor:'#000'
                }
            },
            layout:{
                padding:{
                    left:10,
                    right:20,
                    bottom:10,
                    top:20
                }
            },
            tooltips:{
                enabled:true
            },
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
//                        suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
//                        // OR //
                        beginAtZero: true,   // minimum value will be 0.
                        
                        max:5
                    }
                }]
            }

        }
    };
     
    let barchart = new Chart(myChart, config);

}