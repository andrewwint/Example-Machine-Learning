$( "#guess" ).click(function() {

  if($('#guess_weight').val() > 63 ){
    //Defaults
    var dog_avg_ratio = $('#dog_avg_ratio').val();
    var cat_avg_ratio = $('#cat_avg_ratio').val();

    //User input
    var guess_height = _.round($('#guess_height').val(), -01);
    var guess_weight = _.round($('#guess_weight').val(), -01);

    console.log(guess_height + ':' + guess_weight);

    function greatest_common_factor(a, b) {
      return (b == 0) ? a : greatest_common_factor (b, a%b);
    }

    var answer = 1; //Dog lover by default
    var guess_factor = greatest_common_factor(guess_height, guess_weight);
    var guess_spread = Math.abs(guess_height/guess_factor - guess_weight/guess_factor);
    var dog_spread   = Math.abs(parseInt(dog_avg_ratio.split(":")[0]) - parseInt(dog_avg_ratio.split(":")[1])) ;
    var cat_spread   = Math.abs(parseInt(cat_avg_ratio.split(":")[0]) - parseInt(cat_avg_ratio.split(":")[1])) ;

    //Check to see if the user is a Cat lover
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

    console.log('Dog Spread ' + dog_spread);
    console.log('Cat Spread ' + cat_spread);
    console.log('Guess Ratio ' + guess_height/guess_factor + ':' + guess_weight/guess_factor)
    console.log('Guess Spread ' + guess_spread);
    console.log('Guessed Answer ' + answer );
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
