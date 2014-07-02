# Threadless Demo

This app aims to replicate some features from Threadless.

TODO: add image.

* client-side templating loading data from API.
* client-side JS posting to API
* Server API responding with proper CORS headers.

## Setup

In order for the CORS examples to work, the web site and the API need to be served from different hosts.

### API

To run the API you will need Node.js and **npm** installed. Then go to the **server** directory and run the following commands:

* `npm install`
* `node app.js`

You should see the following message: *Server listening on port 3001*

### Web Site

For a simple static web server, I recommend using the **SimpleHTTPServer** module from Python's standard library. Assuming you have Python installed (most unix systems do), run the following command from the root of this project:

`python -m SimpleHTTPServer`

You should see the following message: *Serving HTTP on 0.0.0.0 port 8000 ...*

Now visit **http://localhost:8000** and the website should be displayed.