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

    <tipo>(<CHAVE-JIRA>-<Ty-FEx>): <descrição no infinitivo>
    <tipo>(<CHAVE-JIRA>-<Ty-BEx>): <descrição no infinitivo>

- **`<tipo>`** — obrigatório (ver tabela abaixo).
- **`(<CHAVE-JIRA>-<Ty-FEx>)`** — Identificador completo da task (Jira + Tela + Task de Frontend ou Backend). Ex.: `(SCRUM-12-T1-FE1)` ou `(SCRUM-15-T2-BE3)`. Se o commit não tiver issue, use o escopo normal, ex: `(readme)` ou omita os parênteses.
- **`<descrição>`** — no **infinitivo** ("adicionar", "corrigir"), minúscula, sem ponto final.

> ⚠️ **Regra da equipe:** descrição no **infinitivo**. Não use particípio ("adicionado") nem 3ª pessoa ("adiciona").

### 1.2 Tipos

| Tipo      | Quando usar                                         | Exemplo |
|-----------|-----------------------------------------------------|---------|
| `feat`    | Adiciona algo novo                                  | `feat(SCRUM-12-T1-BE1): adicionar endpoint de pré-guia` |
| `fix`     | Corrige comportamento errado                        | `fix(SCRUM-15-T2-BE3): corrigir validação de CPF` |
| `docs`    | Documentação (README, guias)                        | `docs(SCRUM-20-T4-FE2): ajustar textos da tela` |
| `style`   | Formatação/espaços — **não muda lógica nem nomes**  | `style(SCRUM-30-T1-FE1): remover espaços em branco` |
| `refactor`| Reorganiza/renomeia **sem mudar comportamento**     | `refactor(SCRUM-22-T3-BE4): renomear variáveis do service` |
| `test`    | Adiciona/ajusta **testes automatizados**            | `test(SCRUM-12-T1-BE1): cobrir endpoint de PDF com testes` |
| `chore`   | Manutenção que não altera lógica (pastas, configs)  | `chore(estrutura): criar pastas src/ e docs/` |

### 1.3 Exemplos ❌/✅

    ❌ feat: adicionado endpoint de pré-guia
    ✅ feat(SCRUM-12-T1-BE1): adicionar endpoint de pré-guia

    ❌ style(backend): melhorar nomes das variáveis
    ✅ refactor(SCRUM-22-T3-BE4): renomear variáveis do service

    ❌ test(frontend): trocar formatação para GUI
    ✅ style(SCRUM-30-T1-FE1): trocar formatação da saída para GUI

---

## 2. Branches

### 2.1 Formato

A nomenclatura de branch deve seguir a estrutura de Tela (T) e Task (FE/BE):

    <tipo>/<CHAVE-JIRA>-<Ty-FEx>   (Para Frontend)
    <tipo>/<CHAVE-JIRA>-<Ty-BEx>   (Para Backend)

- **`<tipo>`** — mesmo tipo do commit (ex: `feat`, `fix`, `docs`).
- **`<CHAVE-JIRA>`** — Chave da issue (ex: `SCRUM-12`).
- **`Ty`** — Tela número `y` (ex: `T1`, `T2`).
- **`FEx` ou `BEx`** — Task `x` de Frontend ou Backend (ex: `FE1`, `BE2`).

- Se o trabalho não tiver issue no Jira (ex: ajustes na documentação), use:

      <tipo>/<descrição-em-kebab-case>

**Exemplos:**

    feat/SCRUM-12-T1-FE1
    fix/SCRUM-15-T2-BE3
    docs/organizar-pastas

### 2.2 Regras

- **Nunca** faça push direto em `main` nem em `develop`.
- Commits pequenos (ex.: ajustar uma vírgula no README) podem ir direto **no seu próprio branch de trabalho**, sem criar outro — mas **nunca** direto em `develop`/`main`.
- Alterações em `develop` só entram via Pull Request.
- Você **não pode** aprovar o próprio PR — peça revisão a outra pessoa.
- **É OBRIGATÓRIO apagar a branch de trabalho (ex: `feat/SCRUM-00-T1-FE1`) logo após a realização do merge na `develop`.**
- Repositórios do projeto: `BD_3S_BACKEND` e `BD_3S_FRONTEND`.

---

## 3. Pull Requests

### 3.1 Título

O título do Pull Request segue um padrão próprio, focado na identificação rápida da tarefa:

    [<CHAVE-JIRA>] <descrição>
    [NAO-POSSUI-CHAVE-JIRA] <descrição>

- **`[<CHAVE-JIRA>]`** — A chave da issue entre colchetes (ex: `[SCRUM-82]`).
- **`[NAO-POSSUI-CHAVE-JIRA]`** — Utilize esta tag caso a alteração não esteja atrelada a um card no Jira.
- **`<descrição>`** — Descrição clara e objetiva com a primeira letra maiúscula.

**Exemplos:**

    [SCRUM-82] Devolver Nova pre-guia ao menu do beneficiario
    [NAO-POSSUI-CHAVE-JIRA] Corrigir perfil de banco errado

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
    Issue no Jira: SCRUM-XX (Tela Y - Task Z)

    ## Checklist
    - [ ] Meu código segue o padrão do projeto
    - [ ] Meus commits seguem o padrão de mensagens (`CONTRIBUTING.md`)
    - [ ] Testei localmente
    - [ ] Atualizei a documentação (se aplicável)

---

## 4. Merge Commits (Fusão)

Todo Pull Request deve ser finalizado utilizando a opção **"Create a merge commit"**. 
Isso preserva o histórico de commits individuais da branch de trabalho e gera um commit de merge na `develop`/`main`, garantindo a rastreabilidade exata das alterações.

A mensagem gerada automaticamente pelo GitHub ao realizar o merge deve ser mantida. Não é necessário editá-la.

**Formato Padrão (Gerado pelo GitHub):**
    Merge pull request #<número_do_pr> from <nome_da_organização>/<nome_da_branch>

**Exemplo:**
    Merge pull request #66 from DATASQUAD-3SEM/fix/dev-tunnel

### 4.1. Fluxo de Merge entre Branches

A `main` somente poderá receber alterações por meio de um merge originado da `develop`.

O fluxo obrigatório para integração das alterações é:
    Branch de trabalho → Pull Request → develop → Pull Request → main

- Alterações em branches de trabalho devem ser integradas primeiro à `develop` via Pull Request.
- **É OBRIGATÓRIO apagar a branch de trabalho (ex: `feat/SCRUM-00-T1-FE1`) imediatamente após a realização do merge na `develop`.** (No GitHub, utilize o botão "Delete branch" que aparece após o merge).
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
| Commit                | `tipo(SCRUM-12-T1-FE1): descrição` |
| Branch (Frontend)     | `tipo/SCRUM-12-T1-FE1` |
| Branch (Backend)      | `tipo/SCRUM-12-T1-BE1` |
| Título do PR          | `[SCRUM-12] Descrição` ou `[NAO-POSSUI-CHAVE-JIRA] Descrição` |
| Merge                 | "Create a merge commit" (Mensagem padrão do GitHub) |
| Pós-Merge             | Apagar a branch de trabalho (ex: `feat/SCRUM-00-T1-FE1`) |
| Descrição (commit)    | infinitivo, minúscula, sem ponto final |
