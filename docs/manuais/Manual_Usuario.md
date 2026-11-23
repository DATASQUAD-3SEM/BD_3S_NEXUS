# 📗 Manual do Usuário — NEXUS

### Sistema de apoio ao fluxo de Guias, Espelhos e Faturas do FUSEX

> ℹ️ O NEXUS ainda está em desenvolvimento. Algumas telas são protótipos e podem não ser idênticas ao modelo final. Se uma tela do seu sistema estiver um pouco diferente do que está descrito aqui, o funcionamento geral continua o mesmo.

* * *

## Sumário

1. [Visão Geral do Sistema](#1-visão-geral-do-sistema)
2. [Glossário](#2-glossário)
3. [Acesso ao Sistema](#3-acesso-ao-sistema)
4. [Como a tela é organizada (vale para todos os perfis)](#4-como-a-tela-é-organizada-vale-para-todos-os-perfis)
5. [Módulo do Beneficiário, do Dependente Maior e do Responsável Legal](#5-módulo-do-beneficiário-do-dependente-maior-e-do-responsável-legal)
    * 5.1 [Início](#51-início)
    * 5.2 [Nova pré-guia](#52-nova-pré-guia)
    * 5.3 [Minhas pré-guias](#53-minhas-pré-guias)
    * 5.4 [Corrigir uma pré-guia em Atenção](#54-corrigir-uma-pré-guia-em-atenção)
    * 5.5 [Minhas guias](#55-minhas-guias)
    * 5.6 [Minhas informações](#56-minhas-informações)
6. [Módulo do Médico do FUSEX](#6-módulo-do-médico-do-fusex)
    * 6.1 [Início](#61-início)
    * 6.2 [Nova pré-guia](#62-nova-pré-guia-médico)
    * 6.3 [Corrigir pré-guias](#63-corrigir-pré-guias)
    * 6.4 [Guias para assinar](#64-guias-para-assinar-médico)
    * 6.5 [Minhas informações](#65-minhas-informações-médico)
7. [Módulo do Chefe do FUSEX](#7-módulo-do-chefe-do-fusex)
    * 7.1 [Guias para assinar](#71-guias-para-assinar-chefe)
    * 7.2 [Beneficiários](#72-beneficiários)
    * 7.3 [Dependentes de um titular](#73-dependentes-de-um-titular)
    * 7.4 [Médicos](#74-médicos)
    * 7.5 [Minhas informações](#75-minhas-informações-chefe)
8. [Módulo do Setor de Guias](#8-módulo-do-setor-de-guias)
    * 8.1 [Fila de pré-guias](#81-fila-de-pré-guias)
    * 8.2 [Tela da pré-guia](#82-tela-da-pré-guia)
9. [Módulo da Recepção](#9-módulo-da-recepção)
10. [Módulo da OCS](#10-módulo-da-ocs)
    * 10.1 [Guias recebidas](#101-guias-recebidas)
    * 10.2 [Guias Finalizadas](#102-guias-finalizadas)
    * 10.3 [Espelho](#103-espelho)
    * 10.4 [Glosas Recebidas](#104-glosas-recebidas)
11. [Módulo do Setor de Faturas](#11-módulo-do-setor-de-faturas)
    * 11.1 [Espelhos recebidos](#111-espelhos-recebidos)
    * 11.2 [Faturas Auditadas](#112-faturas-auditadas)
12. [Módulo da Rastreabilidade](#12-módulo-da-rastreabilidade)
    * 12.1 [Faturas Recebidas (lisura)](#121-faturas-recebidas-lisura)
    * 12.2 [Versos das Guias](#122-versos-das-guias)
13. [Módulo da Auditoria](#13-módulo-da-auditoria)
    * 13.1 [Faturas Recebidas](#131-faturas-recebidas-auditoria)
    * 13.2 [Faturas Analisadas](#132-faturas-analisadas)
14. [Fluxos Principais de Uso](#14-fluxos-principais-de-uso)
15. [Dúvidas Frequentes e Problemas Comuns](#15-dúvidas-frequentes-e-problemas-comuns)

* * *

## 1. Visão Geral do Sistema

O **NEXUS** é um sistema web que organiza, do começo ao fim, o caminho de um atendimento do **FUSEX** (Fundo de Saúde do Exército): da **pré-guia** pedida pelo beneficiário ou pelo médico até a **fatura** conferida e concluída. Ele elimina papéis repetidos e reduz erros como cobrança em duplicidade, assinatura faltando e valor errado.

O sistema funciona **no navegador** (computador ou celular) e cada pessoa vê **somente o que é do seu perfil**.

### Resumo do caminho de uma Guia

1. O **beneficiário** (ou o **médico**) cria uma **pré-guia**.
2. O **Setor de Guias** analisa. Se estiver tudo certo, emite a **Guia** no SIRE e anexa o PDF no NEXUS. Se algo estiver errado, devolve com uma observação (status **Atenção**).
3. O **médico** e o **chefe do FUSEX** assinam a Guia digitalmente.
4. A Guia aparece em **Minhas guias**. O **beneficiário** a envia à **OCS** (rede credenciada).
5. A OCS pede a assinatura de uma **sessão** por vez e o beneficiário assina.
6. A OCS monta o **Espelho** (documento de cobrança) e o envia ao FUSEX.
7. O **Setor de Faturas** protocola o espelho, que passa a ser uma **Fatura**.
8. A **Rastreabilidade** confere os valores (**lisura**) e registra as diferenças (**glosa**).
9. Se houver glosa, a **OCS** decide, guia por guia, se concorda (**Ok**) ou **Contesta**.
10. A **Auditoria** visualiza a fatura e o fluxo termina no NEXUS. O pagamento acontece fora do sistema.

### Perfis de usuário

| Perfil | Como entra | O que faz |
|---|---|---|
| **Beneficiário (titular)** | CPF | Cria e acompanha pré-guias, corrige as devolvidas, envia as Guias à OCS e assina as sessões. Também age pelos menores sob a sua guarda |
| **Dependente maior de idade** | CPF | Mesmo funcionamento do beneficiário, mas só para si |
| **Responsável legal (externo)** | CPF | Age somente pelos menores que acompanha: cria pré-guias, envia Guias à OCS e assina as sessões |
| **Médico do FUSEX** | CPF | Cria pré-guias durante a consulta, corrige as devolvidas e assina as Guias |
| **Chefe do FUSEX** | Nome de usuário | Assina as Guias e cadastra/edita beneficiários, dependentes, responsáveis legais e médicos |
| **Setor de Guias** | Nome de usuário | Analisa pré-guias, pede correção e anexa a Guia emitida no SIRE |
| **Recepção** | Nome de usuário | Visualiza e imprime Guias concluídas |
| **OCS** | Nome de usuário | Recebe Guias, pede assinatura das sessões, monta e envia o espelho e decide as glosas |
| **Setor de Faturas** | Nome de usuário | Recebe os espelhos, protocola a fatura e a envia à rastreabilidade |
| **Rastreabilidade** | Nome de usuário | Faz a lisura e a glosa, envia as glosas à OCS e imprime o verso das Guias glosadas |
| **Auditoria** | Nome de usuário | Visualiza a fatura já conferida e conclui o fluxo |

> **Importante:** cada perfil acessa apenas as telas do seu módulo. Se você tentar abrir o endereço de outro perfil, o sistema o leva de volta para a sua própria área.

> **Dependente menor de idade não tem conta.** Quem age por ele é o titular ou o responsável legal, com a própria assinatura.

* * *

## 2. Glossário

| Termo | Definição |
|---|---|
| **FUSEX** | Fundo de Saúde do Exército: sistema de assistência médico-hospitalar para os beneficiários do Exército. |
| **Beneficiário / Titular** | Militar (da ativa, reserva ou reformado) ou pensionista com direito ao FUSEX. |
| **Dependente** | Pessoa ligada a um titular (cônjuge, filho etc.), cadastrada **somente pelo chefe do FUSEX**. |
| **Responsável legal (externo)** | Pessoa sem Prec CP, cadastrada pelo chefe para agir em nome de um dependente menor. |
| **Prec CP** | Número do cartão do beneficiário ou do dependente. |
| **Encaminhamento médico** | Documento do médico que pede o exame. É anexado à pré-guia criada pelo beneficiário (foto ou PDF). |
| **Pré-guia** | Pedido criado no NEXUS, com o paciente, a OCS e o encaminhamento (ou os exames, quando criada pelo médico). |
| **Guia** | Documento oficial emitido no SIRE, com a OCS, os procedimentos, a validade e as assinaturas do médico e do chefe. |
| **SIRE** | Sistema do Exército que emite as Guias. O NEXUS não acessa o SIRE: o setor de Guias anexa o PDF. |
| **Validade da Guia** | Data impressa em "NÃO RECEBER APÓS" na Guia. Depois dela, a Guia não aceita novas sessões. |
| **Cod DGP** | Código de cobrança do procedimento na Guia. |
| **Sessão** | Cada unidade autorizada de um procedimento (uma ida à OCS). **Só a sessão assinada é cobrável.** |
| **OCS** | Rede credenciada, conveniada ou contratada (laboratórios, clínicas, hospitais) que atende os beneficiários. |
| **Espelho** | Documento de cobrança que a OCS monta (em geral, um período de cerca de um mês), com as guias e os valores por sessão. |
| **Fatura** | O espelho depois de protocolado pelo Setor de Faturas, com número de fatura. |
| **Lisura** | Conferência dos valores da fatura contra o contrato da OCS. |
| **Glosa** | Diferença entre o valor informado pela OCS e o valor do contrato. |
| **Contestar** | Ação da OCS para discordar da glosa de uma guia. |
| **Auditoria** | Última etapa: apenas visualiza e conclui. Não devolve nada. |
| **Liquidação** | Pagamento da fatura. Acontece **fora** do NEXUS. |

### Situações da pré-guia

| Situação | Cor | Significado |
|---|---|---|
| **Pendente** | Amarelo | Criada e ainda não aberta pelo setor de Guias. |
| **Em análise** | Azul | O setor de Guias está analisando. Para o beneficiário, continua assim até as duas assinaturas. |
| **Atenção** | Laranja | Devolvida com uma observação para correção. |
| **Concluída** | Verde | A Guia foi emitida e assinada pelo médico e pelo chefe. |

### Situações da Guia (em "Minhas guias")

| Situação | Significado |
|---|---|
| **Não enviada** | Pronta, mas ainda não enviada à OCS. |
| **Enviada** | Enviada à OCS; nenhuma sessão foi solicitada. |
| **Em execução** | Há sessões solicitadas ou assinadas e nem todas foram assinadas. |
| **Realizada** | Todas as sessões foram assinadas. |
| **Encerrada** | A validade acabou e pelo menos uma sessão foi assinada. |
| **Vencida** | A validade acabou e nenhuma sessão foi assinada. |

### Situações do espelho/fatura (Setor de Faturas)

| Situação | Significado |
|---|---|
| **Sem nº de fatura** | Espelho recebido, ainda não protocolado. |
| **Protocolada** | Número da fatura inserido; pronta para ir à rastreabilidade. |
| **Em lisura** | Na rastreabilidade, sendo conferida. |
| **Aguardando a OCS** | As glosas foram enviadas à OCS, que deve decidir. |
| **Em auditoria** | Aguardando a visualização da auditoria. |
| **Concluída** | A auditoria visualizou. É o fim do fluxo no NEXUS. |

* * *

## 3. Acesso ao Sistema

### 3.1 Abrindo o sistema

Abra o navegador (Chrome, Edge ou Firefox) e digite o endereço informado pela sua equipe de TI. Em uma instalação local (veja o [Manual de Instalação](./Manual_Instalacao.md)), o endereço é:

```
https://localhost:5173
```

Na primeira vez, o navegador pode mostrar o aviso **"Sua conexão não é particular"**. Clique em **Avançado** e depois em **Ir para localhost (não seguro)**.

### 3.2 Tela de login

A tela de login mostra o título **Entrar** e os campos abaixo.

| Campo / botão | O que faz |
|---|---|
| **CPF ou nome de usuário** | Digite o seu login. **Beneficiário, dependente maior, responsável legal e médico** entram com o **CPF**. **Chefe e setores** (Setor de Guias, Recepção, OCS, Faturas, Rastreabilidade, Auditoria) entram com o **nome de usuário**. |
| **Senha** | Digite a sua senha. |
| **Mostrar / Ocultar** | Mostra ou esconde a senha digitada, para você conferir. |
| **Entrar** | Confirma o acesso. Enquanto o sistema verifica, o botão mostra "Entrando...". |

Embaixo do formulário aparece o texto **"Não tem acesso? O cadastro é feito pelo Chefe do FUSEX."** Ninguém se cadastra sozinho: a conta é criada pelo chefe (beneficiários, dependentes, responsáveis legais e médicos) ou já existe como conta de setor.

### 3.3 Mensagens de erro do login

| Mensagem | O que significa |
|---|---|
| **Preencha o CPF (ou nome de usuário) e a senha.** | Faltou preencher algum campo. |
| **CPF, usuário ou senha incorretos.** | Algum dado está errado. O sistema não diz qual, de propósito, por segurança. |
| **Conta desativada. Procure o Chefe do FUSEX.** | Sua conta foi desativada pelo chefe. |
| **Não foi possível entrar.** | Problema de conexão. Tente novamente em instantes. |

### 3.4 Acesso rápido (somente para demonstração)

Na versão de desenvolvimento, abaixo do login aparece o cartão **Acesso rápido (demonstração)**, com um botão **Entrar como …** para cada perfil (Beneficiário, Médico, Chefe, Setor de Guias, Setor de Faturas, Rastreabilidade, Auditoria, Recepção e OCS), todos com a senha `senha123`. Esse cartão **não aparece na versão de produção**. Há também o link **Testar conexão com o backend**, que abre uma página de diagnóstico.

### 3.5 Contas de exemplo

| Perfil | Login | Senha |
|---|---|---|
| Beneficiário | `52998224725` | `senha123` |
| Médico | `11144477735` | `senha123` |
| Responsável legal | `41282945009` | `senha123` |
| Chefe do FUSEX | `chefe.fusex` | `senha123` |
| Setor de Guias | `setor.guias` | `senha123` |
| Recepção | `recepcao` | `senha123` |
| OCS (laboratório) | `ocs.laboratorio` | `senha123` |
| Setor de Faturas | `setor.fatura` | `senha123` |
| Rastreabilidade | `rastreabilidade` | `senha123` |
| Auditoria | `auditoria` | `senha123` |

> Essas contas são **dados de demonstração**. Em uso real, as senhas são definidas pelo chefe e trocadas pelo próprio usuário.

### 3.6 Depois de entrar

O sistema leva você automaticamente para a tela inicial do seu perfil:

| Perfil | Tela inicial |
|---|---|
| Beneficiário e responsável legal | Início |
| Médico | Início |
| Chefe | Guias para assinar |
| Setor de Guias | Fila de pré-guias |
| Recepção | Guias para impressão |
| OCS | Espelho |
| Setor de Faturas | Espelhos recebidos |
| Rastreabilidade | Faturas Recebidas |
| Auditoria | Faturas Recebidas |

Se você tinha tentado abrir uma página antes de entrar, o sistema volta para ela depois do login.

### 3.7 Sair do sistema

Clique em **Sair**, no canto superior direito. A sessão é encerrada e você volta ao login. **Sempre saia ao usar um computador compartilhado.**

* * *

## 4. Como a tela é organizada (vale para todos os perfis)

### 4.1 Barra superior (faixa verde)

| Elemento | O que faz |
|---|---|
| **☰ (três traços)** | Aparece só no celular e em telas pequenas. Abre e fecha o menu lateral. |
| **Nexus** | Nome do sistema. Clicar leva à tela inicial do seu perfil. |
| **Nome do usuário · perfil** | Mostra quem está logado. Para o beneficiário e o médico aparece "Nome · Perfil" (o médico aparece com a patente); para os demais, só o nome do perfil. |
| **Sair** | Encerra a sessão. |

### 4.2 Menu lateral

Lista **somente as telas do seu perfil**. O item da tela em que você está fica destacado. No celular, o menu vira uma gaveta: abra pelo **☰** e ele fecha sozinho ao escolher uma opção (ou toque fora dele).

### 4.3 Comportamentos comuns

| Situação | Como o sistema se comporta |
|---|---|
| **Carregando…** | Aparece um aviso de carregamento enquanto os dados chegam. |
| **Erro ao carregar** | Aparece a mensagem de erro e o botão **Tentar novamente**. |
| **Lista vazia** | Aparece uma mensagem como "Nenhuma … encontrada". |
| **Ações sem volta** | Enviar o espelho, enviar glosas, confirmar decisão sobre glosas e marcar fatura como visualizada pedem **confirmação**. Leia o aviso antes de confirmar. |
| **Botões desabilitados (cinza)** | A ação ainda não está liberada porque falta algo. Muitas telas mostram o que falta. |
| **Paginação** | Em listas longas, use **Anterior** e **Próxima**, no rodapé. |
| **Datas e valores** | Datas em dia/mês/ano; valores em reais (R$). |

* * *

## 5. Módulo do Beneficiário, do Dependente Maior e do Responsável Legal

Estes três perfis usam **o mesmo menu**:

| Item do menu | Para que serve |
|---|---|
| **Início** | Tela inicial, com o resumo do que precisa da sua atenção e atalhos. |
| **Nova pré-guia** | Criar um pedido de Guia. |
| **Minhas pré-guias** | Acompanhar os pedidos e corrigir os devolvidos. |
| **Minhas guias** | Ver as Guias prontas, enviá-las à OCS e assinar as sessões. |
| **Minhas informações** | Seus dados, telefone, senha, assinatura e dependentes. |

**Quem é quem:**

- **Beneficiário (titular):** age por si e pelos **menores sob a sua guarda**.
- **Dependente maior de idade:** tem conta própria e age só por si.
- **Responsável legal (externo):** age só pelos **menores que acompanha** (não existe a opção "Você").

### 5.1 Início

Tela inicial do beneficiário, do dependente maior e do responsável legal. Ela o cumprimenta pelo primeiro nome ("Olá, [nome]"), mostra uma frase conforme o seu perfil e reúne o que precisa da sua atenção.

| Bloco | O que mostra |
|---|---|
| **Nova pré-guia** (botão no alto) | Atalho para criar um pedido de Guia. |
| **Alerta de assinatura** | Aparece somente quando há sessões esperando a sua assinatura e você ainda não cadastrou a sua. O botão **Cadastrar assinatura** leva a **Minhas informações**. |
| **O que precisa da sua atenção** | Quatro cartões com números: **Precisam de correção** (pré-guias em Atenção), **Com o setor de Guias** (pré-guias Pendentes ou Em análise), **Prontas para enviar à OCS** (Guias Não enviadas) e **Sessões para assinar**. Cada cartão com pendência tem um botão que leva à tela certa (**Ver pré-guias**, **Acompanhar**, **Enviar guias**, **Assinar sessões**). Sem pendência, o cartão fica esmaecido com "Nada pendente". Se um número não carregar, o cartão mostra "Não foi possível carregar." |
| **Atalhos** | **Nova pré-guia**, **Minhas pré-guias**, **Minhas guias** e **Minhas informações**. |

> Os números vêm das mesmas listas de **Minhas pré-guias** e **Minhas guias**.

### 5.2 Nova pré-guia

Use quando o médico lhe entregou um **encaminhamento** (papel ou foto) e você precisa pedir a Guia. A tela é preenchida de cima para baixo.

**Passo 1 — Paciente** (só aparece se houver mais de uma opção)

Pergunta **"Para quem é esta pré-guia?"** e mostra uma opção para cada paciente possível:

| Opção | Quem aparece |
|---|---|
| **Você (titular)** | O próprio titular. |
| **Você (dependente maior)** | O dependente maior logado. |
| **Nome (seu dependente, menor sob sua guarda)** | Menor sob a guarda do titular. |
| **Nome (menor que você acompanha como responsável legal)** | Menor acompanhado pelo responsável legal. |

Selecione a bolinha do paciente. Dependentes maiores de idade **não aparecem** para o titular, pois criam as próprias pré-guias; dependentes com vigência encerrada também não. Se houver **um único paciente**, este passo some.

**Dados do paciente** (somente leitura)

Mostra Nome, Data de nascimento, Faixa etária, Prec-CP, CPF, Idade e Telefone do paciente escolhido. Não é possível editar aqui.

**OCS**

Escolha a rede credenciada onde o exame será realizado.

| Campo | Como usar |
|---|---|
| **Buscar OCS** | Digite parte do nome, do contrato ou do tipo. A lista se atualiza sozinha. |
| **Lista de OCS** | Selecione a bolinha da OCS desejada. Cada item mostra o nome, o contrato e o tipo. |
| **OCS selecionada** | Mensagem verde que confirma a escolha. |

**Encaminhamento médico**

Anexe o documento do médico. **Formatos aceitos: PDF, JPG ou PNG, até 10 MB.**

| Botão / área | O que faz |
|---|---|
| **Selecionar arquivo do encaminhamento** | Abre o seletor de arquivos do aparelho. |
| **Tirar foto do encaminhamento** | No celular, abre a câmera do aparelho. No computador, abre a webcam (só funciona em `https://` ou `localhost`). |
| **Arrastar e soltar** | Você também pode arrastar a imagem ou o PDF para a área tracejada. |
| **Pré-visualização** | Depois de anexado, mostra a imagem ou a primeira página do PDF. |
| **Clique para abrir e visualizar** | Abre o arquivo em tela cheia. |
| **Aumentar zoom / Reduzir zoom / Fechar visualização** | Controles da visualização em tela cheia. |
| **Remover e enviar outro arquivo** | Descarta o arquivo para você escolher outro. |

Logo abaixo, uma mensagem confirma se o arquivo é válido ("Arquivo pronto para envio") ou aponta o problema ("Formato inválido. Envie PDF, JPG ou PNG." / "Arquivo maior que o limite de 10 MB.").

> 💡 **Dica:** tire a foto com boa luz e o documento inteiro enquadrado. Foto ilegível volta como **Atenção**.

**Revisão da pré-guia**

Resumo de leitura com o paciente, a OCS e o nome do arquivo anexado. Confira antes de enviar.

**Enviar pré-guia**

O botão fica desabilitado até estar tudo preenchido. Enquanto isso, o aviso **"Para enviar, falta preencher: …"** lista o que falta (paciente, OCS ou arquivo). Ao clicar, aparece "Enviando..." e depois uma mensagem verde: **"Pré-guia nº … enviada ao setor de Guias. Acompanhe o status em Minhas pré-guias."**, com o link **Ver Minhas pré-guias**. O formulário é limpo para um novo pedido.

### 5.3 Minhas pré-guias

Lista as pré-guias já criadas. Se você age por menores, aparece um filtro de pacientes (**Todos**, **Você** e os nomes dos menores) e o texto explica que ali aparecem as suas pré-guias e as dos menores que você acompanha.

Cada **cartão** mostra o número da pré-guia, a situação (cor), a origem ("Criada por você em …" ou "Criada pelo [patente] [nome] (médico FUSEX) em …") e uma frase conforme a situação:

| Situação | O que você vê | O que fazer |
|---|---|---|
| **Pendente** | "Enviada ao setor de Guias. Ainda não foi aberta." | Aguardar. |
| **Em análise** | "O setor de Guias está analisando." | Aguardar. |
| **Atenção** (criada por você) | A **Observação do setor de Guias** e o botão **Visualizar e corrigir** | Corrigir (veja [5.4](#54-corrigir-uma-pré-guia-em-atenção)). |
| **Atenção** (criada pelo médico) | Explicação **"O que aconteceu?"** e o botão **Aguardando correção do médico** (desabilitado) | Nada. O médico faz o ajuste. |
| **Concluída** | "Guia nº … · válida até …" e "Assinada pelo médico e pelo chefe do FUSEX." | Usar os botões **Baixar Guia (PDF)**, **Visualizar** ou **Imprimir**. |

Se a lista estiver vazia: **"Você ainda não tem pré-guias."**, com o botão **Nova pré-guia**.

> Se o navegador bloquear a abertura do PDF, aparece "O navegador bloqueou a nova aba. Libere pop-ups e tente de novo."

### 5.4 Corrigir uma pré-guia em Atenção

Abre ao clicar em **Visualizar e corrigir**. A tela se chama "Pré-guia nº …" e mostra:

| Bloco | Conteúdo |
|---|---|
| **Atenção** | Selo laranja indicando que o setor pediu correção. |
| **Observação do setor de Guias** | O motivo que o setor escreveu. |
| **Dados da pré-guia** | Beneficiário, Prec CP e data de criação (somente leitura). |
| **Encaminhamento enviado** | A foto ou PDF enviado antes, com a data, para você ver o que o setor marcou como ilegível. |
| **OCS** | Busca para **trocar a OCS**. A atual aparece com "(atual)". |
| **Novo encaminhamento médico** | Para **enviar outro arquivo** se o anterior estava ilegível: **Escolher arquivo**, **Usar câmera** ou arrastar. Depois de escolhido, mostra "Selecionado · nome" e o botão **Trocar**. Se você só trocar a OCS, pode deixar vazio. |

**Ações da correção:**

| Botão | O que faz |
|---|---|
| **Reenviar ao setor de Guias** | Só habilita depois que você muda a OCS ou anexa um novo arquivo. A mesma pré-guia volta para **Pendente**. O histórico guarda as duas versões. |
| **Cancelar** | Sai da tela. Se você já tinha alterado algo, pede confirmação: "Descartar as alterações? Nada será enviado ao setor de Guias." com **Continuar editando** ou **Descartar e voltar**. |

Mensagens possíveis: "Esta pré-guia já foi alterada. Atualize a página para ver a situação atual." (já foi tratada por outra pessoa) e "Pré-guia não encontrada" (não existe ou não é sua).

### 5.5 Minhas guias

Mostra as Guias das pré-guias concluídas. No topo, o seletor **Mostrar** filtra por **Todas**, **Em andamento** e **Finalizadas**.

Cada **cartão** mostra "Guia nº …", o paciente, a validade, uma frase com o que fazer e o resumo das sessões (autorizadas, assinadas, solicitadas, expiradas). A frase muda conforme a situação (veja a tabela em [Glossário](#situações-da-guia-em-minhas-guias)).

| Botão | Quando aparece | O que faz |
|---|---|---|
| **Ver guia (PDF)** | Em todo cartão | Abre o PDF da Guia. |
| **Enviar para a OCS** | Guia **Não enviada** | Abre uma confirmação. |
| **Confirmar envio** | Na confirmação | Mostra os procedimentos e quantas sessões foram autorizadas. Ao confirmar, a Guia vai para a OCS. |
| **Cancelar** | Na confirmação | Fecha sem enviar. |
| **Sessões para assinar** | Quando a OCS pediu assinatura | Abre a lista de sessões solicitadas. |

**Assinando uma sessão**

1. Quando a OCS pede a assinatura, o cartão mostra **Sessões para assinar**.
2. Cada sessão aparece como **"Sessão n · Procedimento"**. Se não houver nenhuma, aparece "Nenhuma sessão aguardando assinatura."
3. Clique em **Assinar** na sessão desejada. Abre a confirmação "Assinar a sessão n · procedimento?". Para menores, o texto é "Assinar esta sessão de [nome] com a sua assinatura cadastrada, como responsável legal?".
4. Clique em **Confirmar assinatura**. Aparece "Sessão assinada. Faltam X sessões." ou "Todas as sessões solicitadas foram assinadas."
5. Sessões já assinadas aparecem como "Já assinadas: sessão n em [data]".

> ⚠️ **Você precisa ter a assinatura digital cadastrada** (em **Minhas informações**). Sem ela, a confirmação mostra "Você ainda não tem assinatura cadastrada. Cadastre em Minhas informações para assinar." e o botão fica bloqueado.

> Você assina **uma sessão por vez**. Como responsável legal, você assina pelo menor com a sua própria assinatura.

### 5.6 Minhas informações

A tela tem os seguintes blocos.

**Titular e dependente maior**

| Bloco | O que contém |
|---|---|
| **Meus dados / Dados pessoais** | Nome, CPF, Prec CP, Data de nascimento e Faixa etária (somente leitura). Para alterar, procure o Chefe do FUSEX. |
| **Contato → Telefone** | Campo com máscara `(00) 00000-0000`. Edite e clique em **Salvar telefone**. Mensagem: "Telefone salvo com sucesso." |
| **Alterar senha** | Campos **Senha atual**, **Nova senha** (mínimo de **8 caracteres**) e **Confirmar nova senha**, e o botão **Alterar senha**. A nova senha deve ser diferente da atual e as duas novas devem coincidir. Depois de **5 erros seguidos** na senha atual, a alteração fica bloqueada por **15 minutos**. |
| **Assinatura digital** | Veja abaixo. |
| **Dependentes** | Lista de dependentes cadastrados pelo chefe. Cada cartão tem o botão **Criar pré-guia** (leva à Nova pré-guia já com o menor escolhido). Dependentes maiores mostram "Maior de idade, com conta própria: cria as próprias pré-guias". Para incluir ou alterar um dependente, procure o chefe. |

**Responsável legal**

| Bloco | O que contém |
|---|---|
| **Dados pessoais** | Nome e CPF (o responsável legal não tem Prec CP: entra com o CPF). Somente leitura. |
| **Menores que acompanho** | Um cartão por menor com Nome, Prec CP, Idade, Vínculo, Titular e Vigência ("Até [data]" ou "Vitalícia"), com o botão **Criar pré-guia**. Se não houver menor vigente, aparece "Nenhum menor vigente sob a sua responsabilidade." |
| **Assinatura digital** | Igual à dos demais. |

**Assinatura digital**

A assinatura é usada para assinar as sessões. Mostra a situação **Cadastrada** ou **Ainda não cadastrada**.

| Elemento | O que faz |
|---|---|
| **Área de desenho** | Desenhe a assinatura com o dedo, o mouse ou a caneta. |
| **Selecionar imagem da assinatura / Enviar imagem** | Em vez de desenhar, envie uma imagem **PNG ou JPG** da assinatura. |
| **Limpar** | Apaga o desenho para refazer. |
| **Salvar assinatura** | Grava. Mensagem: "Assinatura salva com sucesso." Se não houver desenho: "Desenhe ou envie uma assinatura antes de salvar." |

* * *

## 6. Módulo do Médico do FUSEX

O médico entra com o **CPF**. Na barra superior aparece "[patente] [nome] · Médico FUSEX".

| Item do menu | Para que serve |
|---|---|
| **Início** | Tela inicial, com as Guias para assinar, as pré-guias para corrigir e atalhos. |
| **Nova pré-guia** | Criar pré-guia durante a consulta. |
| **Corrigir pré-guias** | Corrigir as pré-guias que você criou e que o setor devolveu. |
| **Guias para assinar** | Assinar Guias. |
| **Minhas informações** | Dados profissionais, senha e assinatura. |

### 6.1 Início

Mostra "Olá, [patente] [nome]" e o seu CRM, além do botão **Nova pré-guia**. Em **O que precisa da sua atenção** há dois cartões com números:

| Cartão | O que conta | Botão |
|---|---|---|
| **Guias para assinar** | Guias que esperam a sua assinatura. | **Assinar guias** |
| **Pré-guias para corrigir** | Pré-guias criadas por você e devolvidas pelo setor de Guias. | **Corrigir** |

Sem pendência, o cartão fica esmaecido com "Nada pendente". Em **Atalhos** há **Nova pré-guia** e **Minhas informações**.

### 6.2 Nova pré-guia (médico)

Aqui o médico **não anexa encaminhamento**: ele informa os exames. A tela tem quatro blocos.

| Bloco | O que faz |
|---|---|
| **Médico solicitante** | Mostra Nome, Patente, CRM, CPF e Prec CP, **preenchidos automaticamente** com o seu perfil. Não é editável. |
| **Beneficiário** | Digite o **Prec CP** do paciente e clique em **Buscar**. Se encontrar, mostra Nome, Faixa etária e Telefone. Se for um dependente, mostra também **Paciente**, **Dependente (vínculo)** e **Titular**, com o Prec CP do titular. Mensagens: "Beneficiário não encontrado." (confira o número) e "Não foi possível buscar o beneficiário…" com **Tentar novamente**. |
| **OCS** | **Buscar OCS** por nome, contrato ou tipo. Selecione a OCS na lista. Sem escolha, aparece "Nenhuma OCS selecionada. Escolha uma das opções da lista." |
| **Exames e procedimentos** | **Buscar por nome ou código TUSS** (digite ao menos **2 caracteres**). Cada resultado mostra o nome e o "Código TUSS". Clique para incluir; procedimentos já incluídos aparecem como **Já incluído**. A tabela **Código TUSS / Procedimento** lista o que foi escolhido, com opção de remover. É preciso incluir **ao menos um exame** ("Inclua ao menos um exame."). |

**Enviar ao setor de Guias:** confirma a criação. Aparece "Pré-guia nº … enviada ao setor de Guias".

> ℹ️ Quando o paciente é **dependente maior**, a Guia aparece para o próprio dependente. Quando é **menor**, aparece para o titular ou para o responsável legal, que a envia à OCS e assina as sessões.

### 6.3 Corrigir pré-guias

**Lista:** mostra apenas as pré-guias **criadas por você** que o setor de Guias devolveu (**Atenção**). Cada cartão traz o número, o selo **Atenção** e a **Observação do setor de Guias**. Clique no cartão para abrir. Se não houver nenhuma, aparece "Nenhuma pré-guia para corrigir".

**Detalhe da correção:**

| Bloco | O que faz |
|---|---|
| **Observação do setor de Guias** | O que precisa ser corrigido. |
| **Beneficiário** | Nome, Prec CP, Faixa etária e Telefone. **Não pode ser trocado**; se o paciente estiver errado, crie uma nova pré-guia. |
| **OCS** | Busque e escolha outra OCS, se necessário. |
| **Exames e procedimentos** | Adicione ou remova exames (mínimo de um). A coluna **Ações** permite remover. |
| **Salvar correção e reenviar** | Grava e devolve ao setor como **Pendente**; ela sai desta aba. Há confirmação ao descartar alterações. |

Se alguém já alterou a pré-guia: "Esta pré-guia já foi alterada. Atualize a lista e confira a situação atual."

### 6.4 Guias para assinar (médico)

Veja a descrição completa em [7.1](#71-guias-para-assinar-chefe): o funcionamento é o mesmo. Diferenças do médico:

- Qualquer médico do FUSEX pode assinar; **a primeira assinatura de médico vale**.
- A coluna de assinaturas mostra a situação do médico (**Pendente (sua assinatura)**, **Assinada por …**).
- A Guia só fica **Concluída** depois da assinatura do médico **e** do chefe.

> ⚠️ É preciso ter a **assinatura digital cadastrada** em **Minhas informações**.

### 6.5 Minhas informações (médico)

| Bloco | O que contém |
|---|---|
| **Dados profissionais** | Nome, Patente, CPF (login), Prec CP e CRM, somente leitura. Para alterar, procure o Chefe do FUSEX. |
| **Alterar senha** | **Senha atual**, **Nova senha** (mínimo 8 caracteres, diferente da atual) e **Confirmar nova senha**. Botão **Alterar senha**. |
| **Assinatura digital** | Desenhe ou envie imagem PNG/JPG e clique em **Salvar assinatura** (como em [5.6](#56-minhas-informações)). |

* * *

## 7. Módulo do Chefe do FUSEX

O chefe entra com o **nome de usuário**. É o perfil que cadastra e mantém as pessoas do sistema.

| Item do menu | Para que serve |
|---|---|
| **Guias para assinar** | Assinar Guias (tela inicial). |
| **Beneficiários** | Cadastrar e manter titulares e, a partir deles, os dependentes. |
| **Médicos** | Cadastrar e manter médicos. |
| **Minhas informações** | Seus dados e assinatura. |

### 7.1 Guias para assinar (chefe)

Lista as Guias que o setor de Guias anexou e que faltam a sua assinatura. Mostra uma coluna com a situação de cada assinatura (**Pendente (sua assinatura)**, **Assinada por …**, **Assinada**, **Pendente**) e avisos como "Falta assinatura de um médico".

**Regras:**
- A Guia só fica **Concluída** com as assinaturas do **médico e do chefe**.
- Qualquer médico do FUSEX pode assinar; a primeira assinatura de médico vale.

| Elemento | O que faz |
|---|---|
| **Caixa de seleção (por Guia)** | Marca a Guia para assinar em lote. |
| **Selecionar todas** | Marca todas as Guias da lista. |
| **Ação em lote** | Aviso: selecione **até 50 guias por vez**. |
| **Assinar selecionadas** | Pede confirmação ("Confirmar a assinatura de n guia(s)?") e assina todas. Se alguma falhar, mostra qual e por quê, e mantém as que falharam selecionadas. |
| **Limpar seleção** | Desmarca tudo. |
| **Clicar em uma Guia** | Abre a **Prévia da Guia** com o PDF ao lado. |
| **Assinar com minha assinatura** | Assina somente aquela Guia, com confirmação ("Confirmar a assinatura da Guia nº …?"). Ao concluir: "Assinatura registrada." ou "Assinatura registrada. A Guia está concluída." |
| **Baixar PDF** | Baixa o PDF da Guia. |
| **Minhas informações** | Atalho, quando falta cadastrar a assinatura. |

Outras mensagens: "Nenhuma Guia para assinar" (lista vazia), "Muitas tentativas em pouco tempo. Aguarde um instante." e "Seu perfil não tem permissão para assinar em lote."

### 7.2 Beneficiários

Mostra apenas os **titulares**; os dependentes ficam dentro do titular ao qual pertencem. A tela tem o **formulário** e a **lista**.

**Formulário (Novo beneficiário / Editando beneficiário)**

| Campo | Como preencher |
|---|---|
| **Nome** | Nome completo. Obrigatório. |
| **CPF (será o login)** | CPF válido, com 11 dígitos. Será o login do beneficiário. |
| **Prec CP** | Número do cartão. |
| **Data de nascimento** | Data. |
| **Telefone** | Com DDD, por exemplo `(11) 98765-4321`. |
| **Faixa etária** | (só na edição) Calculada a partir da data de nascimento e mostrada com a idade. Somente leitura. |
| **Situação** | (só na edição) **Ativo** ou **Inativo**. |
| **Senha inicial** | (só no cadastro) Senha de primeiro acesso. Na edição, o campo vira **Nova senha (deixe em branco para manter)**. |

| Botão | O que faz |
|---|---|
| **Cadastrar beneficiário** | Cria a conta. Mensagem "Beneficiário cadastrado com sucesso." Erros de preenchimento aparecem abaixo do campo ("O nome é obrigatório.", "CPF inválido." etc.). |
| **Salvar alterações** | (modo edição) Grava. "Alterações salvas." |
| **Cancelar** | (modo edição) Descarta as alterações e volta ao cadastro novo. |

> ℹ️ A **assinatura digital** é cadastrada pelo próprio beneficiário, depois do primeiro acesso.

**Lista de beneficiários**

| Elemento | O que faz |
|---|---|
| **Buscar por nome, CPF ou Prec CP** | Filtra a lista enquanto você digita. |
| **Filtrar por situação** | **Ativos** (padrão), **Inativos** ou **Todos**. |
| **Colunas** | Nome, CPF (login), Prec CP, Situação, Dependentes (ex.: "3 vigentes" ou "Nenhum") e Ações. |
| **Dependentes** | Abre a tela de dependentes daquele titular ([7.3](#73-dependentes-de-um-titular)). |
| **Editar** | Carrega os dados no formulário. |
| **Desativar** | Pede confirmação ("Desativar [nome]? O acesso será bloqueado, mas o histórico de pré-guias e Guias é mantido."). |
| **Reativar** | Aparece para inativos; devolve o acesso. |
| **Anterior / Próxima** | Paginação. |

> **Desativar não apaga nada:** bloqueia o acesso e mantém todo o histórico.

### 7.3 Dependentes de um titular

Abre pelo botão **Dependentes** na lista de beneficiários. O caminho aparece no topo: **Beneficiários › [Titular] › Dependentes**. Um **cartão por dependente** mostra:

- o **tipo**: *Menor · guarda do titular*, *Menor · responsável legal* ou *Maior de idade*;
- **Prec CP**, **Idade** e **Vigência** ("Até [data]" ou "Vitalícia"; vencidos aparecem com selo e ao final da lista);
- a **Conta**: *Conta própria (login pelo CPF)* ou *Sem conta (acesso pelo responsável)*;
- o **Responsável legal**: o próprio titular ou o responsável externo.

| Botão | O que faz |
|---|---|
| **+ Adicionar dependente** | Abre o formulário de novo dependente. |
| **Editar** | Abre o formulário do dependente. |

Não existe "remover" ou "encerrar" dependente: a vigência define até quando ele é válido.

**Formulário (Adicionar / Editar dependente)**

| Campo | Como preencher |
|---|---|
| **Nome** | Nome do dependente. |
| **Data de nascimento** | Define se é menor ou maior de idade. |
| **Prec CP** | Número do cartão. |
| **Vínculo** | Parentesco (por exemplo, Filho, Cônjuge). |
| **Vigência** | **Vitalícia (padrão)** ou **Determinada**, quando aparece **Data final**. Uma vigência determinada pode ser alterada, mas não pode ser desmarcada. |
| **Responsável legal** *(menor)* | Escolha **Titular** ou **Outra pessoa**. Em **Outra pessoa**, informe o **CPF do responsável**. Se o CPF **já existe**, aparece "CPF encontrado: [nome] já tem conta. Nenhuma conta nova será criada." Se **não existe**, informe **Nome do responsável** e **Senha**; será criada uma conta de responsável legal com login pelo CPF. |
| **Conta própria** *(maior)* | Informe o **CPF** e a **Senha** da conta própria do dependente maior. Se a pessoa já era responsável legal, a conta é reaproveitada. |

| Botão | O que faz |
|---|---|
| **Salvar** | Grava o dependente. Erros do servidor aparecem no campo (por exemplo, Prec CP já cadastrado). |
| **Cancelar** | Volta sem salvar. |

### 7.4 Médicos

Funciona como Beneficiários, mas para os médicos.

**Formulário (Novo médico / Editando médico)**

| Campo | Como preencher |
|---|---|
| **Nome** | Nome do médico. |
| **Patente** | Patente (por exemplo, Capitão, Major). |
| **CPF (será o login)** | CPF do médico. |
| **Prec CP** | Número do cartão (11 dígitos). |
| **CRM** | Número e estado (UF), por exemplo `123456-SP`. Obrigatório. |
| **Situação** | (edição) **Ativo** ou **Inativo**. |
| **Senha inicial** | No cadastro. Na edição: **Nova senha (deixe em branco para manter)**. |

| Botão | O que faz |
|---|---|
| **Cadastrar médico / Salvar alterações / Cancelar** | Igual aos beneficiários. |

**Lista de médicos:** **Buscar por nome, CPF, Prec CP ou CRM**, filtro **Ativos / Inativos / Todos**, colunas Nome, CPF (login), Prec CP, CRM, Situação e Ações. **Editar**, **Desativar** (bloqueia o acesso **e a assinatura**, mas mantém o histórico) e **Reativar**. Há paginação.

Se o CPF, o Prec CP ou o CRM já existirem, aparece um erro como **"CPF já cadastrado"** no campo correspondente.

### 7.5 Minhas informações (chefe)

| Bloco | O que faz |
|---|---|
| **Dados da conta** | Edite **Nome**, **Patente**, **Nome de usuário (login)** e **Nova senha (deixe em branco para manter)**. Clique em **Salvar alterações**. A senha tem no mínimo 8 caracteres. |
| **Assinatura digital** | Desenhe ou envie imagem e clique em **Salvar assinatura**. **Sem assinatura cadastrada o chefe não consegue assinar Guias.** |

* * *

## 8. Módulo do Setor de Guias

É uma **conta de setor** (sem pessoa atribuída). Entra com o nome de usuário. Menu: **Fila de pré-guias**.

### 8.1 Fila de pré-guias

Lista todas as pré-guias para análise.

| Elemento | O que faz |
|---|---|
| **Buscar por beneficiário ou Prec CP** | Filtra a lista. |
| **Filtrar por status** | **Todos os status**, Pendente, Em análise, Atenção ou Concluída. |
| **Colunas** | Número, Beneficiário, OCS, Origem (criada pelo beneficiário ou pelo médico), Criada em, Status e Ações. |
| **Abrir** | Abre a tela da pré-guia. Fica em destaque nas que pedem ação. |
| **Anterior / Próxima** | Paginação. |

Quando a pré-guia é aberta pela primeira vez, ela passa de **Pendente** para **Em análise**.

### 8.2 Tela da pré-guia

A tela tem duas partes: à esquerda, o que o paciente pediu; à direita, a sua decisão.

**Dados**

| Bloco | Conteúdo |
|---|---|
| **Beneficiário** | Nome, Prec CP, Faixa etária e telefone. |
| **Exames solicitados** | Lista dos exames pedidos. |
| **Encaminhamento anexado** | A foto ou PDF enviado. Há **Tela cheia**, **Aumentar zoom**, **Diminuir zoom** e **Fechar tela cheia**. Em pré-guias do médico aparece "Não há anexo: pré-guia criada pelo médico". |

**Decisão do setor — duas opções:**

**A) Requerer correção** (a pré-guia tem algum problema)

| Elemento | O que faz |
|---|---|
| **Observação (obrigatória)** | Explique o que precisa ser corrigido (até **500 caracteres**; há contador). |
| **Requerer correção** | Abre a confirmação: "A pré-guia ficará com status Atenção e a observação abaixo será registrada no histórico." |
| **Confirmar correção** | Confirma. A pré-guia volta para o criador (beneficiário ou médico). |

**B) Gerar a Guia** (está tudo certo)

1. Emita a Guia no **SIRE** (sistema do Exército, fora do NEXUS).
2. Clique em **Anexar Guia / Escolher PDF da Guia** e envie o PDF.
3. O NEXUS **lê o PDF** e preenche sozinho: **Número da Guia**, **UG da Guia**, **Validade (NÃO RECEBER APÓS)** e **Exames na Guia**. Aparece "Número extraído automaticamente. Você pode editar se necessário." Se a leitura falhar, digite o número manualmente.
4. **Confira o paciente:** o sistema compara o **Prec CP** do PDF com o da pré-guia. Mensagem verde = confere. Mensagem de alerta = a Guia pode ser de **outro paciente**; troque o arquivo. Se o Prec CP não puder ser lido, aparece um aviso para conferir manualmente (não bloqueia).
5. Na tabela **Exames na Guia** (colunas **Cod DGP**, **Descrição**, **Quantidade**, **Ações**) confira e ajuste os exames. **Adicionar exame** inclui uma linha; o ícone de lixeira remove.
6. Clique em **Concluir**. Ao concluir, a Guia segue para a assinatura do médico e do chefe.

| Botão | O que faz |
|---|---|
| **Trocar arquivo** | Substitui o PDF anexado. |
| **Remover anexo** | Remove o PDF. |
| **Concluir** | Só habilita depois de anexar a Guia e deixar os dados válidos. Mostra "Concluindo…" enquanto grava. |
| **Voltar para a fila** | Volta à lista. |

> ⚠️ Se você alterar exames ou validade depois de anexar, o sistema pede para **anexar o PDF da Guia de novo** antes de salvar.
> A tela fica somente leitura depois que a Guia foi enviada para assinatura ("Guia já enviada para assinatura").

* * *

## 9. Módulo da Recepção

Conta de setor. Menu: **Guias para impressão**. Serve para quem **não tem acesso ao aplicativo** e precisa da Guia no papel.

| Elemento | O que faz |
|---|---|
| **Nome do beneficiário, Prec CP ou número da Guia** | Campo de busca. Digite **ao menos 3 caracteres** (o sistema avisa o mínimo). Antes de digitar, aparece "Digite para buscar uma Guia". |
| **Resultados** | Tabela com **Guia**, **Beneficiário**, **Prec CP**, **OCS**, **Válida até** e Ações. |
| **Visualizar** | Abre o PDF em uma janela, com o botão **Baixar PDF**. Feche com **Esc** ou pelo botão de fechar. |
| **Imprimir** | Abre a impressão do PDF direto da lista. |

Só aparecem **Guias Concluídas**, com as duas assinaturas. Se não achar nada: "Nenhuma Guia encontrada". Em erro de impressão: "Não foi possível imprimir a Guia. Tente novamente."

* * *

## 10. Módulo da OCS

Conta de setor, **uma por OCS** (por exemplo, `ocs.laboratorio`). Cada OCS vê **somente as suas guias**.

| Item do menu | Para que serve |
|---|---|
| **Guias recebidas** | Guias que os beneficiários enviaram à sua OCS. |
| **Guias Finalizadas** | Guias realizadas ou encerradas, prontas para entrar no espelho. |
| **Espelho** | Espelho em construção e histórico dos enviados. (Tela inicial.) |
| **Glosas Recebidas** | Glosas pendentes da sua decisão. |

### 10.1 Guias recebidas

| Elemento | O que faz |
|---|---|
| **Buscar guia** | Filtra por nome, número da guia ou Prec CP (aceita o Prec CP com ou sem traço). |
| **Colunas** | Guia, Beneficiário, Prec CP, Procedimento, Enviada em, Situação e Ações. |
| **Abrir** | Abre o detalhe da guia. |

Mensagens: "Nenhuma guia recebida." e "Nenhuma guia encontrada para a busca."

**Detalhe da guia**

| Bloco | Conteúdo |
|---|---|
| **Dados da guia (lidos do PDF)** | Número da guia, **Validade (NÃO RECEBER APÓS)**, Beneficiário e Prec CP. |
| **Procedimentos autorizados** | Tabela com Código, Procedimento e Quantidade. |
| **Sessões** | Uma grade por procedimento, com uma casela por sessão autorizada. |
| **Legenda das sessões** | **Disponível**, **Solicitada**, **Assinada** e **Expirada** (cinza riscado). |
| **Ver guia (PDF)** | Abre e fecha o visualizador do PDF (somente leitura). |
| **← Guias recebidas** | Volta para a lista. |

**Requerer a assinatura de uma sessão (uma por vez):**

1. Clique em uma sessão **Disponível** na grade (ela fica selecionada; clicar de novo desmarca).
2. Clique em **Requerer assinatura**.
3. A sessão passa para **Solicitada** e aparece: "Assinatura requerida para a sessão n de [procedimento]. O beneficiário assina em Minhas guias."

> Se a guia estiver **vencida**, aparece um aviso ("Guia vencida em [data]. Não aceita novas solicitações de sessão.") e a seleção fica bloqueada. Guias de outra OCS mostram "Esta guia não é da sua OCS."

### 10.2 Guias Finalizadas

Lista as guias **realizadas ou encerradas** da sua OCS. O texto da tela diz: "Adicione-as ao espelho e informe o valor por sessão."

Cada cartão mostra **Guia nº …**, o beneficiário, a situação, a data de envio e a quantidade de sessões.

| Elemento | O que faz |
|---|---|
| **Ver guia (PDF)** | Abre o PDF da guia. |
| **Adicionar para o espelho** | Abre o painel **Valor por sessão (R$)**: para cada procedimento, informe o valor. |
| **Enviar** (no painel) | Só habilita com **todos os valores** preenchidos. Adiciona a guia ao espelho em construção. |
| **Cancelar** (no painel) | Fecha sem adicionar. |
| **Já no espelho em construção (nº …)** | Guia já adicionada; não pode ser adicionada de novo. |
| **Já enviada ao FUSEX (espelho nº …)** | Guia já cobrada em um espelho enviado. |

Se não houver guias: "Nenhuma guia finalizada disponível para o espelho no momento."

### 10.3 Espelho

A tela inicial da OCS tem dois blocos.

**Espelho em construção**

Cartão com **Espelho nº … (em construção)**, a data de início, a quantidade de guias e o valor total. Se ainda não há nada: "Nenhuma guia adicionada ainda." e o botão **Adicionar guia** (leva às Guias Finalizadas). Clique no cartão para abrir o espelho.

**Histórico de espelhos enviados**

Lista os espelhos já enviados com número, período e valor, e o botão **Ver detalhes**. Se vazio: "Nenhum espelho enviado ainda."

**Espelho em construção (detalhe)**

| Elemento | O que faz |
|---|---|
| **Cartões por guia** | Cada guia mostra Código, Procedimento, Sessões, **Valor por sessão** e **Valor total**. |
| **Caixa de seleção** | Marca guias para remover ou editar. |
| **Remover** | Tira as guias marcadas do espelho (elas voltam para Guias Finalizadas). Pede confirmação ("Remover a guia nº …?" / "Remover as n guias selecionadas?") → **Confirmar remoção**. |
| **Editar valores** | Só habilita com **exatamente uma guia** marcada. Altere o **Valor por sessão** e clique em **Salvar**. O total é recalculado. |
| **Ver guia (PDF)** | Visualização somente leitura com zoom e tela cheia. |
| **Adicionar guia** | Vai às Guias Finalizadas. |
| **VALOR TOTAL** | Soma de todo o espelho. |
| **Enviar para o FUSEX** | Abre a confirmação. |

**Confirmação de envio:** "Depois de enviado, este espelho **não poderá mais ser editado**, nem ter guias removidas ou adicionadas. Tem certeza que deseja enviar?" Clique em **Sim, enviar para o FUSEX** ou **Cancelar**. Depois do envio, o espelho vai ao **Setor de Faturas**.

**Espelho enviado (detalhe):** somente leitura, com "Espelho nº …", o período, os valores e o botão **← Espelho** para voltar.

### 10.4 Glosas Recebidas

Aqui a OCS vê as **faturas com glosa**, aguardando a sua decisão. O texto informa o prazo de **3 dias úteis** (sábados e domingos não contam; feriados não são descontados): se contestar alguma guia, ela volta para a rastreabilidade; **passado o prazo sem decisão, a fatura segue para a auditoria mesmo assim.**

Cada cartão mostra "Fatura nº … · [OCS]", o selo **Aguardando decisão** ou **Prazo vencido** e a data-limite. Se vazio: "Nenhuma glosa pendente de decisão."

**Detalhe da glosa**

| Bloco | Conteúdo |
|---|---|
| **Cabeçalho** | Datas: "Enviada para decisão em …", "Prazo: até …" ou "Prazo vencido em …", "Ciência dada em …". |
| **Valor informado pela OCS / Glosa / Valor final após lisura** | Os totais da fatura. |
| **Tabela por guia** | Procedimento, **Informado (R$/sessão)**, **Contrato (R$/sessão)**, **Glosa (R$)** e **Observação da rastreabilidade**. |
| **Sua decisão** | Para **cada guia glosada**, escolha **Ok** (concorda com o valor do contrato) ou **Contestar**. |
| **Motivo da contestação** | Obrigatório ao contestar: **de 10 a 500 caracteres**. |
| **Responsável (seu nome)** | Seu nome (3 a 100 caracteres). |
| **Confirmar decisão** | Só habilita quando **todas as guias** têm decisão. Aparece "Faltam n guia(s) sem decisão". |
| **Sim, confirmar decisão** | Confirmação final. Se houver ao menos uma contestação, a fatura volta para a rastreabilidade (as guias "Ok" não mudam). Se todas ficarem **Ok**, a fatura é liberada para a auditoria. |

> ⚠️ **A decisão não pode ser desfeita** depois de confirmada. Se o prazo vencer sem decisão, a tela fica **somente leitura** com o aviso de prazo vencido.

* * *

## 11. Módulo do Setor de Faturas

Conta de setor. Menu: **Espelhos recebidos** e **Faturas Auditadas**.

### 11.1 Espelhos recebidos

Mostra os espelhos que as OCS enviaram. **Ao inserir o número da fatura, o espelho passa a ser uma fatura** e pode ser enviado para a rastreabilidade.

| Elemento | O que faz |
|---|---|
| **OCS** | Filtro: **Todas as OCS** ou uma OCS específica. |
| **Situação** | Filtro: **Todas**, **Sem nº de fatura**, **Protocolada**, **Em lisura**, **Aguardando a OCS** ou **Em auditoria**. (As concluídas ficam na aba **Faturas Auditadas**.) |
| **Cartão do espelho** | Mostra o título, a OCS, a situação, o período, o valor total e a data de entrada. Clique para abrir o detalhe. |

**Detalhe do espelho**

| Bloco | Conteúdo |
|---|---|
| **Tabela de guias** | Guia nº, Paciente, Código, Procedimento, Qtd. sessões, Valor por sessão (R$), Valor (R$) e **VALOR TOTAL**. |
| **Controle de fluxo da fatura** | Histórico por etapa: **Etapa**, **Setor**, **Entrada**, **Saída**, **Responsável**, **Valor inicial** e **Valor final**. A etapa atual aparece como **Em andamento**. |

**Inserir o número da fatura (protocolar)**

1. Em um espelho **Sem nº de fatura**, clique em **Inserir nº da fatura** (o sistema busca uma sugestão).
2. No formulário **Protocolar fatura**:
    - **Data de Entrada:** só leitura.
    - **OCS:** só leitura.
    - **Nº da Fatura:** vem sugerido; formato `XXX/XXXX` (por exemplo, `003/2026`). Não pode repetir um número da mesma OCS.
    - **Responsável (seu nome):** mínimo de 3 caracteres.
3. Clique em **Salvar protocolo**. A situação muda para **Protocolada**.

**Enviar para a rastreabilidade**

1. Em uma fatura **Protocolada**, clique em **Enviar para a rastreabilidade**.
2. Informe **Responsável (seu nome)**.
3. Confirme: "Depois de enviada, a fatura nº … segue para a lisura e não pode mais ser alterada neste setor. Tem certeza que deseja enviar?" → **Sim, enviar para a rastreabilidade** (ou **Cancelar**).

### 11.2 Faturas Auditadas

Lista as faturas **já conferidas e visualizadas pela auditoria**. O texto da tela lembra: **este é o fim do fluxo no NEXUS; a liquidação é feita fora do sistema.** Cada fatura aparece com o selo **Concluída**. Clique para ver o detalhe por guia (Procedimento, Informado, Contrato, Glosa e Observação). Se vazio: "Nenhuma fatura auditada ainda."

* * *

## 12. Módulo da Rastreabilidade

Conta de setor. Menu: **Faturas Recebidas** e **Versos das Guias**.

### 12.1 Faturas Recebidas (lisura)

Lista as faturas enviadas pelo Setor de Faturas para a **lisura**.

| Elemento | O que faz |
|---|---|
| **Filtro de OCS** | **Todas as OCS** ou uma OCS específica. |
| **Cartão da fatura** | Mostra o período, o valor informado, **Linhas decididas: x de y** e, quando aplicável, "Glosas enviadas à OCS em …" ou "Liberada para a auditoria". Clique para abrir. |

**Tela de lisura da fatura**

Mostra o **Valor informado pela OCS** e uma tabela com cada linha (guia · paciente · procedimento).

| Coluna / campo | O que faz |
|---|---|
| **Período** | Período da fatura. |
| **Guia · Paciente** | A guia e o paciente da linha. |
| **Procedimento** | O procedimento cobrado. |
| **Informado (R$/sessão)** | Valor que a OCS informou. |
| **Valor de acordo com o contrato?** | Botões **Sim** / **Não**. O sistema compara sozinho ("Comparado pelo sistema"): **Conforme o contrato**, **Acima do contrato**, **Abaixo do contrato** ou **Sem preço no contrato**. Você confirma ou corrige. |
| **Contrato (R$/sessão)** | Valor do contrato. A origem aparece como **Tabela**, **Tabela (corrigida)**, **Conferido** ou **Manual**. |
| **O valor mudou?** | Se o valor do contrato sofreu alteração, **insira o novo valor** aqui. Ao salvar a lisura, o novo valor substitui o da tabela e fica salvo para as próximas faturas. |
| **Glosa (R$)** | Diferença calculada. |
| **Situação** | **Falta decidir** ou a decisão tomada. |
| **Observação** | Texto livre da guia. |
| **Cancelar correção** | Desfaz a edição do valor de contrato. |
| **VALOR FINAL APÓS LISURA** | Total depois dos ajustes. |

| Botão | O que faz |
|---|---|
| **Salvar lisura** | Grava as decisões. Aparece "Lisura salva." Se você alterou um preço, é preciso informar o **nome do responsável** (3 a 100 caracteres) para gravar o novo valor na tabela da OCS. |
| **Enviar glosas à OCS** | (se houver glosa) Pede confirmação: "As guias glosadas serão enviadas para a OCS decidir, Guia por Guia…; a lisura **não poderá mais ser alterada** enquanto a OCS não responder." → **Sim, enviar glosas à OCS**. |
| **Enviar para a auditoria** | (sem glosa) Pede confirmação: "A fatura segue direto para a auditoria; a lisura não poderá mais ser alterada." → **Sim, enviar para a auditoria**. |

Os botões de envio só ficam disponíveis quando **todas as linhas estão decididas** ("Faltam n linha(s) sem decisão"). Depois que a OCS responde, a fatura mostra "Ok pela OCS" ou o motivo da contestação; se houver contestação, a fatura **volta para nova lisura**. Enquanto a OCS não decide: "Aguardando a decisão da OCS ou o fim do prazo de 3 dias úteis."

### 12.2 Versos das Guias

Serve para **imprimir o verso das Guias glosadas**, que vai no verso da Guia física.

**Lista:** faturas com Guias glosadas, com filtro **Todas as OCS**. Clique em uma fatura. Se vazio: "Nenhuma Guia glosada com verso para imprimir."

**Tela da fatura:** o aviso fixo orienta: **"Coloque uma folha A4 em branco na impressora, posicionada para imprimir no verso da Guia indicada no rodapé. A folha sai em preto e branco e não tem campo de assinatura."**

| Coluna / botão | O que faz |
|---|---|
| **Guia nº / Paciente / Andamento / Glosa (R$)** | Dados da Guia e o andamento da glosa (por exemplo, "Aceita pela OCS" ou "Prazo vencido"). |
| **Imprimir verso** | Imprime o verso daquela Guia. |
| **Imprimir todos os versos (n)** | Imprime os versos de todas as Guias glosadas da fatura. |

* * *

## 13. Módulo da Auditoria

Conta de setor. Menu: **Faturas Recebidas** e **Faturas Analisadas**. A auditoria **só visualiza e conclui; não devolve nada.**

### 13.1 Faturas Recebidas (auditoria)

Lista as faturas já lisuradas, aguardando visualização. Há filtro **Todas as OCS**. Cada cartão mostra "Recebida em …" e o selo **Recebida**. Se vazio: "Nenhuma fatura aguardando visualização."

**Tela da fatura**

Somente leitura. Mostra o **Valor informado pela OCS**, a **Glosa** e o **Valor final após lisura**, e a tabela com **Período**, **Guia · Paciente**, **Procedimento**, **Informado**, **Contrato**, **Origem** (Tabela, Tabela corrigida, Conferido, Manual), **Glosa (R$)**, **Conferência** (Conforme, Acima ou Abaixo do contrato, ou Sem preço no contrato) e **Observação**. Linhas aparecem como **Sem glosa** ou **Glosada**; as glosadas mostram o **Andamento da glosa** daquela guia (por exemplo, "Ok pela OCS" ou o motivo da contestação).

| Botão / campo | O que faz |
|---|---|
| **Marcar como visualizada** | Abre a confirmação. |
| **Responsável (seu nome)** | Seu nome (3 a 100 caracteres). |
| **Sim, marcar como visualizada** | Confirma. A fatura vira **Concluída** e o fluxo termina no NEXUS. **Não pode ser desfeito.** |

### 13.2 Faturas Analisadas

Lista as faturas que a auditoria **já visualizou**. **Só consulta.** Clique para abrir o detalhe. Se vazio: "Nenhuma fatura analisada ainda."

* * *

## 14. Fluxos Principais de Uso

### 14.1 Do pedido à Guia pronta

| Etapa | Quem | O que faz |
|---|---|---|
| 1 | Beneficiário / dependente maior / responsável legal | **Nova pré-guia**: escolhe o paciente e a OCS, anexa o encaminhamento e clica em **Enviar pré-guia**. |
| (ou) 1 | Médico | **Nova pré-guia**: busca o paciente pelo Prec CP, escolhe a OCS e os exames e clica em **Enviar ao setor de Guias**. |
| 2 | Setor de Guias | Abre a pré-guia na fila. Se estiver errada, **Requerer correção**; se estiver correta, emite a Guia no SIRE e a anexa. |
| 3 | Criador da pré-guia | Se voltou em **Atenção**, corrige (beneficiário: **Visualizar e corrigir**; médico: **Corrigir pré-guias**) e reenvia. |
| 4 | Médico e Chefe | Em **Guias para assinar**, assinam a Guia. |
| 5 | Beneficiário | A pré-guia fica **Concluída** e a Guia aparece em **Minhas guias**. (A Recepção também pode imprimir.) |

### 14.2 Execução na OCS

| Etapa | Quem | O que faz |
|---|---|---|
| 1 | Beneficiário | Em **Minhas guias**, **Enviar para a OCS** → **Confirmar envio**. |
| 2 | OCS | A guia aparece em **Guias recebidas**. Ao atender o paciente, **Requerer assinatura** de uma sessão. |
| 3 | Beneficiário | Em **Minhas guias**, **Assinar** → **Confirmar assinatura**. |
| 4 | OCS | Repete até concluir as sessões. |

### 14.3 Cobrança

| Etapa | Quem | O que faz |
|---|---|---|
| 1 | OCS | Em **Guias Finalizadas**, **Adicionar para o espelho** com os valores; depois **Enviar para o FUSEX**. |
| 2 | Setor de Faturas | **Inserir nº da fatura** → **Salvar protocolo** → **Enviar para a rastreabilidade**. |
| 3 | Rastreabilidade | Faz a lisura e salva. Sem glosa: **Enviar para a auditoria**. Com glosa: **Enviar glosas à OCS**. |
| 4 | OCS | Em **Glosas Recebidas**, decide **Ok** ou **Contestar** em cada guia, em até 3 dias úteis. |
| 5 | Rastreabilidade | Se houve contestação, revisa e reenvia. Se todas foram Ok (ou o prazo venceu), a fatura vai à auditoria. |
| 6 | Auditoria | **Marcar como visualizada**. A fatura fica **Concluída**. |
| 7 | Setor de Faturas | A fatura aparece em **Faturas Auditadas**. A liquidação ocorre fora do NEXUS. |

### 14.4 Cadastros (Chefe)

| Etapa | O que faz |
|---|---|
| Novo titular | **Beneficiários** → preencher o formulário → **Cadastrar beneficiário**. O beneficiário entra com o CPF e cadastra a própria assinatura. |
| Novo dependente | **Beneficiários** → **Dependentes** do titular → **+ Adicionar dependente**. |
| Menor com responsável legal externo | No formulário do dependente, em **Responsável legal**, escolha **Outra pessoa** e informe o CPF (e nome e senha, se for novo). |
| Novo médico | **Médicos** → preencher → **Cadastrar médico**. O médico cadastra a própria assinatura. |
| Bloquear acesso | **Desativar** (o histórico é mantido). |

* * *

## 15. Dúvidas Frequentes e Problemas Comuns

**Esqueci a minha senha.**
O sistema não tem recuperação automática. Procure o **Chefe do FUSEX** para redefinir a senha.

**Aparece "CPF, usuário ou senha incorretos".**
Confira se está usando o **CPF (só números)** — beneficiário, dependente, responsável e médico — ou o **nome de usuário** — chefe e setores. Use o botão **Mostrar** para ver a senha digitada.

**Aparece "Conta desativada".**
O chefe desativou a sua conta. Procure o Chefe do FUSEX.

**Não consigo assinar a sessão (ou a Guia).**
Você precisa ter a **assinatura digital cadastrada** em **Minhas informações**. Médico e chefe só assinam Guias com a assinatura cadastrada.

**O botão "Enviar" está cinza.**
Falta preencher algo. Veja o aviso "Para enviar, falta preencher…" ou o texto abaixo do botão.

**Não vejo o dependente na hora de criar a pré-guia.**
Dependentes **maiores de idade** criam as próprias pré-guias, e dependentes com **vigência encerrada** não aparecem. Procure o chefe.

**A foto do encaminhamento foi recusada.**
Use **PDF, JPG ou PNG**, de até **10 MB**. Em fotos muito grandes, reduza a resolução.

**A câmera não abre no computador.**
A câmera só funciona em `https://` ou `localhost` e exige a sua permissão no navegador. Use **Selecionar arquivo** como alternativa.

**Minha pré-guia voltou como "Atenção".**
Leia a **Observação do setor de Guias**, corrija e reenvie. Se foi criada pelo médico, ele é quem corrige.

**A página mostra "Não foi possível carregar…".**
Clique em **Tentar novamente**. Se persistir, confirme a conexão e avise o suporte.

**Apareceu "Página não encontrada".**
O endereço está incorreto. Use o menu lateral ou clique em **Nexus** para voltar ao início.

**Cliquei sem querer e saí do sistema.**
Entre de novo com o seu login. Nada é perdido: o que você salvou ou enviou continua gravado.

* * *

> Regras de negócio completas: [Manual de Regras de Negócio](../Manual_regras_negocio.md) · Instalação: [Manual de Instalação](./Manual_Instalacao.md)
