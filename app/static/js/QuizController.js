import { QuizRules } from '../business/QuizRules.js';
import Questions from '../../model/Questions.js';
import { QuizView } from '../view/js/quizView.js';

export class QuizController {
  constructor() {
    this.Questions = Questions;
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
    console.log("[DEBUG] Índice atual:", this.currentQuestionIndex);
    console.log("[DEBUG] Pergunta atual:", this.questions[this.currentQuestionIndex]);
    const question = this.questions[this.currentQuestionIndex];
    QuizView.showQuestion(question.question, question.options);
    QuizView.updateProgress(this.currentQuestionIndex + 1, this.questions.length);
    QuizView.updateScore(this.score);
    this.updateProgress();
  }

  checkAnswer() {
    if (!this.selectedOption) {
      alert('Por favor, selecione uma opção!');
      return;
    }

    const question = this.questions[this.currentQuestionIndex];
    const isCorrect = QuizRules.checkAnswer(this.selectedOption, question.answer);

    if (isCorrect) this.score += 10;
    QuizView.showFeedback(isCorrect, question.answer);

    setTimeout(() => {
      this.currentQuestionIndex++;
      this.selectedOption = null;
      
      if (this.currentQuestionIndex < this.questions.length) {
        this.loadQuestion();
      } else {
        QuizView.showFinalResults(this.score, this.questions.length);
      }
    }, 1500);
  }

  showHint() {
    const hint = this.questions[this.currentQuestionIndex].hint;
    QuizView.showHint(hint);
  }

}