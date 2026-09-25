# Anexação do encaminhamento médico digitalizado
## Resumo
Como beneficiário, quero anexar o encaminhamento médico digitalizado ao meu cadastro, para que ele sirva de base na criação da pré-guia.
## Sobre o encaminhamento médico:
O encaminhamento médico é o documento emitido pelo médico e entregue ao beneficiário, servindo de base obrigatória para a criação da pré-guia. Ele é anexado como um arquivo (foto ou PDF) no momento da criação da pré-guia, não sendo mais tratado como uma entidade própria no sistema — o arquivo fica armazenado como parte dos dados da própria pré-guia. Dentro do sistema, ele deve conter:
- O arquivo digitalizado (PDF ou imagem)
## Detalhamento do processo:
1. O beneficiário loga no sistema.
2. O beneficiário inicia a criação de uma pré-guia.
3. Durante o preenchimento, o beneficiário anexa o arquivo do encaminhamento médico (foto ou PDF).
4. O sistema valida o formato e tamanho do arquivo.
5. O arquivo é armazenado como parte dos dados da pré-guia sendo criada.
## Critérios de aceitação:
- Certifique-se que o beneficiário consegue anexar um arquivo válido e legível.
- Certifique-se que o sistema rejeita arquivos fora do formato/tamanho permitido.
- Certifique-se que o encaminhamento seja tratado como parte dos dados da pré-guia, não como uma entidade separada no banco de dados.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: arquivo digitalizado (PDF ou imagem) anexado no momento da criação da pré-guia.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre o encaminhamento médico" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Alta**.
- Esforço definido pela equipe: **G**.

## Definition of Done (DoD)
- O código está escrito, testado e limpo (seguindo os padrões da equipe).
- A funcionalidade está integrada à branch **develop** do repositório [BD_3S_BACKEND](https://github.com/DATASQUAD-3SEM/BD_3S_BACKEND) ou **develop** do repositório [BD_3S_FRONTEND](https://github.com/DATASQUAD-3SEM/BD_3S_FRONTEND).
- Os critérios de aceitação desta User Story foram completos.
- A interface leva em consideração a facilidade de uso ao usuário.
- A funcionalidade foi testada e aprovada pelo Product Owner (PO).