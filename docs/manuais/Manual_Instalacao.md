# 📘 Manual de Instalação — NEXUS

> Siga cada etapa **na ordem indicada**. Este manual foi escrito para computadores com **Windows 10 ou 11** recém-formatados e para quem **nunca instalou um sistema antes**. Não pule nenhuma etapa.

> ℹ️ O NEXUS ainda está em desenvolvimento. Algumas telas são protótipos e podem mudar. Os passos de instalação abaixo valem para a versão atual do sistema.

---

## Sumário

0. [Entenda o que será instalado](#0-entenda-o-que-será-instalado)
1. [Instalar o Git](#1-instalar-o-git)
2. [Instalar o Java (JDK 21)](#2-instalar-o-java-jdk-21)
3. [Instalar o Node.js](#3-instalar-o-nodejs)
4. [Instalar o MySQL](#4-instalar-o-mysql)
5. [Criar o banco de dados](#5-criar-o-banco-de-dados)
6. [Baixar o sistema](#6-baixar-o-sistema)
7. [Executar o Backend (servidor)](#7-executar-o-backend-servidor)
8. [Executar o Frontend (telas)](#8-executar-o-frontend-telas)
9. [Acessar o sistema](#9-acessar-o-sistema)
10. [Usar o sistema nos dias seguintes](#10-usar-o-sistema-nos-dias-seguintes)
11. [Apagar tudo e recomeçar](#11-apagar-tudo-e-recomeçar)
12. [Solução de problemas](#12-solução-de-problemas)

---

## 0. Entenda o que será instalado

O NEXUS é formado por **duas partes** que funcionam juntas, mais um **banco de dados**:

| Parte | O que faz | Repositório | Endereço quando estiver rodando |
|---|---|---|---|
| **Banco de dados (MySQL)** | Guarda todas as informações | — | `localhost:3306` |
| **Backend** | O "cérebro": regras de negócio e acesso ao banco | `BD_3S_BACKEND` | `http://localhost:8080` |
| **Frontend** | As telas que você vê no navegador | `BD_3S_FRONTEND` | `https://localhost:5173` |

**Programas que você vai instalar:**

| Programa | Para quê | Versão |
|---|---|---|
| Git | Baixar o sistema do GitHub | qualquer versão recente |
| Java (JDK) | Executar o Backend | **21** |
| Node.js | Executar o Frontend | **22 (LTS)** |
| MySQL | Banco de dados | **8.x** |

**Você também precisa de:**

- Conexão com a **internet** (a primeira execução baixa bibliotecas, o que leva alguns minutos)
- Cerca de **3 GB** livres no disco
- Permissão de **administrador** no computador

> 💡 **Dica:** durante o manual você vai digitar comandos em uma janela preta chamada **Prompt de Comando** (ou `cmd`). Para abri-la, pressione `Windows + R`, digite `cmd` e pressione `Enter`. Para executar um comando, digite (ou cole) e pressione `Enter`.

---

## 1. Instalar o Git

O Git é o programa que baixa o NEXUS do GitHub.

### 1.1 Baixar o instalador

Acesse: https://git-scm.com/download/win

Clique em **Click here to download** (ou em **64-bit Git for Windows Setup**).

### 1.2 Instalar

1. Execute o arquivo baixado com duplo clique
2. Se aparecer a tela do **UAC** (Controle de Conta de Usuário), clique em **Sim**
3. Clique em **Next** em todas as telas, sem alterar nada
4. Clique em **Install** e aguarde
5. Clique em **Finish**

### 1.3 Verificar a instalação

1. Pressione `Windows + R`, digite `cmd` e pressione `Enter`
2. Digite:

```
git --version
```

O resultado esperado é algo como:

```
git version 2.47.0.windows.1
```

Se aparecer uma versão, o Git está instalado. Caso contrário, **reinicie o computador** e tente novamente.

---

## 2. Instalar o Java (JDK 21)

O Backend exige o **Java 21**.

### 2.1 Baixar o instalador

Acesse: https://www.oracle.com/java/technologies/javase/jdk21-archive-downloads.html

1. Procure a seção **Java SE Development Kit 21.0.x** (use a versão **21** mais recente da lista)
2. Na aba **Windows**, clique no link **x64 Installer** (arquivo `.exe`)
3. Marque a caixa de aceite dos termos, se solicitado, e clique em **Download**

> Se a Oracle pedir login, use a alternativa gratuita: https://adoptium.net/temurin/releases/?version=21 → escolha **Windows**, **x64**, **JDK**, tipo **.msi**. Na instalação, em **Custom Setup**, ative a opção **Set JAVA_HOME variable**.

### 2.2 Instalar

1. Execute o arquivo baixado com duplo clique
2. Clique em **Sim** se aparecer o UAC
3. Clique em **Next** em todas as telas
4. Clique em **Close** ao finalizar

### 2.3 Verificar a instalação

1. Abra um **novo** Prompt de Comando (`Windows + R` → `cmd` → `Enter`)
2. Digite:

```
java --version
```

O resultado esperado é algo como:

```
java 21.0.8 2025-07-15 LTS
```

Se aparecer `21`, o Java está instalado corretamente. Caso contrário, reinicie o computador e tente novamente.

> ⚠️ Se aparecer outra versão (por exemplo, 8 ou 17), há outro Java instalado. Desinstale-o em **Configurações → Aplicativos** ou veja [Solução de problemas](#java-na-versão-errada).

---

## 3. Instalar o Node.js

O Node.js executa o Frontend.

### 3.1 Baixar o instalador

Acesse: https://nodejs.org/pt

Clique no botão **Baixar Node.js (LTS)** e escolha o instalador do Windows (`.msi`, 64 bits). Use a versão **22** ou superior.

### 3.2 Instalar

1. Execute o arquivo `.msi` baixado com duplo clique
2. Clique em **Sim** se aparecer o UAC
3. Clique em **Next** em todas as telas, sem alterar nada
4. **Não** marque a opção de instalar ferramentas adicionais (se aparecer)
5. Clique em **Install** e depois em **Finish**

### 3.3 Verificar a instalação

1. Abra um **novo** Prompt de Comando
2. Digite:

```
node --version
```

Resultado esperado: algo como `v22.11.0` (qualquer versão `v20.19` ou superior funciona).

3. Digite:

```
npm --version
```

Resultado esperado: um número, como `10.9.0`.

---

## 4. Instalar o MySQL

### 4.1 Baixar o instalador

Acesse: https://dev.mysql.com/downloads/installer/

Clique no botão **Download** do arquivo **maior** (ex.: `mysql-installer-community-8.0.xx.msi`).

Na próxima tela, clique em **No thanks, just start my download**.

### 4.2 Instalar

1. Execute o arquivo `.msi` baixado com duplo clique
2. Se aparecer a tela do **UAC**, clique em **Sim**
3. Na tela **Choosing a Setup Type**, selecione **Developer Default** e clique em **Next**
4. Clique em **Next** e depois em **Execute** — aguarde o download e a instalação dos componentes
5. Clique em **Next** até chegar na tela **Accounts and Roles**

> Se aparecer um aviso de componentes que não puderam ser instalados (por exemplo, Visual Studio ou Python), clique em **Next** e depois em **Yes** para continuar. Eles não são necessários.

### 4.3 Definir a senha do root

Na tela **Accounts and Roles**:

- Em **MySQL Root Password**, digite uma senha e **anote ela em um papel** — você precisará dela no próximo passo
- Em **Repeat Password**, repita a senha
- Clique em **Next**

> ⚠️ **Não esqueça essa senha.** Ela é a senha do usuário administrador do MySQL (`root`).

### 4.4 Finalizar a instalação

1. Continue clicando em **Next** nas telas seguintes, sem alterar nada. Em **Windows Service**, mantenha o serviço configurado para **iniciar com o Windows** e o nome `MySQL80`
2. Clique em **Execute** quando solicitado para aplicar as configurações
3. Clique em **Finish** ao terminar

### 4.5 Verificar a instalação

1. Abra um **novo** Prompt de Comando
2. Digite:

```
mysql -u root -p
```

3. Digite a senha do `root` definida no passo 4.3 e pressione `Enter` (ao digitar a senha, nada aparece na tela — isso é normal)
4. Se aparecer `mysql>`, o MySQL está funcionando
5. Digite `exit` e pressione `Enter` para sair

> Se aparecer `'mysql' não é reconhecido como um comando`, use o **MySQL Workbench** no passo seguinte, que não depende desse comando.

---

## 5. Criar o banco de dados

Você só precisa criar um banco **vazio** e um usuário. **As tabelas e os dados de exemplo são criados automaticamente** quando o Backend é iniciado pela primeira vez.

### 5.1 Abrir o MySQL Workbench

1. Pesquise **MySQL Workbench** no menu Iniciar e abra
2. Clique em **Local instance MySQL80** (ou similar)
3. Digite a senha do `root` definida no passo 4.3 e clique em **OK**

### 5.2 Criar o banco e o usuário

1. No menu superior, clique em **File** → **New Query Tab**
2. Cole **todo** o texto abaixo:

```sql
CREATE DATABASE IF NOT EXISTS nexus
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'nexus'@'localhost' IDENTIFIED BY 'nexus';
CREATE USER IF NOT EXISTS 'nexus'@'%' IDENTIFIED BY 'nexus';

GRANT ALL PRIVILEGES ON nexus.* TO 'nexus'@'localhost';
GRANT ALL PRIVILEGES ON nexus.* TO 'nexus'@'%';
FLUSH PRIVILEGES;
```

3. Clique no botão **⚡ (Execute)** ou pressione `Ctrl + Shift + Enter`
4. Na parte inferior (**Action Output**), todas as linhas devem aparecer com um ✔ verde

### 5.3 Conferir

Na mesma aba, apague o texto, cole o comando abaixo e execute novamente:

```sql
SHOW DATABASES;
```

Na lista de resultados deve aparecer o banco **`nexus`**.

> 💡 O banco é criado com o usuário `nexus` e a senha `nexus`. É exatamente isso que o Backend espera por padrão, por isso **não é preciso editar nenhum arquivo de configuração**.

---

## 6. Baixar o sistema

### 6.1 Criar a pasta do projeto

1. Abra um Prompt de Comando
2. Digite os comandos abaixo, **um por vez**, pressionando `Enter` após cada um:

```
cd C:\
mkdir NEXUS
cd NEXUS
```

### 6.2 Baixar os dois repositórios

Ainda no mesmo Prompt de Comando, digite:

```
git clone -b develop https://github.com/DATASQUAD-3SEM/BD_3S_BACKEND.git
```

Aguarde terminar. Depois digite:

```
git clone -b develop https://github.com/DATASQUAD-3SEM/BD_3S_FRONTEND.git
```

### 6.3 Conferir

Digite:

```
dir
```

A pasta deve estar assim:

```
C:\NEXUS\
├── BD_3S_BACKEND\
└── BD_3S_FRONTEND\
```

> ⚠️ As duas pastas precisam ficar **lado a lado**, dentro da mesma pasta, e **com esses nomes exatos**.

---

## 7. Executar o Backend (servidor)

### 7.1 Abrir o terminal na pasta do Backend

1. Abra o **Explorador de Arquivos** e entre em `C:\NEXUS\BD_3S_BACKEND`
2. Clique na **barra de endereço** do explorador, digite `cmd` e pressione `Enter`

### 7.2 Iniciar

No terminal que abrir, digite:

```
mvnw.cmd spring-boot:run
```

### 7.3 Aguardar

- Na **primeira vez**, o sistema baixa bibliotecas da internet. **Isso pode levar de 3 a 10 minutos.** Linhas de texto vão passar na tela — é normal.
- Em seguida, ele cria as tabelas e os dados de exemplo no banco.
- Quando terminar, aparece uma linha parecida com:

```
Started NexusApplication in 12.345 seconds
```

### 7.4 Verificar

Abra o navegador e acesse: http://localhost:8080/actuator/health

Deve aparecer:

```json
{"status":"UP"}
```

> ⚠️ **Deixe esta janela do terminal aberta.** Se você fechá-la, o Backend para. Para pará-lo propositalmente, clique na janela e pressione `Ctrl + C`.

---

## 8. Executar o Frontend (telas)

Use uma **segunda** janela de terminal (o Backend continua rodando na primeira).

### 8.1 Abrir o terminal na pasta do Frontend

1. No **Explorador de Arquivos**, entre em `C:\NEXUS\BD_3S_FRONTEND`
2. Clique na **barra de endereço**, digite `cmd` e pressione `Enter`

### 8.2 Instalar as dependências (somente na primeira vez)

```
npm install
```

Aguarde alguns minutos até o cursor voltar a piscar. Avisos (`warn`) podem aparecer e podem ser ignorados.

### 8.3 Iniciar

```
npm run dev
```

Quando estiver pronto, aparece algo como:

```
  VITE v8.x  ready in 800 ms

  ➜  Local:   https://localhost:5173/
```

> ⚠️ **Deixe esta janela aberta também.** Para parar, pressione `Ctrl + C`.

---

## 9. Acessar o sistema

### 9.1 Abrir no navegador

Acesse: **https://localhost:5173**

### 9.2 Aviso de "conexão não particular"

Na primeira vez, o navegador mostra um aviso de segurança (por exemplo, **"Sua conexão não é particular"**). Isso é esperado: o certificado é gerado no próprio computador.

1. Clique em **Avançado**
2. Clique em **Ir para localhost (não seguro)** (no Firefox: **Aceitar o risco e continuar**)

### 9.3 Entrar

Use uma das contas de exemplo abaixo. **A senha de todas é `senha123`.**

| Perfil | Login |
|---|---|
| Beneficiário | `52998224725` |
| Médico | `11144477735` |
| Responsável legal (de dependente menor) | `41282945009` |
| Chefe da FUSEX | `chefe.fusex` |
| Setor de Guias | `setor.guias` |
| Recepção | `recepcao` |
| OCS (laboratório) | `ocs.laboratorio` |
| Setor de Fatura | `setor.fatura` |
| Rastreabilidade | `rastreabilidade` |
| Auditoria | `auditoria` |

Na tela de login, também há um cartão de **acesso rápido** com algumas dessas contas (aparece apenas na versão de desenvolvimento).

> ℹ️ As contas acima são **dados de demonstração**. Para conhecer o que cada perfil faz, consulte o [Manual do Usuário](./Manual_Usuario.md).

### 9.4 Testar a conexão entre as duas partes (opcional)

Acesse: https://localhost:5173/diagnostico/conexao

A página mostra se o Frontend consegue conversar com o Backend.

---

## 10. Usar o sistema nos dias seguintes

Depois de instalado, **não repita** os passos 1 a 6. Todo dia que for usar:

1. Confirme que o **MySQL** está rodando: `Windows + R` → `services.msc` → **MySQL80** com status **Em execução**
2. Abra um terminal em `C:\NEXUS\BD_3S_BACKEND` e execute `mvnw.cmd spring-boot:run` (agora leva cerca de 30 segundos)
3. Abra outro terminal em `C:\NEXUS\BD_3S_FRONTEND` e execute `npm run dev`
4. Acesse https://localhost:5173

### Atualizar para a versão mais nova do sistema

Com os dois terminais **parados** (`Ctrl + C`):

1. No terminal da pasta `BD_3S_BACKEND`, digite `git pull`
2. No terminal da pasta `BD_3S_FRONTEND`, digite `git pull` e depois `npm install`
3. Inicie os dois novamente, como acima

---

## 11. Apagar tudo e recomeçar

Para voltar o sistema ao estado inicial (**isto apaga todos os dados**):

1. Pare o Backend (`Ctrl + C`)
2. No MySQL Workbench, execute:

```sql
DROP DATABASE nexus;
CREATE DATABASE nexus CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. Apague a pasta `C:\NEXUS\BD_3S_BACKEND\uploads` (arquivos enviados pelo sistema)
4. Inicie o Backend novamente (passo 7)

---

## 12. Solução de problemas

### "git / java / node / npm não é reconhecido como um comando"

O programa não foi instalado corretamente, ou o terminal foi aberto **antes** da instalação. Feche o terminal e abra um novo. Se persistir, reinicie o computador. Se ainda assim persistir, repita a instalação do programa.

### Java na versão errada

Se `java --version` mostra outra versão que não a 21:

1. Em **Configurações → Aplicativos**, desinstale as outras versões do Java
2. Reinicie o computador e confira novamente

### "JAVA_HOME not found" ao executar o `mvnw.cmd`

1. Pressione a tecla `Windows`, digite **variáveis de ambiente** e abra **Editar as variáveis de ambiente do sistema**
2. Clique em **Variáveis de Ambiente…**
3. Em **Variáveis do sistema**, clique em **Novo…**
4. Nome: `JAVA_HOME` — Valor: a pasta onde o JDK 21 foi instalado (ex.: `C:\Program Files\Java\jdk-21`)
5. Clique em **OK** em todas as janelas, **feche e abra** o terminal e tente de novo

### O Backend mostra "Communications link failure" ou "Connection refused"

O MySQL não está rodando:

1. Pressione `Windows + R`, digite `services.msc` e pressione `Enter`
2. Procure **MySQL80**
3. Se o status não for **Em execução**, clique com o botão direito → **Iniciar**

### O Backend mostra "Access denied for user 'nexus'" ou "Unknown database 'nexus'"

O passo 5 não foi feito (ou foi feito com erro). Refaça o [passo 5](#5-criar-o-banco-de-dados) e inicie o Backend novamente.

### O Backend mostra "Migration checksum mismatch" (geralmente depois de atualizar o sistema)

A estrutura do banco que você já tem ficou diferente da que a nova versão do sistema espera. A solução é apagar e recriar o banco, seguindo o [passo 11](#11-apagar-tudo-e-recomeçar). **Isso apaga todos os dados** (os dados de exemplo são recriados na próxima inicialização). Avise a equipe de desenvolvimento, pois pode indicar que uma alteração antiga do banco foi editada.

### O Backend mostra "Port 8080 was already in use"

Outro programa está usando a porta 8080. Pode ser outra janela do Backend aberta. Feche todos os terminais, abra um novo e tente de novo. Se persistir, reinicie o computador.

### O Frontend mostra "Port 5173 is already in use"

Há outra janela do Frontend aberta. Feche-a (ou pressione `Ctrl + C` nela) e tente novamente.

### O MySQL não instala / a porta 3306 está ocupada

Se você já tinha o MySQL instalado, ele pode estar usando a porta 3306. Utilize a instalação existente e siga a partir do [passo 5](#5-criar-o-banco-de-dados), usando a senha `root` que você já conhece.

### O navegador abre, mas a tela de login mostra erro de conexão

O Backend não está rodando ou ainda não terminou de iniciar. Confira no passo [7.4](#74-verificar) se http://localhost:8080/actuator/health responde `UP`.

### O navegador diz "Sua conexão não é particular"

É esperado. Veja o [passo 9.2](#92-aviso-de-conexão-não-particular).

### `npm install` termina com erros vermelhos (`ERR!`)

- Confirme que há internet
- Confirme a versão do Node (`node --version` deve ser `v20.19` ou superior)
- Apague a pasta `node_modules` (se existir) dentro de `BD_3S_FRONTEND` e execute `npm install` novamente

### O terminal fecha rápido ou fica parado sem mensagem

Execute sempre pelo terminal (como descrito nos passos 7 e 8), para ver a mensagem de erro completa antes de a janela fechar.

### Esqueci a senha do `root` do MySQL

Não há como recuperá-la. Será necessário desinstalar e reinstalar o MySQL (**Painel de Controle → Desinstalar um programa**) e refazer a partir do [passo 4](#4-instalar-o-mysql).

---


