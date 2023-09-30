var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("<p><b>Hello World JS!</b></p>");
}
var www = http.createServer(handleRequest);
www.listen(8080);
