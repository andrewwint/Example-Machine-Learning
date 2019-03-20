$( "#guess" ).click(function() {

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

  $("#guess").addClass('disabled')
  $("#results" ).removeClass("invisible");


  console.log('Dog Spread ' + dog_spread);
  console.log('Cat Spread ' + cat_spread);
  console.log('Guess Ratio ' + guess_height/guess_factor + ':' + guess_weight/guess_factor)
  console.log('Guess Spread ' + guess_spread);
  console.log('Guessed Answer ' + answer );

});
