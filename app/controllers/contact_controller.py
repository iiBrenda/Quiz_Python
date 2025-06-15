from bottle import request, template
from app.models.contact_model import ContactModel

class ContactController:
    def __init__(self):
        self.model = ContactModel()

    def submit(self):
        name = request.forms.get('name')
        email = request.forms.get('email')
        message = request.forms.get('message')
        
        self.model.save_contact(name, email, message)
        return template('contact', success=True)