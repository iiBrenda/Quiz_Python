 export const questions = [
    {
    id: 1,
    question: "Qual é a forma correta de criar uma função?",
    options: ["creat função", "print('função')", "def função", "função ('função')"],
    answer: "def função",
    hint: "Use 'def' seguido do nome da função"
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