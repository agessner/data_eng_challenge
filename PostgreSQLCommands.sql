-- Script de criacao do DB. 
-- tabela povoada utilizando dados da api (https://demo4417994.mockable.io/clientes/)
CREATE TABLE clientes(
            cliente_id INTEGER PRIMARY KEY NOT NULL,
            nome varchar(50),
            cidade varchar(50),
            estado varchar(2),
            segmento varchar(50)
);
-- tabela povoada utilizando o arquivo pagamentos.csv
CREATE TABLE pagamentos(
            -- pagamento_id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
            -- cliente_id INTEGER REFERENCES clientes(cliente_id),
            cliente_id INTEGER ,
            data DATE,
            -- valor NUMERIC (7,2),
            valor varchar(15),
            plano varchar(15) 
);
-- tabela povoada dinamicamente ao gerar uma consulta em dado mes
CREATE TABLE metricas(
            -- metrica_id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
            data DATE,
            mrr NUMERIC (7,2),
            new_mrr NUMERIC (7,2),
            exp_mrr NUMERIC (7,2),
            con_mrr NUMERIC (7,2),
            can_mrr NUMERIC (7,2),
            res_mrr NUMERIC (7,2)
);


-- Importa os dados do aws s3 bucket pro DB do redshift
copy pagamentos from 's3://mercosbucket/Files/pag_fix.csv'
credentials 'aws_iam_role=arn:aws:iam::638555777142:role/mercosRole' 
delimiter '|' dateformat 'DD/MM/YYYY';

--- Modelo para separacao dos dados
select date_add('month',1,date_trunc('month',data)) as p1 ,
       date_trunc('month',data)  as orig,
       split_part(plano, '/', 1) AS plano_tipo,
       split_part(plano, '/', 2) AS plano_tempo
from pagamentos;




-- Outros
select count(*) from pagamentos;
SET datestyle = dmy;
select * from stl_load_errors;