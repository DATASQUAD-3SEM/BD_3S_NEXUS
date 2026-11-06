# Envio e assinatura digital de Guias para as OCS
## Resumo
Como beneficiário, quero ter a possibilidade de enviar e assinar Guias para as OCS de forma totalmente digital, para que eu não corra o risco de perder a Guia física ou de rasurá-la.
## Sobre o envio e a assinatura de sessões:
Uma Guia concluída (pré-guia *Concluída*, com as duas assinaturas, US6) pode ser enviada pelo beneficiário à OCS escolhida. O envio **não exige assinatura**: ele cria as sessões autorizadas da Guia, todas disponíveis. A assinatura acontece depois, sessão por sessão: a OCS solicita a assinatura de uma sessão e o beneficiário a assina com a assinatura digital cadastrada (US8).

Cada unidade autorizada de um procedimento gera uma sessão. Só a sessão **assinada** é cobrável. Assinatura não pode ser desfeita, e o número de sessões assinadas de um procedimento nunca passa da quantidade autorizada.

Situações da Guia exibidas ao beneficiário:
- **Não enviada:** pronta, ainda não enviada à OCS.
- **Enviada:** enviada à OCS, sem nenhuma sessão solicitada.
- **Em execução:** dentro da validade, com sessão solicitada ou assinada, mas nem todas assinadas.
- **Realizada:** todas as sessões assinadas.
- **Encerrada:** validade vencida e ao menos uma sessão assinada.
- **Vencida:** validade vencida e nenhuma sessão assinada.

Ao vencer a validade, as sessões não assinadas viram **Expiradas** e não são cobráveis.
## Detalhamento do processo:
1. O beneficiário loga no aplicativo e acessa **Minhas pré-guias**.
2. Ele abre um card com status **Concluída** e clica em **Enviar para a OCS**.
3. A tela de confirmação mostra o número da Guia, o procedimento, as sessões autorizadas e a OCS. O beneficiário confirma o envio.
4. O sistema grava a data e quem enviou, muda a situação para **Enviada** e cria uma sessão para cada unidade autorizada de cada procedimento, todas com situação **Disponível**.
5. A OCS abre a Guia e solicita a assinatura de uma sessão por vez (**Disponível** → **Solicitada**). Ela pode solicitar outra sessão repetindo a ação.
6. O beneficiário abre a Guia e vê a tela **Sessões para assinar**, com as sessões solicitadas.
7. Ele assina uma sessão por vez com a assinatura cadastrada. O sistema guarda a assinatura usada, a data e quem assinou. A sessão passa para **Assinada**.
8. Se o beneficiário não tiver assinatura cadastrada, o sistema mostra: "Você ainda não tem assinatura cadastrada. Cadastre em Minhas informações para assinar." A sessão continua **Solicitada**.
## Critérios de aceitação:
- Certifique-se de que o envio só esteja disponível para Guias com pré-guia *Concluída*.
- Certifique-se de que o envio exija confirmação explícita e crie as sessões autorizadas como *Disponíveis*.
- Certifique-se de que a situação da Guia mude para *Enviada* e que o envio registre data e quem enviou.
- Certifique-se de que o beneficiário assine uma sessão *Solicitada* por vez, com a assinatura cadastrada, e que a sessão assinada não possa ser desfeita.
- Certifique-se de que o sistema bloqueie a assinatura sem assinatura cadastrada, mostrando a mensagem de orientação, e mantenha a sessão como *Solicitada*.
- Certifique-se de que o beneficiário titular, ou o dependente com conta (US14), consiga assinar as sessões da própria Guia.
- Certifique-se de que o número de sessões assinadas de um procedimento nunca passe da quantidade autorizada.
- Certifique-se de que, após a validade, as sessões não assinadas virem *Expiradas*.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: envio com confirmação, criação de sessões, solicitação de assinatura pela OCS, assinatura de sessão pelo beneficiário e situações da Guia.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre o envio e a assinatura de sessões" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Média**.
- Esforço definido pela equipe: 5

