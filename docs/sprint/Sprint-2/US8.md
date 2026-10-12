# Inclusão de assinatura digital no perfil
## Resumo
Como um usuário do aplicativo, quero incluir uma assinatura digital em meu perfil após a conclusão do meu cadastro, para que eu possa assinar as Guias com menos gargalos e burocracias.
## Sobre a assinatura digital:
A assinatura digital (`assinatura_url`) é o recurso que permite aos perfis habilitados (Beneficiários, Médicos do FUSEX e Chefe do FUSEX) assinar documentos eletronicamente sem a necessidade de deslocamento físico ou papéis. Contas de setor (`SETOR_GUIAS` e `RECEPCAO`) não possuem assinatura digital. O cadastro da assinatura é realizado pelo próprio usuário em sua área de perfil após o primeiro acesso.
## Detalhamento do processo:
1. O usuário realiza seu cadastro ou login inicial no Nexus.
2. Na seção de gerenciamento de perfil, o usuário acessa a opção de cadastrar ou atualizar sua assinatura digital.
3. O usuário insere sua assinatura (por meio de desenho na tela, upload de imagem ou mecanismo padrão definido pela equipe).
4. O sistema valida e armazena o arquivo/URL da assinatura vinculada ao cadastro do usuário (`assinatura_url`), deixando-a pronta para uso nos fluxos de validação de Guias.
## Critérios de aceitação:
- Certifique-se de que os usuários elegíveis (Beneficiários, Médicos e Chefe do FUSEX) consigam cadastrar e atualizar sua assinatura digital (`assinatura_url`) diretamente em seu perfil.
- Certifique-se de que contas de setor (`SETOR_GUIAS` e `RECEPCAO`) não apresentem campos ou permissões de assinatura digital.
- Certifique-se de que o sistema armazene corretamente a assinatura e a utilize nos módulos de assinatura de guias quando acionada pelo usuário.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: campo `assinatura_url` no modelo de usuário, restrição de perfis aptos versus contas de setor, e tela de gerenciamento de perfil.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre a assinatura digital" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Média**.
- Esforço definido pela equipe: 7

