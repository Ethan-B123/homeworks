console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
  type: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function(data) {
    console.log(data.weather[0].main);
  }
})

// Add another console log here, outside your AJAX request

console.log("Wrote this after ajax request.");
