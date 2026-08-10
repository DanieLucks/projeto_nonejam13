GDD:  FACTORY VS ZOMBIES

> Um jogo de estratégia e defesa de torres em tempo real inspirado no clássico *Plants vs. Zombies*, com mecânicas de transmissão de energia por engrenagens.

---

## 📖 Visão Geral (Game Concept)

Em um mundo pós apocaliptico você tenta sobreviver em uma fábrica utilizando cadeias de engrenagens para ligar maquinas de defesa.
---

## 🎮 Mecânicas Principais

### 1. Sistema de conexão de entidades por engrenagens
* **Conectividade:** As máquinas de defesa exigem conexão contínua com a rede de engrenagens alimentada pelo Núcleo.
* **Bloqueio e Planejamento:** Máquinas bloqueiam o posicionamento direto de engrenagens, exigindo planejamento espacial no grid para contornar obstáculos.
* **Avarias e Desconexão:** Se a cadeia de engrenagens for interrompida ou uma máquina quebrar, todas as defesas dependentes daquela linha param de funcionar imediatamente.

### 2. Coleta de Recursos e Economia
* **Suprimentos Aéreos:** recursos caem periodicamente no mapa (com um *drop* rápido no início da partida para acelerar a montagem e *drops* ritmados subsequentes).
* **Coleta Direta:** O jogador deve clicar nos suprimentos em queda para adicioná-los ao seu estoque.
* **Refinarias:** Construções que geram recursos extras passivamente ao longo do tempo.

### 3. Sistema de Cartas e Construção
* Arraste de cards da interface (*HUD*) para posicionamento direto no mapa.
* Feedback visual (*juice*) com animações de *hover*, variação de escala e efeito de *shake* ao selecionar e construir.
* Caixas de contexto (*Tooltips*) com descrições objetivas dos efeitos e custos ao passar o mouse sobre cada carta.

### 4. Ferramenta de Desmontagem
* Permite remover qualquer autômato construído no mapa.
* Devolve **50% do custo** em engrenagens de volta ao estoque do jogador.
* Apresenta destaque visual na máquina focada e partículas de desacoplamento (*pop-out*) ao desmontar.

---

## 🛠️ Arsenal e Autômatos

| Ícone | Nome | Custo | Descrição |
| :---: | :--- | :---: | :--- |
| ⚙️ | **Engrenagem** | `10` | Necessários para as máquinas funcionarem. |
| 🏭 | **Refinaria** | `20` | Gera engrenagens extras de tempos em tempos. |
| 🔫 | **Torreta** | `40` | Atira projéteis contra os inimigos. |
| 💣 | **Explosivo** | `60` | Detona em área ao ser pisada. |
| ⚡ | **Stunner** | `70` | Disparos que desaceleram os inimigos. |
| 💥 | **Cano Duplo** | `80` | Dispara mais projéteis. |

---

## 👾 Sistema de Ondas (Wave System)

* **Alerta de Invasão:** Indicadores visuais piscam nas *lanes* (linhas do mapa) antes do início de uma horda, sinalizando de onde os inimigos surgirão.
* **HUD Dinâmico:** Monitoramento no canto superior direito indicando o número da onda atual, avisos de preparação e progresso de contagem de inimigos em tempo real.

---

## 🎓 Tutorial Integrado

* Sistema de *pop-ups* direcionados com pausa contextual do jogo.
* Apresentação passo a passo das mecânicas essenciais: objetivo, coleta de recursos, posicionamento e alertas de horda.
* **Gatilho Dinâmico:** Se qualquer autômato for desconectado ou pifar durante a partida, o tutorial pausa o jogo e aponta diretamente para a máquina afetada explicando como reconectá-la.

---

## 🛠️ Tecnologias Utilizadas

* **Engine:** GameMaker Studio 2
* **Linguagem:** GML (GameMaker Language)
* **Estilo Artístico:** Pixel Art 2D / Steampunk

---

## ✒️ Desenvolvedor

Desenvolvido para fins acadêmicos / Game Jam.
