$(document).ready(function() {

  $('form').submit(function(event){
    event.preventDefault();
    var data = $(this).serialize();
    console.log(data);
    
    $('form').append('<h2>We\'re workin on it</h2>');
    $.post('/tweet', data, function(response){
      $('h2').html('successfully tweeted');
    })

  })

});
