//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {

  console.log("Reached here");
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    alert(data);
  });
//   var dispatcher = new WebSocketRails('http://localhost:3000/websocket');

//   dispatcher.on_open = function(data) {
//     console.log('Connection has been established: ', data);
//     dispatcher.trigger('hello', 'Hello, there!', success, failure);
//   }

//   var success = function(response) {
//     console.log("Wow it worked: "+response.message);
//   }

//   var failure = function(response) {
//     console.log("That just totally failed: "+response.message);
//   }

//   var channel = dispatcher.subscribe('updates');
//   channel.bind('update', function(count) {
//     $('#count').text(count);
//   });
//   //var dispatcher = new WebSocketRails(window._host + '/websocket');
//   //var channel = dispatcher.subscribe('channel_name');

//   //
});
