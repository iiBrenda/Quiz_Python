import { Questions } from './Questions.js';
import { QuizView } from './quizView.js'

export class QuizController {
    constructor() {
        this.questions = questions;
        this.currentQuestionIndex = 0;
        this.score = 0;
        this.selectedOption = null;
    }

    startQuiz() {
        this.currentQuestionIndex = 0;
        this.score = 0;
        this.loadQuestion();
    }

    loadQuestion() {
        const question = this.questions[this.currentQuestionIndex];
        this.showQuestion(question);
        this.updateProgress();
    }

    showQuestion(question) {
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
                this.selectedOption = option;
            });
            optionsEl.appendChild(optionEl);
        });
    }

    updateProgress() {
        document.getElementById('progress').textContent = 
            `Pergunta ${this.currentQuestionIndex + 1}/${this.questions.length}`;
        document.getElementById('score').textContent = `Pontuação: ${this.score}`;
    }

    checkAnswer() {
        if (!this.selectedOption) {
            alert('Por favor, selecione uma opção!');
            return;
        }

        const question = this.questions[this.currentQuestionIndex];
        const isCorrect = this.selectedOption === question.answer;

        if (isCorrect) this.score += 10;
        this.showFeedback(isCorrect, question.answer);

        setTimeout(() => {
            this.currentQuestionIndex++;
            if (this.currentQuestionIndex < this.questions.length) {
                this.loadQuestion();
            } else {
                this.showFinalResults();
            }
        }, 1500);
    }

    showFeedback(isCorrect, correctAnswer) {
        const feedbackEl = document.getElementById('feedback');
        feedbackEl.className = isCorrect ? 'feedback correct' : 'feedback incorrect';
        feedbackEl.textContent = isCorrect 
            ? '✅ Resposta Correta!' 
            : `❌ Resposta Incorreta! A correta é: ${correctAnswer}`;
    }

    showHint() {
        const hint = this.questions[this.currentQuestionIndex].hint;
        alert(`Dica: ${hint}`);
    }

    showFinalResults() {
        const percentage = (this.score / (this.questions.length * 10)) * 100;
        let message = `Pontuação: ${this.score}/${this.questions.length * 10}\n`;
        
        if (percentage >= 80) message += "Excelente! 🎉";
        else if (percentage >= 60) message += "Bom trabalho! 👍";
        else message += "Continue praticando! 📚";

        if (confirm(`${message}\n\nDeseja recomeçar?`)) {
            this.startQuiz();
        }
    }
}