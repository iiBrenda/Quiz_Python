from bottle import template

class QuizController:
    def show(self):
        return template('quiz')  # Renderiza quiz.tpl