# Envio e assinatura digital de Guias para as OCS
## Resumo
Como beneficiário, quero ter a possibilidade de enviar e assinar Guias para as OCS de forma totalmente digital, para que eu não corra o risco de perder a Guia física ou de rasurá-la.
## Sobre o envio e a assinatura de sessões:
Uma Guia só aparece em **Minhas guias** (e só pode ser enviada à OCS) depois das duas assinaturas, do médico e do chefe do FUSEX (US6). Antes disso, o beneficiário a acompanha apenas como pré-guia *Em análise*. O envio **não exige assinatura**: ele cria as sessões autorizadas da Guia, todas disponíveis. A assinatura acontece depois, sessão por sessão: a OCS solicita a assinatura de uma sessão e quem age pelo paciente a assina com a própria assinatura digital cadastrada (US8).

Cada unidade da quantidade autorizada de um procedimento gera uma sessão, que representa uma ida do paciente à OCS. Só a sessão **assinada** é cobrável. Assinatura não pode ser desfeita, e o número de sessões assinadas de um procedimento nunca passa da quantidade autorizada. A OCS **não altera nada da Guia** (exames, quantidades, validade, dados do beneficiário ou PDF): ela apenas recebe a Guia e solicita assinaturas.

Quem age pelo paciente (envia a Guia e assina as sessões, sempre com a própria assinatura):
- o **titular**, por si e pelos menores sob a guarda dele;
- o **dependente maior de idade**, por si (US14);
- o **responsável legal**, pelos menores que acompanha (US14).

Situações da sessão:
- **Disponível:** criada quando a Guia é enviada à OCS, ainda não solicitada.
- **Solicitada:** a OCS pediu a assinatura.
- **Assinada:** assinada por quem pode assinar. É cobrável.
- **Expirada:** não foi assinada até a validade vencer. Não é cobrável.

Situações da Guia exibidas ao beneficiário (em **Minhas guias** e na lista da OCS):
- **Não enviada:** pronta, ainda não enviada à OCS.
- **Enviada:** enviada à OCS, sem nenhuma sessão solicitada.
- **Em execução:** dentro da validade, com sessão solicitada ou assinada, mas nem todas assinadas.
- **Realizada:** todas as sessões assinadas.
- **Encerrada:** validade vencida e ao menos uma sessão assinada.
- **Vencida:** validade vencida e nenhuma sessão assinada. Não aceita novas solicitações, não entra no espelho e sai da lista da OCS, mas continua visível para o beneficiário, com aviso.

Ao vencer a validade, as sessões não assinadas viram **Expiradas**. A validade é somente a data impressa em "NÃO RECEBER APÓS" na Guia (lida do PDF pelo setor de Guias), e a Guia vale até o fim desse dia, no horário de Brasília. Não existe rotina agendada: a virada ocorre sempre que a Guia é lida (lista do beneficiário, lista e detalhe da OCS, solicitação de sessão) e antes de cada assinatura.
## Detalhamento do processo:
**Envio pelo beneficiário (Minhas guias):**
1. O beneficiário (ou o responsável legal, pelos menores que acompanha) loga no aplicativo e acessa **Minhas guias**. A pré-guia *Concluída* continua em **Minhas pré-guias**, onde ele pode visualizar, baixar ou imprimir o PDF da Guia.
2. A Guia aparece com a situação **Não enviada** e o botão **Enviar para a OCS**. Acima da lista, o filtro **Mostrar** permite ver **Todas** (padrão), **Em andamento** (Não enviada, Enviada e Em execução) ou **Finalizadas** (Realizada, Encerrada e Vencida). O botão **Ver guia (PDF)** abre a Guia no visualizador, com zoom e tela cheia.
3. A tela de confirmação mostra o número da Guia, o procedimento, as sessões autorizadas e a OCS. A OCS é a escolhida na pré-guia e **não pode ser trocada** no envio. O beneficiário confirma o envio.
4. O sistema grava a data e quem enviou, muda a situação para **Enviada** e cria uma sessão para cada unidade autorizada de cada procedimento, todas **Disponíveis**. Guia sem validade gravada ("Guia sem validade") ou sem exames cadastrados ("Guia sem exames cadastrados") não pode ser enviada.

**Solicitação pela OCS (Guias recebidas):**
5. A OCS vê apenas as Guias que foram enviadas para ela, com busca por nome, número da Guia ou Prec CP, e abre o detalhe da Guia (dados lidos do PDF, procedimentos autorizados e botão **Ver guia (PDF)**).
6. Para cada procedimento, a OCS vê a grade de sessões, de 1 até a quantidade autorizada, com cores: verde = assinada, amarelo = solicitada, branco = disponível, cinza riscado = expirada.
7. A OCS seleciona uma sessão **Disponível** e clica em **Requerer assinatura**. A sessão passa para **Solicitada**, com a data e quem solicitou. Para pedir outra sessão, ela repete a ação, uma por vez (mesmo que haja mais de uma sessão no mesmo dia). Só a OCS da Guia pode solicitar, e não é possível solicitar em Guia vencida.

**Assinatura pelo beneficiário (Minhas guias):**
8. O beneficiário abre a Guia e vê a tela **Sessões para assinar**, com as sessões *Solicitadas* daquela Guia.
9. Ele assina uma sessão por vez com a assinatura cadastrada, confirmando a ação. O sistema guarda a assinatura usada, a data e quem assinou. A sessão passa para **Assinada** e não pode ser desfeita.
10. Se a validade já tiver passado, a assinatura é recusada ("Esta Guia venceu em dd/mm/aaaa. A sessão não pode mais ser assinada."), a Guia vira *Encerrada* ou *Vencida* e as sessões solicitadas viram **Expiradas**.
11. Se o beneficiário não tiver assinatura cadastrada, o sistema mostra: "Você ainda não tem assinatura cadastrada. Cadastre em Minhas informações para assinar." A sessão continua **Solicitada**.

**Avisos e PDF:**
12. Guia **Encerrada**: "A sua Guia expirou antes de você realizar todas as assinaturas. Será necessário o requerimento de uma nova Guia." Guia **Vencida**: "A sua Guia expirou e você não realizou nenhuma assinatura. Será necessário o requerimento de uma nova Guia."
13. O PDF da Guia é o mesmo para o beneficiário, a OCS e a recepção. O campo "Assinatura do Responsável" fica em branco enquanto a Guia não está finalizada. Quando a Guia fica *Realizada* ou *Encerrada*, o PDF passa a trazer a assinatura usada na última sessão assinada. Na Guia *Vencida*, a assinatura não é inserida. O arquivo guardado pelo setor de Guias não é alterado: as assinaturas são inseridas na hora de montar o PDF.
## Critérios de aceitação:
- Certifique-se de que a Guia só apareça em Minhas guias, e só possa ser enviada, depois das assinaturas do médico e do chefe (pré-guia *Concluída*).
- Certifique-se de que o envio exija confirmação explícita, mostre número da Guia, procedimento, sessões autorizadas e OCS, não permita trocar a OCS e crie as sessões autorizadas como *Disponíveis*.
- Certifique-se de que a situação da Guia mude para *Enviada* e que o envio registre data e quem enviou.
- Certifique-se de que Guia sem validade gravada ou sem exames cadastrados não possa ser enviada, com a mensagem de erro correspondente.
- Certifique-se de que a OCS veja apenas as Guias enviadas a ela, solicite uma sessão *Disponível* por vez, não consiga solicitar em Guia vencida e não consiga alterar nenhum dado da Guia.
- Certifique-se de que quem age pelo paciente (titular, dependente maior ou responsável legal) assine uma sessão *Solicitada* por vez, com a própria assinatura cadastrada, e que a sessão assinada não possa ser desfeita.
- Certifique-se de que o sistema bloqueie a assinatura sem assinatura cadastrada, mostrando a mensagem de orientação, e mantenha a sessão como *Solicitada*.
- Certifique-se de que o número de sessões assinadas de um procedimento nunca passe da quantidade autorizada.
- Certifique-se de que, após a validade (data de "NÃO RECEBER APÓS"), a assinatura seja recusada e as sessões não assinadas virem *Expiradas*, sem cobrança.
- Certifique-se de que as situações da Guia (*Não enviada*, *Enviada*, *Em execução*, *Realizada*, *Encerrada* e *Vencida*), o filtro **Mostrar** e os avisos de Guia *Encerrada* e *Vencida* sejam exibidos conforme descrito.
- Certifique-se de que o PDF da Guia traga a assinatura do beneficiário apenas quando a Guia estiver *Realizada* ou *Encerrada*.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: envio com confirmação, criação de sessões, solicitação de assinatura pela OCS, assinatura de sessão por quem age pelo paciente, situações da sessão e da Guia, validade pela data de "NÃO RECEBER APÓS" e assinatura no PDF.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre o envio e a assinatura de sessões" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Média**.
- Esforço definido pela equipe: 5

