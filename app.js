import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = 3000;

// Configurações
app.use(express.static(path.join(__dirname, 'view')));
app.use('/assets', express.static(path.join(__dirname, 'view/assets')));

// Rotas
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'view/index.html'));
});

app.get('/quiz', (req, res) => {
  res.sendFile(path.join(__dirname, 'view/quiz.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});