# Criação digital da pré-guia
## Resumo
Como beneficiário, quero criar a pré-guia de forma digital informando a OCS e os procedimentos/exames a serem realizados, para que eu não precise ir pessoalmente ao FUSEX com o encaminhamento em mãos.
## Sobre a pré-guia:
A pré-guia é o documento criado pelo beneficiário dentro do sistema, com base em um encaminhamento médico anexado no momento da criação, e que dará origem à Guia após aprovação do FUSEX. Ela contém os seguintes valores:
- A OCS escolhida
- O status da pré-guia (ex: Pendente, Em análise, Aprovada)
- A data de criação
- O arquivo do encaminhamento médico anexado
- O beneficiário ao qual está vinculada
## Detalhamento do processo:
1. O beneficiário loga no sistema.
2. O beneficiário inicia a criação da pré-guia e anexa o encaminhamento médico (arquivo).
3. O beneficiário seleciona a OCS entre as opções credenciadas disponíveis no sistema.
4. O sistema salva a pré-guia com status "Pendente", vinculada ao beneficiário, com o encaminhamento anexado e a OCS escolhida.
## Critérios de aceitação:
- Certifique-se que não seja possível criar uma pré-guia sem anexar um encaminhamento médico válido.
- Certifique-se que a pré-guia exija a seleção de uma OCS credenciada dentre as disponíveis no sistema.
- Certifique-se que a pré-guia criada fique vinculada ao beneficiário logado, com o encaminhamento anexado e a OCS escolhida.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: encaminhamento médico anexado (arquivo) e OCS credenciada selecionada.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre a pré-guia" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Alta**.
- Esforço definido pela equipe: **M**.

## Definition of Done (DoD)
- O código está escrito, testado e limpo (seguindo os padrões da equipe).
- A funcionalidade está integrada à branch **develop** do repositório [BD_3S_BACKEND](https://github.com/DATASQUAD-3SEM/BD_3S_BACKEND) ou **develop** do repositório [BD_3S_FRONTEND](https://github.com/DATASQUAD-3SEM/BD_3S_FRONTEND).
- Os critérios de aceitação desta User Story foram completos.
- A interface leva em consideração a facilidade de uso ao usuário.
- A funcionalidade foi testada e aprovada pelo Product Owner (PO).