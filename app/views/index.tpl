<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Python Quiz | Seu Portfólio</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap">
    <link rel="stylesheet" href="/static/css/styles.css">
    <style>
        :root {
            --python-blue: #3776AB;
            --python-yellow: #FFD43B;
            --python-dark: #2C3E50;
            --python-light: #F8F9FA;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--python-dark);
        }
        
        .hero {
            text-align: center;
            padding: 4rem 2rem;
            background: url('/static/images/photo-1542831371-29b0f74f9713.avif') center/cover;
            color: white;
            position: relative;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(55, 118, 171, 0.8);
        }
        
        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0 auto;
        }
        
        h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--python-yellow);
        }
        
        .subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            font-family: 'Roboto Mono', monospace;
        }
        
        .cta-button {
            display: inline-block;
            padding: 1rem 2rem;
            background: var(--python-yellow);
            color: var(--python-dark);
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.2rem;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            cursor: pointer;
            border: none;
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
            background: #FFE873;
        }
        
        .cta-button:disabled {
            background: #cccccc;
            color: #666666;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }
        
        .login-form {
            background: rgba(255, 255, 255, 0.2);
            padding: 2rem;
            border-radius: 10px;
            max-width: 400px;
            margin: 0 auto 2rem auto;
            backdrop-filter: blur(5px);
        }
        
        .form-group {
            margin-bottom: 1rem;
            text-align: left;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        
        input {
            width: 100%;
            padding: 0.8rem;
            border: none;
            border-radius: 5px;
            font-family: 'Roboto Mono', monospace;
        }
        
        .login-button {
            background: var(--python-dark);
            color: white;
            width: 100%;
        }
        
        .login-button:hover {
            background: #3d5166;
        }
        
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
            padding: 4rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .feature-card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            width: 300px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-icon {
            font-size: 3rem;
            color: var(--python-blue);
            margin-bottom: 1rem;
        }
        
        footer {
            text-align: center;
            padding: 2rem;
            background: var(--python-dark);
            color: white;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <section class="hero">
        <div class="hero-content">
            <h1>Python Quiz</h1>
            <p class="subtitle">Teste seus conhecimentos em programação Python</p>
            <p class="subtitle">Divirtam-se</p>
            
            <div class="login-form" id="loginForm">
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" placeholder="Digite qualquer e-mail" required>
                </div>
                <div class="form-group">
                    <label for="password">Senha:</label>
                    <input type="password" id="password" placeholder="Digite qualquer senha" required>
                </div>
                <button class="cta-button login-button" id="loginBtn">Entrar</button>
            </div>
            
            <button class="cta-button hidden" id="startQuizBtn" disabled>Iniciar Quiz</button>
        </div>
    </section>
    
    <section class="features">
        <div class="feature-card">
            <div class="feature-icon">💡</div>
            <h3>Desafios Práticos</h3>
            <p>Perguntas que testam seu conhecimento real em Python</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">📊</div>
            <h3>Feedback Imediato</h3>
            <p>Saiba instantaneamente se acertou ou errou</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">🚀</div>
            <h3>Níveis Progressivos</h3>
            <p>Do básico ao avançado para todos os níveis</p>
        </div>
    </section>
    
    <footer>
        <p>© 2025 Python Quiz | Projeto desenvolvido por Brenda Maria e José Gabriel</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginForm = document.getElementById('loginForm');
            const loginBtn = document.getElementById('loginBtn');
            const startQuizBtn = document.getElementById('startQuizBtn');
            const emailInput = document.getElementById('email');
            const passwordInput = document.getElementById('password');
            
            // Função para validar o login (qualquer valor serve)
            function validateLogin() {
                if (emailInput.value.trim() !== '' && passwordInput.value.trim() !== '') {
                    return true;
                }
                return false;
            }
            
            // Evento de clique no botão de login
            loginBtn.addEventListener('click', function() {
                if (validateLogin()) {
                    // Esconde o formulário de login
                    loginForm.classList.add('hidden');
                    
                    // Mostra o botão de iniciar quiz
                    startQuizBtn.classList.remove('hidden');
                    startQuizBtn.disabled = false;
                    
                    // Opcional: Mostrar mensagem de sucesso
                    alert('Login realizado com sucesso! Agora você pode acessar o quiz.');
                } else {
                    alert('Por favor, preencha ambos os campos.');
                }
            });
            
            // Evento de clique no botão de iniciar quiz
            startQuizBtn.addEventListener('click', function() {
                window.location.href = '/quiz';
            });
            
            // Opcional: Permitir submit com Enter
            loginForm.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    loginBtn.click();
                }
            });
        });
    </script>
</body>
</html>