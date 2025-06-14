export class QuizView {
  static showQuestion(questionText, options) {
    document.getElementById('question').textContent = questionText;
    const optionsContainer = document.getElementById('options');
    optionsContainer.innerHTML = '';

    options.forEach((option, index) => {
      const optionElement = document.createElement('div');
      optionElement.className = 'option';
      optionElement.textContent = option;
      optionElement.addEventListener('click', () => {
        document.querySelectorAll('.option').forEach(opt => {
          opt.classList.remove('selected');
        });
        optionElement.classList.add('selected');
        window.quizController.selectedOption = option;
        document.getElementById('feedback').style.display = 'none';
      });
      optionsContainer.appendChild(optionElement);
    });
  }

  static updateProgress(current, total) {
    document.getElementById('progress').textContent = `Pergunta ${current}/${total}`;
  }

  static updateScore(score) {
    document.getElementById('score').textContent = `Pontuação: ${score}`;
  }

  static showFeedback(isCorrect, correctAnswer) {
    const feedbackEl = document.getElementById('feedback');
    feedbackEl.className = isCorrect ? 'feedback correct' : 'feedback incorrect';
    feedbackEl.textContent = isCorrect 
      ? '✅ Resposta Correta!' 
      : `❌ Resposta Incorreta! A correta é: ${correctAnswer}`;
    feedbackEl.style.display = 'block';
  }

  static showHint(hint) {
    alert(`Dica: ${hint}`);
  }

  static showFinalResults(score, totalQuestions) {
    const percentage = (score / (totalQuestions * 10)) * 100;
    let performance;
    
    if (percentage >= 80) performance = "Ótimo! 🎉";
    else if (percentage >= 60) performance = "Bom! 👍";
    else performance = "Pode melhorar! 📚";
    
    if (confirm(`Quiz concluído!\n\nSua pontuação: ${score}/${totalQuestions * 10}\n\nDesempenho: ${performance}\n\nDeseja recomeçar?`)) {
      window.quizController.startQuiz();
    }
  }
}