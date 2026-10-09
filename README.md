# API 2026 - DATASQUAD: NEXUS

Faculdade de Tecnologia de São José dos Campos - Professor Jessen Vidal

#   
<p align="center">      <img src="docs/img/logo_datasquad.png" alt="logo do Data Squad" width="200">      <h2 align="center"> Data Squad </h2></p>  

<p align="center">  | <a href ="#desafio"> Desafio</a>  |  <a href ="#solucao"> Solução</a>  |     <a href ="#backlog"> Backlog do Produto</a>|     <a href ="#sprintbacklog"> Sprint Backlog </a>  |  <a href ="#sprint"> Cronograma de Sprints</a>  |  <a href ="#tecnologias">Tecnologias</a> |  <a href ="#link">Link para Documentação</a>  |   <a href ="#equipe"> Equipe</a> |</p>  

> Status do Projeto: Em andamento

## Desafio <a id="desafio"></a>

A comunicação e o trâmite documental entre a UG FUSEX (Exército) e as OCS/PSA (clínicas, hospitais e profissionais da área de saúde) ainda depende, em grande parte, de processos manuais e desconexos, desde a emissão do pedido médico até o faturamento. Essa fragmentação eleva o risco de erros de preenchimento, retrabalho e inconsistências no faturamento, além de dificultar o rastreamento de todo o processo.

## Solução <a id="solucao"></a>

Para enfrentar esse cenário, propomos o desenvolvimento de uma aplicação que digitaliza e centraliza o fluxo documental entre beneficiários, FUSEX e OCS/PSA. O sistema permite que o beneficiário crie a pré-guia de forma digital a partir do encaminhamento médico, elimina a necessidade de deslocamento físico até o FUSEX, e possibilita que a guia seja emitida, assinada digitalmente e enviada eletronicamente à OCS escolhida.

Na etapa de faturamento, a aplicação padroniza o recebimento dos espelhos enviados pela OCS e automatiza o processo de lisura e glosa, comparando os valores da guia, do espelho e do contrato — reduzindo o retrabalho manual e a chance de erro humano. O funcionário do FUSEX mantém a possibilidade de revisar e intervir no resultado antes da conclusão do processo, garantindo controle humano sobre casos excepcionais sem abrir mão da agilidade da automação. Com isso, todo o trâmite passa a ser rastreável de ponta a ponta, desde a criação da pré-guia até a liquidação da fatura.

* * *  

## Backlog do Produto <a id="backlog"></a>

| Rank | Prioridade | User Story                                                                                                                                                                                                                   | Estimativa | Sprint |  
| ---- |------------| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |------------|--------|  
| 1    | Alta       | Como beneficiário, quero anexar o encaminhamento médico digitalizado ao meu cadastro, para que ele sirva de base na criação da pré-guia.                                                                                | 8          | 1      |  
| 2    | Alta       | Como beneficiário, quero criar a pré-guia de forma digital informando a OCS e os procedimentos/exames a serem realizados, para que eu não precise ir pessoalmente ao FUSEX com o encaminhamento em mãos.                                                                                                              | 5          | 1      |  
| 3    | Alta       | Como beneficiário, quero acompanhar o status das minhas pré-guias já preenchidas e enviadas, para que eu saiba em que etapa do processo ela está.                                                                        |            | 2      |  
| 4    | Alta      | Como médico do FUSEX, quero ter a possibilidade de criar uma pré-guia para um beneficiário durante uma consulta, para que não haja a necessidade de entregar um encaminhamento físico ao beneficiário.                                                                                                                |            | 2      |  
| 5    | Alta      | Como funcionário do setor de Guias do FUSEX, quero visualizar os detalhes de uma pré-guia, para que eu possa gerar uma Guia digital com as informações.                                                                                                           |            | 2      |  
| 6    | Media      | Como um usuário do aplicativo, quero realizar meu cadastro e incluir uma assinatura digital utilizando meu documento pessoal, para que eu possa acessar e utilizar o sistema com menos burocracias e processos repetitivos.                                                                            |            | 2      |  
| 7    | Media       | Como funcionário do setor de faturas do FUSEX, quero que o espelho enviado pela OCS seja recebido em um formato padronizado, para que os dados possam ser facilmente lidos e coletados pelo sistema.                                                                                                          |            | 3      |  
| 8    | Media      | Como funcionário do setor de rastreabilidade do FUSEX, quero que o sistema compare automaticamente o valor da Guia com o valor do espelho, para que eu possa visualizar e corrigir divergências.                                                                                                                             |            | 3      |  
| 9    | Media       | Como funcionário do setor de rastreabilidade do FUSEX, quero que o sistema compare automaticamente o valor do espelho com o valor presente no contrato com a OCS, para a possível necessidade de agilizar a glosa.                                                                                                    |            | 3      |  
| 10   | Media       | Como funcionário do setor de rastreabilidade do FUSEX, quero conferir as comparações automáticas antes de concluir a rastreabilidade de uma fatura, para que eu possa corrigir eventuais erros antes de enviá-los para a auditoria final.                                                                                            |            | 3      |

* * *  

## Sprint Backlog 📅 <a id="sprintbacklog"></a>

<details>  
  <summary><b>Sprint 1</b></summary>  

### **Sprint 1: Execução e Planejamento**

* **Capacidade Estimada da Equipe:** 13 Story Points.
* **Meta da Sprint:** User Story de rank 1 e 2.
* **Metas Extras:** -

| Link                                                                              | rank | Prioridade | User Story                                                                                                                                    | Estimativa | Sprint |  
| ------------------------------------------------------------------------------- | ---- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------- |------------| ------ |  
| [Anexação do encaminhamento médico digitalizado](docs/sprint/Sprint-1/US1.md) | 1    | Alta       | Como beneficiário, quero anexar o encaminhamento médico digitalizado ao meu cadastro, para que ele sirva de base na criação da pré-guia. | 8          | 1      |  
| [Criação digital da pré-guia](docs/sprint/Sprint-1/US2.md)                      | 2    | Alta       | Como beneficiário, quero criar a pré-guia de forma digital informando a OCS e os procedimentos/exames a serem realizados, para que eu não precise ir pessoalmente ao FUSEX com o encaminhamento em mãos.                                | 5          | 1      |   

</details>  

<br>  

* * *  

<details>  
  <summary><b>Sprint 2</b></summary>  

### **Sprint 1: Execução e Planejamento**

* **Capacidade Estimada da Equipe:** 
* **Meta da Sprint:** User Story de rank 3, 4 e 5.
* **Metas Extras:** User Story de rank 6.

| Link                                                                            | rank | Prioridade | User Story                                                                                                                                    | Estimativa | Sprint |  
|---------------------------------------------------------------------------------|------| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------- |--------|--------|  
| [Acompanhar Status das pré-guias](docs/sprint/Sprint-1/US1.md)                  | 3    | Alta       | Como beneficiário, quero acompanhar o status das minhas pré-guias já preenchidas e enviadas, para que eu saiba em que etapa do processo ela está. |        | 1      |  
| [Criação digital da pré-guia pelo médico do FUSEX](docs/sprint/Sprint-1/US2.md) | 4    | Alta       | Como médico do FUSEX, quero ter a possibilidade de criar uma pré-guia para um beneficiário durante uma consulta, para que não haja a necessidade de entregar um encaminhamento físico ao beneficiário.                                |        | 2      |
| [Vizualização das pré-guias recebidas](docs/sprint/Sprint-1/US2.md)             | 5    | Alta       | Como funcionário do setor de Guias do FUSEX, quero visualizar os detalhes de uma pré-guia, para que eu possa gerar uma Guia digital com as informações.                                |        | 2      |
| [Assinaturas digitais](docs/sprint/Sprint-1/US2.md)                             | 6    | Alta       | Como um usuário do aplicativo, quero realizar meu cadastro e incluir uma assinatura digital utilizando meu documento pessoal, para que eu possa acessar e utilizar o sistema com menos burocracias e processos repetitivos.                                |        | 2      |
</details>  

<br>  

* * *  

## Cronograma de Sprints <a id="sprint"></a>

Sprint | Previsão | Status       |  
|------|--------|--------------|  
|Sprint 01 | 07/09/2026 | Finalizada   |  
|Sprint 02| 05/10/2026| Em andamento |  
|Sprint 03| 02/11/2026 | Não iniciado |  

* * * 
### Definition of Ready (DoR)

Para uma User Sory estar apta ao início de um Sprint, os critérios a seguir devem ser concluídos:

- Itens mandatórios já identificados.
- Tem uma clara separação de **instruções, descrição e exemplos**.
- **Critérios de aceitação e regras de negócio** definidos.
- **Prioridade** já definida.
- O **esforço** já definido pela equipe.

### Definition of Done (DoD)

Para uma User Story ser considerada **completa**, os seguintes critérios devem ser concluídos:

- O código está escrito, testado e limpo (seguindo os padrões da equipe).

- A funcionalidade está integrada à branch **develop** do repositório [BD_3S_BACKEND](https://github.com/DATASQUAD-3SEM/BD_3S_BACKEND) ou **develop** do repositório [BD_3S_FRONTEND](https://github.com/DATASQUAD-3SEM/BD_3S_FRONTEND).

- Os **critérios de aceitação** de uma **User Story** foram completos.

- A interface leva em consideração a facilidade de uso ao usuário.

- A funcionalidade foi **testada** e **aprovada** pelo **Product Owner (PO)**.

*** 

## Tecnologias <a id="tecnologias"></a>

<h4 align="center">  
        <a href="https://www.java.com/"><img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white"></a>  
        <a href="https://www.jetbrains.com/idea/"><img src="https://img.shields.io/badge/IntelliJ_IDEA-000000?style=for-the-badge&logo=intellijidea&logoColor=white"></a>  
        <a href="https://spring.io/"><img src="https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white"></a>  
        <a href="https://maven.apache.org/"><img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white"></a>  
        <a href="https://www.atlassian.com/software/jira"><img src="https://img.shields.io/badge/Jira-0052CC?style=for-the-badge&logo=jira&logoColor=white"></a>  
        <a href="https://github.com/about"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"></a>  
</h4>  

* * *  

## Link para as documentações <a id="link"></a>

* [Manual de Instalação](docs/manual/instalacao.md)
* [Manual do Usuário](docs/manual/usuario.md)

* * *  

# Equipe

| Função        | Nome                                    | Github                                                                                                                                              |  
| ------------- | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |  
| Product Owner | Wanderson Ricardo dos Santos            | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Wander717)               |  
| Scrum Master  | Maria Clara Prado Farkas                | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/mariaclarafarkas75-byte) |
| Team Member   | Guilhermina Moreira D'Onofrio           | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/guismdonofrio)           |  
| Team Member   | Rubens Ferreira Venancio                | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rubensvnc/)              |
