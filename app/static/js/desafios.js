
document.addEventListener('DOMContentLoaded', () => {
    fetch('data/desafios.json')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('desafio-container');
            data.forEach(desafio => {
                const card = document.createElement('div');
                card.className = 'card';
                card.innerHTML = `
                    <h2>${desafio.titulo}</h2>
                    <p><strong>Nível:</strong> ${desafio.nivel}</p>
                    <p>${desafio.descricao}</p>
                    <details>
                        <summary>Ver dica</summary>
                        <p>${desafio.dica}</p>
                    </details>
                    <details>
                        <summary>Ver solução</summary>
                        <pre>${desafio.solucao}</pre>
                    </details>
                `;
                container.appendChild(card);
            });
        });
});
