extends Node

### Display Resolution
# é o tamanho da tela que o jogo irá rodar, geralmente não é possível usar a resolução do jogo maior que o monitor aguenta, porém existe forma via software para manipular isso
# 800x600, 1024x768, 1440x720, 1920x1080

### Refresh Rate
# é o FPS do jogo, quatas imagens será mostrada por segundo
# 30Hz, 60Hz, 72Hz

### Texture Quality
# é o quanto o jogo precisa processar para  mostrar as texturas. quanto maior a qualidade, mais detalhes será mostrado
# LOW, MEDIUM, HIGH, ULTRA

### Anti-Aliasing (AA)
# é uma técnica para tirar o efeito qudriculado das bordas dos objetos criando smooth effect
# OFF, LOW (FXAA), MEDIUM (SMAA LOW), HIGH (SMAA MEDIUM), ULTRA (SMAA HIGH)

### V-Sync
# é uma técnica para sincronizar o desenhar da imagem no monitor. dependendo do poder do monitor, ele pode não dar conta com o poder da placa e começar a ter desincronização das imagens e começa a vir imagens cortadas. essa opção deixa o FPS menor, já que é um controle da qualidade do desenhar e isso acaba atrasando pelo trabalho
# ON, OFF

### Tesselation
# é o efeito da imagem quando colocado na textura. ela faz que o desenho se torne de uma simples textura plana para um com textura com efeito 3d sem precisar fazer o modelo 3d em si. habilitar não tira muito desempenho do jogo
# LOW, MEDIUM, HIGH, ULTRA

### Ambient Occlusion
# é uma técnica que ajuda a melhorar o efeito da sombra tornando-o mais realista
# OFF, SSAO, HBAO, HDAO, VXAO

### Anisotropic Filtering
# deixa a renderização da textura melhor em relação à camera. quanto mais próximo está ok, mas conforme a textura fica longe ela vai perdendo a qualidade devido ao problema da junção dos pixels no mesmo espaço
# OFF, Bilinear, Trilinear, 2x, 4x, 8x, 16x

### High Dynamic Range (HDR)
# é uma técnica que melhora o contraste entre as partes claras e escuras da imagem. ela faz com que a pare escura pareçam mais escuras e as partes claras fiquem mais claras.
# geralmente não tem opção de ativar ou desativar

### Bloom
# é um efeito que torna a luz mais clara. é tipo aquele efeito de quando está acordando com a luz na sua cara ou aquele de um fantasma indo para o fim do túnel. é mais para efeito cinematográfico
# ON, OFF

### Motion Blur
# é um efeito que faz o desfoque quando movimentando dando a impressão de um movimento rápido.  é mais para efeito cinematográfico
# ON, OFF

### Field of View
# é o campo de visão do jogador, está relacionado a visão periférica
#