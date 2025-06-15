from bottle import Bottle, static_file, run
from route import app

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080) 
app = Bottle()

# Rota para arquivos estáticos (IMPORTANTE)
@app.route('/static/<filename:path>')
def serve_static(filename):
    return static_file(filename, root='./static')

@app.route('/')
def home():
    return open('index.html').read()

if __name__ == '__main__':
    run(app, host='localhost', port=3000, debug=True)