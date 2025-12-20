# Street Generator

O objetivo desse projeto é ver uma maneira de gerar o mapa de uma cidade usando chunks.  
O mapa ele terá rua (vermelho), calçada (azul), verde (construção).  
O tile é 8x8 pixels.
O chunk é 16x16 tiles.


## Estratégias de geração

1. Spanning tree (recomendado)
Trate cada chunk como um nó; arestas possíveis existem entre chunks adjacentes se ambos permitirem saída naquela borda.  
Gere uma árvore geradora aleatória (ex.: randomized DFS / Prim) para garantir uma única componente conectada de ruas; depois adicione arestas extras aleatoriamente para criar loops se quiser. Vantagem: garante conectividade e é determinístico/replicável. Referência: técnicas de geração procedural de cidades e grafos aplicados a chunks.

https://en.wikipedia.org/wiki/Spanning_tree

2. Wave Function Collapse (WFC) por borda
Cada chunk tem um conjunto de templates compatíveis; WFC propaga restrições de borda (rua/sem rua). Bom para variedade e regras locais fortes, mas mais complexo e pode precisar de backtracking pesado.

3. Random walk / Growing tree
Cresce a rua a partir do chunk central até atingir objetivos de borda; simples, mas pode deixar áreas desconectadas e exigir preenchimento posterior com chunks de construção.

4. Cellular automata híbrido
Útil para gerar padrões orgânicos (ruas curvas), mas menos controlável para garantir uma única rede conectada.  
Escolha: Spanning tree + templates + validação (menor complexidade, fácil de garantir 1 rua conectada e regras de borda).

## Regras que o algoritmo aplica (importante)
- Cada chunk (exceto chunks “só construção”) tem ≥1 saída; saída só nas bordas; máximo 4.
- Quando dois chunks encostam, se um tem rua na borda, o outro deve ter rua na borda correspondente.
- No mapa final só pode existir uma componente de ruas conectada.
- Limitar saídas na borda do mapa a 2–5 (objetivos finais).
