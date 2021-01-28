// import mapboxgl from 'mapbox-gl';

const initChart = () => {
  const chart0 = document.getElementById("myChart0").getContext('2d');
  const chart1 = document.getElementById("myChart1").getContext('2d');
  const chart2 = document.getElementById("myChart2").getContext('2d');
  const chart3 = document.getElementById("myChart3").getContext('2d');
  const chart4 = document.getElementById("myChart4").getContext('2d');
  const chart5 = document.getElementById("myChart5").getContext('2d');

  if (chart0) { 
    const dateTime = JSON.parse(chart0.canvas.dataset.date_time);
    const values = JSON.parse(chart0.canvas.dataset.values);

    var myChart = new Chart(chart0, {
      type: 'line',
      data: {
          labels: dateTime,
          datasets: [{          
            label: 'Wave Height',
            data: values,
          }]
      },
      options: {
        legend: {
          display: false
        },
        scales: {
          yAxes: [{
              ticks: {
                beginAtZero:false
              }
          }]
        }
      }
    });
  }

  if (chart1) { 
    const dateTime = JSON.parse(chart1.canvas.dataset.date_time);
    const values = JSON.parse(chart1.canvas.dataset.values);

    var myChart = new Chart(chart1, {
      type: 'line',
      data: {
          labels: dateTime,
          datasets: [{          
            label: 'Peak Period',
            data: values,
          }]
      },
      options: {
        legend: {
          display: false
        },
        scales: {
          yAxes: [{
              ticks: {
                beginAtZero:false
              }
          }]
        }
      }
    });
  }

};


export { initChart };
