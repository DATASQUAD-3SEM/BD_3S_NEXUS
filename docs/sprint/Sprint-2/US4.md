# Criação digital da pré-guia pelo médico do FUSEX
## Resumo
Como médico do FUSEX, quero ter a possibilidade de criar uma pré-guia para um beneficiário durante uma consulta, para que não haja a necessidade de entregar um encaminhamento físico ao beneficiário.
## Sobre a criação de pré-guia médica:
Quando o beneficiário passa em consulta diretamente com um médico do FUSEX (Rota 2), o próprio profissional gera a pré-guia dentro da aplicação. Diferente da rota do beneficiário, nesta modalidade não é necessário anexar arquivo de encaminhamento digitalizado; em contrapartida, o médico deve selecionar a OCS desejada e informar obrigatoriamente ao menos um procedimento médico/exame do catálogo.
## Detalhamento do processo:
1. O médico do FUSEX loga em sua conta no sistema.
2. Durante o atendimento, o médico solicita o número do **Prec-CP** do beneficiário.
3. O sistema busca e preenche automaticamente os dados do beneficiário (Nome, CPF, idade, telefone, etc.) com base no Prec-CP.
4. O médico seleciona a **OCS** de destino credenciada escolhida pelo paciente.
5. O médico seleciona a partir do catálogo do sistema ao menos **um procedimento/exame** necessário.
6. O médico confirma a emissão; a pré-guia é gerada no sistema e enviada diretamente ao setor de Guias com o status inicial **Pendente**.
## Critérios de aceitação:
- Certifique-se de que o médico consiga buscar o beneficiário informando o Prec-CP e que os dados do perfil sejam preenchidos automaticamente.
- Certifique-se de que a pré-guia gerada pelo médico não exija o upload de arquivo de encaminhamento, mas obrigue a seleção da OCS e de ao menos um procedimento do catálogo.
- Certifique-se de que a pré-guia criada pelo médico seja salva e encaminhada ao setor de Guias com o status *Pendente*.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: busca de beneficiário por Prec-CP, seleção de OCS, adição de procedimentos do catálogo e ausência de obrigatoriedade de anexo de arquivo.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre a criação de pré-guia médica" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Alta**.
- Esforço definido pela equipe: 

