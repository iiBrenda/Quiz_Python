export class QuizRules {
  static checkAnswer(userAnswer, correctAnswer) {
    return userAnswer === correctAnswer;
  }

  static calculateScore(correctAnswers) {
    return correctAnswers * 10;
  }
}