<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Python Quiz | Teste Seu Conhecimento</title>
    
    <!-- Fontes Google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Favicon -->
    <link rel="icon" href="/static/images/favicon.ico" type="image/x-icon">
    
    <!-- CSS -->
    <style>
        :root {
            --python-blue: #3776AB;
            --python-yellow: #FFD43B;
            --python-dark: #2C3E50;
            --python-light: #F8F9FA;
            --correct: #4CAF50;
            --incorrect: #F44336;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--python-dark);
        }
        
        .quiz-hero {
            text-align: center;
            padding: 4rem 2rem;
            background: url('/static/images/photo-1542831371-29b0f74f9713.avif') center/cover;
            color: white;
            position: relative;
        }
        
        .quiz-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(55, 118, 171, 0.8);
        }
        
        .quiz-hero-content {
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
        
        .quiz-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .question {
            font-size: 1.3rem;
            margin: 2rem 0;
            font-family: 'Roboto Mono', monospace;
        }
        
        .options {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .option {
            padding: 1rem;
            background: var(--python-light);
            border: 2px solid var(--python-blue);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
        }
        
        .option:hover {
            background: #E1E9F2;
            transform: translateY(-3px);
        }
        
        .option.selected {
            background: var(--python-blue);
            color: white;
        }
        
        .quiz-controls {
            display: flex;
            justify-content: space-between;
        }
        
        .quiz-btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .hint-btn {
            background: var(--python-yellow);
            color: var(--python-dark);
        }
        
        .hint-btn:hover {
            background: #FFE873;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        
        .submit-btn {
            background: var(--python-blue);
            color: white;
        }
        
        .submit-btn:hover {
            background: #4584B6;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        
        .feedback {
            margin-top: 1.5rem;
            padding: 1rem;
            border-radius: 8px;
            display: none;
        }
        
        .correct {
            background: rgba(76, 175, 80, 0.2);
            color: var(--correct);
        }
        
        .incorrect {
            background: rgba(244, 67, 54, 0.2);
            color: var(--incorrect);
        }
        
        .quiz-stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            font-family: 'Roboto Mono', monospace;
        }
        
        .stat {
            background: var(--python-light);
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }
        
        footer {
            text-align: center;
            padding: 2rem;
            background: var(--python-dark);
            color: white;
        }
        
        @media (max-width: 768px) {
            .options {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <section class="quiz-hero">
        <div class="quiz-hero-content">
            <h1>Python Quiz</h1>
            <p class="subtitle">Teste seus conhecimentos em programação Python</p>
        </div>
    </section>
    
    <div class="quiz-container">
        <div class="quiz-stats">
            <span id="progress" class="stat">Pergunta 1/8</span>
            <span id="score" class="stat">Pontuação: 0</span>
        </div>
        
        <div id="question" class="question"></div>
        <div id="options" class="options"></div>
        <div id="feedback" class="feedback"></div>
        
        <div class="quiz-controls">
            <button id="hintBtn" class="quiz-btn hint-btn">Dica</button>
            <button id="submitBtn" class="quiz-btn submit-btn">Responder</button>
        </div>
    </div>
    
    <footer>
        <p>© <span id="current-year">2025</span> Python Quiz | Projeto desenvolvido por Brenda Maria e José Gabriel</p>
    </footer>

    <script>
        // ============== PERGUNTAS ==============
        const questions = [
            {
                id: 1,
                question: "O que o 'input()' faz?",
                options: ["Faz uma pergunta ao usuário", "Quebra uma linha", "Mostra um número aleatório", "Imprime uma saída"],
                answer: "Faz uma pergunta ao usuário",
                hint: "O 'input()' faz uma pergunta"
            },
            {
                id: 2,
                question: "Como criar uma variável x com valor 7?",
                options: ["x = {variável, 7}", "create = x = 7", "x = 7", "x == 7"],
                answer: "x = 7",
                hint: "Atribuição direta com ="
            },
            {
                id: 3,
                question: "Qual destes NÃO é um tipo de dado básico em Python?",
                options: ["int", "str", "real", "tuple"],
                answer: "real",
                hint: "Python tem 'float' para números reais, não 'real'"
            },
            {
                id: 4,
                question: "Como se cria uma lista em Python?",
                options: ["lista = []", "lista = lista", "lista = {}", "Ambos A e B estão corretos"],
                answer: "lista = []",
                hint: "Listas podem ser criadas com []"
            },
            { 
                id: 5,
                question: "Como posso retornar 'Quiz python'",
                options: ["x = Quiz python", "for quiz in python", "print(Quiz python)", "printf(Quiz python)"],
                answer: "print(Quiz python)",
                hint: "Para retornar usamos o print"
            },
            {
                id: 6,
                question: "Qual é a forma correta de criar uma função em Python?",
                options: [
                    "function minhaFuncao():",
                    "def minhaFuncao():",
                    "create function minhaFuncao()",
                    "função minhaFuncao():"
                ],
                answer: "def minhaFuncao():",
                hint: "Em Python, funções são definidas com a palavra-chave 'def'"
            },
            {
                id: 7,
                question: "Como comentar uma linha em Python?",
                options: [
                    "// Comentário",
                    "/* Comentário */",
                    "# Comentário",
                    "-- Comentário"
                ],
                answer: "# Comentário",
                hint: "Python usa o símbolo # para comentários de linha única"
            },
            {
                id: 8,
                question: "Qual método retorna o número de itens em uma lista?",
                options: [
                    ".count()",
                    ".size()",
                    ".length()",
                    ".len()"
                ],
                answer: ".count()",
                hint: "O método .count() retorna o número de elementos específicos na lista"
            }
        ];

        // ============== LÓGICA DO QUIZ ==============
        let currentQuestionIndex = 0;
        let score = 0;
        let selectedOption = null;

        function showQuestion() {
            const question = questions[currentQuestionIndex];
            document.getElementById('question').textContent = question.question;
            
            const optionsEl = document.getElementById('options');
            optionsEl.innerHTML = '';
            
            question.options.forEach(option => {
                const optionEl = document.createElement('div');
                optionEl.className = 'option';
                optionEl.textContent = option;
                optionEl.addEventListener('click', () => {
                    document.querySelectorAll('.option').forEach(opt => {
                        opt.classList.remove('selected');
                    });
                    optionEl.classList.add('selected');
                    selectedOption = option;
                    document.getElementById('feedback').style.display = 'none';
                });
                optionsEl.appendChild(optionEl);
            });
            
            updateProgress();
        }
        
        function updateProgress() {
            document.getElementById('progress').textContent = 
                `Pergunta ${currentQuestionIndex + 1}/${questions.length}`;
            document.getElementById('score').textContent = `Pontuação: ${score}`;
        }
        
        function showFeedback(isCorrect, correctAnswer) {
            const feedbackEl = document.getElementById('feedback');
            feedbackEl.className = isCorrect ? 'feedback correct' : 'feedback incorrect';
            feedbackEl.textContent = isCorrect 
                ? '✅ Resposta Correta!' 
                : `❌ Resposta Incorreta! A correta é: ${correctAnswer}`;
            feedbackEl.style.display = 'block';
        }
        
        function showHint() {
            const question = questions[currentQuestionIndex];
            alert(`Dica: ${question.hint}`);
        }
        
        function checkAnswer() {
            if (!selectedOption) {
                alert('Por favor, selecione uma opção!');
                return;
            }
            
            const question = questions[currentQuestionIndex];
            const isCorrect = selectedOption === question.answer;
            
            if (isCorrect) {
                score += 10;
            }
            
            showFeedback(isCorrect, question.answer);
            
            setTimeout(() => {
                currentQuestionIndex++;
                selectedOption = null;
                
                if (currentQuestionIndex < questions.length) {
                    showQuestion();
                } else {
                    showFinalResults();
                }
            }, 1500);
        }
        
        function showFinalResults() {
            const percentage = (score / (questions.length * 10)) * 100;
            let performance;
            
            if (percentage >= 80) performance = "Ótimo! 🎉";
            else if (percentage >= 60) performance = "Bom! 👍";
            else performance = "Pode melhorar! 📚";
            
            if (confirm(`Quiz concluído!\n\nSua pontuação: ${score}/${questions.length * 10}\n\nDesempenho: ${performance}\n\nDeseja recomeçar?`)) {
                currentQuestionIndex = 0;
                score = 0;
                selectedOption = null;
                showQuestion();
            }
        }

        // ============== EVENT LISTENERS ==============
        document.getElementById('hintBtn').addEventListener('click', showHint);
        document.getElementById('submitBtn').addEventListener('click', checkAnswer);
        
        // Atualiza o ano no footer
        document.getElementById('current-year').textContent = new Date().getFullYear();
        
        // Inicia o quiz
        showQuestion();
    </script>
</body>
</html>