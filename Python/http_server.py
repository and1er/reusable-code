"""
Simple HTTP server with Python.

https://docs.python.org/3.8/library/http.server.html

This server is useful for firewall testing.

One line call from command line:
> python3 -m http.server 8000 --bind 0.0.0.0
> py -3 -m http.server 8000 --bind 0.0.0.0
"""

from http.server import HTTPServer, BaseHTTPRequestHandler

def run(server_class=HTTPServer, handler_class=BaseHTTPRequestHandler):
    server_address = ('0.0.0.0', 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()

if __name__ == '__main__':
    run()
