from bottle import request, redirect, response, template
from app.models.user_model import UserModel

class AuthController:
    def __init__(self):
        self.model = UserModel()

    def login(self):
        username = request.forms.get('username')
        password = request.forms.get('password')
        
        if self.model.validate_user(username, password):
            response.set_cookie("auth", username, secret="sua_chave_secreta")
            return redirect('/quiz')
        return template('login', error="Credenciais inválidas")