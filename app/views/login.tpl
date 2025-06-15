<!DOCTYPE html>
<html>
<head>
    <title>Login - Python Quiz</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        % if error:
            <p class="error">{{error}}</p>
        % end
        <form action="/login" method="post">
            <input type="text" name="username" placeholder="Usuário" required>
            <input type="password" name="password" placeholder="Senha" required>
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>