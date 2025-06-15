<!DOCTYPE html>
<html>
<head>
    <title>Contato - Python Quiz</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <div class="contact-container">
        <h1>Contato</h1>
        % if success:
            <p class="success">Mensagem enviada com sucesso!</p>
        % end
        <form action="/contact" method="post">
            <input type="text" name="name" placeholder="Nome" required>
            <input type="email" name="email" placeholder="E-mail" required>
            <textarea name="message" placeholder="Sua mensagem" required></textarea>
            <button type="submit">Enviar</button>
        </form>
    </div>
</body>
</html>