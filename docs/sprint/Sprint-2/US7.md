# Impressão de Guia na recepção
## Resumo
Como beneficiário, quero ter a possibilidade de conseguir a Guia impressa indo até a recepção do FUSEX, para o caso de eu estar sem acesso ao aplicativo.
## Sobre a impressão na recepção:
A recepção do FUSEX conta com um usuário de setor específico (`RECEPCAO`) que possui permissão para acessar e imprimir Guias oficiais em formato PDF exclusivamente para beneficiários que estejam sem acesso ao aplicativo (por exemplo, sem celular ou computador). É importante ressaltar que a recepção só consegue visualizar, baixar e imprimir Guias que estejam estritamente com o status **Concluída**.
## Detalhamento do processo:
1. O beneficiário que estiver sem acesso ao aplicativo comparece fisicamente à recepção do FUSEX informando seus dados/Prec-CP.
2. O atendente da recepção loga no sistema com a conta de setor `RECEPCAO`.
3. O atendente localiza a pré-guia/Guia do beneficiário que já possua o status **Concluída**.
4. O atendente realiza o download e a impressão física do arquivo PDF da Guia para entrega ao beneficiário.
## Critérios de aceitação:
- Certifique-se de que a conta de setor da recepção (`RECEPCAO`) consiga localizar e acessar apenas as Guias vinculadas a pré-guias com status *Concluída*.
- Certifique-se de que o sistema bloqueie o acesso da recepção a pré-guias em andamento (*Pendente*, *Em Análise* ou *Atenção*).
- Certifique-se de que o atendente consiga gerar a impressão ou download do arquivo PDF da Guia de forma ágil.

## Definition of Ready (DoR)
- Itens mandatórios já identificados: perfil de setor `RECEPCAO`, restrição de visualização restrita a pré-guias com status *Concluída*, e acesso ao PDF para impressão.
- Clara separação entre instruções, descrição e exemplos (ver seções "Sobre a impressão na recepção" e "Detalhamento do processo").
- Critérios de aceitação e regras de negócio definidos.
- Prioridade definida: **Média**.
- Esforço definido pela equipe: 4

