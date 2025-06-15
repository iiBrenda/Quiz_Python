
from bottle import Bottle, run, static_file, response, template
import os

app = Bottle()

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VIEWS_DIR = os.path.join(BASE_DIR, 'app', 'views')
STATIC_DIR = os.path.join(BASE_DIR, 'app', 'static')

# Configura o caminho dos templates
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(VIEWS_DIR)

# Configura o charset UTF-8
@app.hook('after_request')
def set_charset():
    response.content_type = 'text/html; charset=utf-8'

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root=STATIC_DIR)

@app.route('/')
def home():
    return template('index')

@app.route('/quiz')  
def quiz():
    return template('quiz')  

if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080, debug=True, reloader=True)