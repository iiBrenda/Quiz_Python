from datetime import datetime  

class ContactModel:
    def __init__(self):
        self.contacts = []  

    def save_contact(self, name, email, message):
        self.contacts.append({
            "name": name,
            "email": email,
            "message": message,
            "date": datetime.now()  
        })
