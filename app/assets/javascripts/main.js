$( "#guess" ).click(function() {

  if($('#guess_weight').val() > 63  && $('#guess_height').val() > 50){

    let guess_height = _.round($('#guess_height').val(), -01);
    let guess_weight = _.round($('#guess_weight').val(), -01);

    $.ajax({
      url: '/animal/'+guess_height +'/'+guess_weight,
      type: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': $('meta[name=csrf-token]').attr('content'),
        'X-CSRF-Param': $('meta[name=csrf-param]').attr('content')
      },
      success: function(response) {
        console.log(response);
      }
    });


/*
    if((guess_spread > dog_spread) && (guess_spread >= cat_spread )){
      answer = 0;
      $("#cat_lover").removeClass("d-none");
      $("#guess_pet_guess").val("Cat");
    } else {
      $("#dog_lover").removeClass("d-none");
    }

    $("#guess").addClass('disabled');
    $("#results" ).removeClass("invisible");
    $('#chart-container').addClass('invisible');
*/
  }
});

//Chart Config
function renderChart(cat_right = 10, cat_wrong = 20, dog_right = 20, dog_wrong = 5) {
  var chart = document.getElementById('chart').getContext('2d');

  var PieChart = new Chart(chart, {
      type: 'horizontalBar',
      data: {
          datasets: [{
              label: 'Guessing Machine Results',
              data: [cat_right, cat_wrong, dog_right, dog_wrong ],
              backgroundColor: ['rgba(255, 99, 132, 0.9)','rgba(54, 162, 235, 0.9)', 'rgba(255, 206, 86, 0.9)', 'rgba(75, 192, 192, 0.9)'],
              borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)']
          }],
          labels: [
              'Right Cat Owners Guesss ',
              'Wrong Cat Owners Guesss ',
              'Right Dog Owners Guesss ',
              'Wrong Dog Owners Guesss',
          ]
      },
      options: {
        responsive: true,
        legend: {
          labels:{
            fontColor: '#fff',
            fontSize: 13
          }
        },
        scales: {
          xAxes: [{
            stacked: true,
            ticks: {
              fontColor: "#ddd",
            }
          }],
          yAxes: [{
            stacked: true,
            gridLines: {
              offsetGridLines: true
            },
            ticks: {
              fontColor: "#ddd",
              fontSize: 13,
            }
          }]
        }
      }

  });
}

$('#guess_weight').tooltip('enable')
