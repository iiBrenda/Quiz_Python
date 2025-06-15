class UserModel:
    def __init__(self):
        # Simulando um banco de dados
        self.users = {
            "admin": "123456",  # Em produção, usar hash de senha
            "aluno": "quiz123"
        }

    def validate_user(self, username, password):
        return username in self.users and self.users[username] == password