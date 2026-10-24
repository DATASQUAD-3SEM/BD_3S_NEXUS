# Guia de Contribuição — DataSquad Nexus

Este guia define o padrão de commits, branches e Pull Requests do projeto.
Objetivo: manter o histórico limpo, rastreável e integrado ao Jira.

## Índice
1. [Mensagens de Commit](#1-mensagens-de-commit)
2. [Branches](#2-branches)
3. [Pull Requests](#3-pull-requests)
4. [Merge Commits (Fusão)](#4-merge-commits-fusão)
5. [Referência rápida](#5-referência-rápida)

---

## 1. Mensagens de Commit

### 1.1 Formato

    <tipo>(<CHAVE-JIRA>): <descrição no infinitivo>

- **`<tipo>`** — obrigatório (ver tabela abaixo).
- **`(<CHAVE-JIRA>)`** — obrigatório quando o commit estiver ligado a uma issue. Ex.: `(SCRUM-12)`. Se o commit não tiver issue, use o escopo normal, ex: `(backend)` ou omita os parênteses.
- **`<descrição>`** — no **infinitivo** ("adicionar", "corrigir"), minúscula, sem ponto final.

> ⚠️ **Regra da equipe:** descrição no **infinitivo**. Não use particípio ("adicionado") nem 3ª pessoa ("adiciona").

### 1.2 Tipos

| Tipo      | Quando usar                                         | Exemplo |
|-----------|-----------------------------------------------------|---------|
| `feat`    | Adiciona algo novo                                  | `feat(SCRUM-12): adicionar endpoint de pré-guia` |
| `fix`     | Corrige comportamento errado                        | `fix(SCRUM-15): corrigir validação de CPF` |
| `docs`    | Documentação (README, guias)                        | `docs(SCRUM-20): ajustar seção de equipe` |
| `style`   | Formatação/espaços — **não muda lógica nem nomes**  | `style(frontend): remover espaços em branco` |
| `refactor`| Reorganiza/renomeia **sem mudar comportamento**     | `refactor(SCRUM-22): renomear variáveis do service` |
| `test`    | Adiciona/ajusta **testes automatizados**            | `test(SCRUM-12): cobrir endpoint de PDF com testes` |
| `chore`   | Manutenção que não altera lógica (pastas, configs)  | `chore(estrutura): criar pastas src/ e docs/` |

### 1.3 Exemplos ❌/✅

    ❌ feat: adicionado endpoint de pré-guia
    ✅ feat(SCRUM-12): adicionar endpoint de pré-guia

    ❌ style(backend): melhorar nomes das variáveis
    ✅ refactor(SCRUM-22): renomear variáveis do service

    ❌ test(frontend): trocar formatação para GUI
    ✅ style(frontend): trocar formatação da saída para GUI

---

## 2. Branches

### 2.1 Formato

    <tipo>/<CHAVE-JIRA>-<descrição-em-kebab-case>

- Use `-` para separar palavras.
- Sem issue no Jira:

      <tipo>/<descrição-em-kebab-case>

Exemplos:

    feat/SCRUM-12-endpoint-pre-guia
    docs/organizar-pastas
    fix/SCRUM-15-validacao-cpf

### 2.2 Regras

- **Nunca** faça push direto em `main` nem em `develop`.
- Commits pequenos (ex.: ajustar uma vírgula no README) podem ir direto **no seu próprio branch de trabalho**, sem criar outro — mas **nunca** direto em `develop`/`main`.
- Alterações em `develop` só entram via Pull Request.
- Você **não pode** aprovar o próprio PR — peça revisão a outra pessoa.
- **É OBRIGATÓRIO apagar a branch de trabalho (ex: `feat/SCRUM-00`) logo após a realização do merge na `develop`.**
- Repositórios do projeto: `BD_3S_BACKEND` e `BD_3S_FRONTEND`.

---

## 3. Pull Requests

### 3.1 Título

Segue o **mesmo padrão do commit**:

    <tipo>(<CHAVE-JIRA>): <descrição>

Exemplo:

    feat(SCRUM-12): adicionar endpoint de pré-guia

### 3.2 Corpo (Template)

Ao abrir um Pull Request, copie e cole o template abaixo no campo de descrição e preencha as informações:

    ## O que foi feito?
    <!-- Descreva a mudança de forma objetiva -->

    ## O que foi alterado?
    <!-- Liste os pontos principais da alteração -->
    -
    -

    ## Por que foi feito?
    <!-- Motivo, problema resolvido ou link da issue -->
    Issue no Jira: SCRUM-XX

    ## Checklist
    - [ ] Meu código segue o padrão do projeto
    - [ ] Meus commits seguem o padrão de mensagens (`CONTRIBUTING.md`)
    - [ ] Testei localmente
    - [ ] Atualizei a documentação (se aplicável)

---

## 4. Merge Commits (Fusão)

Todo Pull Request deve ser finalizado utilizando a opção **"Create a merge commit"**. 
Isso preserva o histórico de commits individuais da branch de trabalho e gera um commit de merge na `develop`/`main`, garantindo a rastreabilidade exata das alterações.

Ao realizar o merge, edite a mensagem final do commit de merge para seguir o mesmo padrão da Seção 1:

**Formato Obrigatório:**
    <tipo>(<CHAVE-JIRA>): <descrição concisa> (#<número_do_pr>)

**Exemplo:**
    feat(SCRUM-123): adicionar mensagem de boas-vindas (#42)

### 4.1. Fluxo de Merge entre Branches

A `main` somente poderá receber alterações por meio de um merge originado da `develop`.

O fluxo obrigatório para integração das alterações é:
    Branch de trabalho → Pull Request → develop → Pull Request → main

- Alterações em branches de trabalho devem ser integradas primeiro à `develop` via Pull Request.
- **É OBRIGATÓRIO apagar a branch de trabalho (ex: `feat/SCRUM-00`) imediatamente após a realização do merge na `develop`.** (No GitHub, utilize o botão "Delete branch" que aparece após o merge).
- Após a integração na `develop`, as alterações poderão ser encaminhadas para a `main` por meio de um novo Pull Request.
- **Não** é permitido realizar merge diretamente de uma branch de trabalho para a `main`.
- **Não** é permitido realizar push direto na `main`.
- A `main` deve conter somente alterações que tenham passado previamente pela `develop`.
- Os merges devem respeitar as regras de revisão e aprovação definidas na Seção 2.2 (Regras de Proteção de Branch).

Esse fluxo garante que a `develop` funcione como ambiente de integração das alterações antes de serem incorporadas à `main`, mantendo o histórico e o processo de revisão organizados. Além disso, cada commit na `develop`/`main` representará uma mudança completa, rastreável ao PR e à issue do Jira que a originou.

---

## 5. Referência rápida

| Situação              | Padrão |
|-----------------------|--------|
| Commit                | `tipo(SCRUM-12): descrição` |
| Branch                | `tipo/SCRUM-12-descricao-curta` |
| Título do PR          | igual ao commit |
| Merge                 | "Create a merge commit" com a mensagem do commit + `(#PR)` |
| Pós-Merge             | Apagar a branch de trabalho (ex: `feat/SCRUM-00`) |
| Descrição             | infinitivo, minúscula, sem ponto final |
