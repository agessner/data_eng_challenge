# Desafio M

Uma aplicação envolvendo extração, transformação, carregamento e visualização dos dados.

## AWS 

### Preparação dos dados

Os arquivos utilizados para adicionar os dados no DB foram inseridos em um Bucket do AWS S3. 

O arquivo 'pagamentos.CSV' foi pré formatado manualmente transformado o delimitador de ',' para '|' pois ao importar os dados com comando COPY  do S3 para o Redshift o PostgreSQL estava sendo lendo a vírgula do valor (R$ 400,00) como uma nova célula ocorrendo conflitos durante importação.

Arquivos no Bucket:
 - pagamentos.csv : Arquivo original de pagamentos
 - pagamentos_fix.csv : Arquivo com delimitador entre células sendo '|'
 - clientes.csv : Arquivo contendo compilado de informações dos clientes, extraído utilizando código Python (Coleta dos clientes.ipynb). Este arquivo foi criado para evitar acessos contínuos na API, armazenado diretamente no AWS Redshift. 

### Scripts  de criação do DB

 PostgreSQLCommands.sql contem a sequencia de comandos SQL utilizados para criação de tabelas no DB, importação utilizando os CSV do Bucket e uma pré formatação dos dados( pré formatação realizada dentro do banco pois se for é mais otimizada se utilizando Python). 


##  Processamento e análise dos dados

Os dados foram importados em um Jupyter Notebook para melhor visualização da sequencia utilizada para o processamento dos dados existente no DB e também de suas análises realizadas. 