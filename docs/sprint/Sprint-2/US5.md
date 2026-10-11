# Visualização e gerenciamento de pré-guias recebidas
## Resumo
Como funcionário do setor de Guias do FUSEX, quero visualizar e gerenciar os detalhes de uma pré-guia recebida, para que eu possa gerar uma Guia digital com as informações coletadas.
## Sobre a gestão pelo setor de Guias:
O funcionário do setor de Guias opera através de uma conta de setor genérica (`SETOR_GUIAS`). Ele gerencia a fila de pré-guias enviadas por beneficiários ou médicos. Ao abrir uma pré-guia pela primeira vez, seu status muda automaticamente para *Em Análise*. O funcionário confere os dados e o encaminhamento/exames para gerar externamente a Guia oficial no SIRE, inserindo posteriormente o arquivo PDF correspondente na plataforma para coleta das assinaturas.
## Detalhamento do processo:
1. O funcionário do setor de Guias acessa o sistema com suas credenciais de setor.
2. O sistema exibe a fila de pré-guias com status *Pendente*. Ao selecionar uma pré-guia, o status muda automaticamente para **Em Análise**.
3. O funcionário analisa as informações do beneficiário, a OCS escolhida e o encaminhamento anexado (ou exames solicitados pelo médico).
4. Caso haja inconformidade (ex: imagem ilegível), o funcionário altera o status para **Atenção** e preenche obrigatoriamente o campo de **observação** orientando a correção.
5. Estando tudo correto, o funcionário emite a Guia no sistema externo (SIRE) e realiza o upload do arquivo PDF da Guia gerada no Nexus, vinculando-a à pré-guia para que seja enviada aos médicos e ao chefe do FUSEX para assinatura.
## Critérios de aceitação:
- Certifique-se de que a abertura de uma pré-guia com status *Pendente* altere automaticamente seu status para *Em Análise*.
- Certifique-se de que o funcionário possa retornar a pré-guia para o status *Atenção*, exigindo o preenchimento obrigatório de uma observação explicativa.
- Certifique-se de que o funcionário consiga realizar o upload da Guia oficial em formato PDF e vinculá-la à pré-guia correspondente.
- Certifique-se de que contas de setor registrem a ação genérica no histórico, sem expor nomes de pessoas físicas.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: transição automática de status (*Pendente* → *Em Análise*), regra de atribuição de status *Atenção* com observação obrigatória e upload do PDF da Guia.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre a gestão pelo setor de Guias" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Alta**.
- Esforço definido pela equipe: 

