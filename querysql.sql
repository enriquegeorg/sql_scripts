GOTO $(tabela);

querydfeaplicacao:
SELECT CAST(TDFE_PARAMETRO_APLICACAO.COD_PARAMETRO  AS VARCHAR(40)) AS COD_PARAMETRO, 	CAST(TDFE_PARAMETRO.DES_PARAMETRO AS VARCHAR(100)) AS DES_PARAMETRO, 	CAST(TDFE_PARAMETRO_APLICACAO.DES_VALOR AS VARCHAR(120)) AS DES_VALOR FROM TDFE_PARAMETRO_APLICACAO INNER JOIN TDFE_PARAMETRO ON(TDFE_PARAMETRO_APLICACAO.COD_PARAMETRO=TDFE_PARAMETRO.COD_PARAMETRO)
SET NOEXEC ON;
querydfeempresa:
SELECT CAST(TFRW_EMPRESA.COD_EMPRESA  AS VARCHAR(2)) AS COD_EMPRESA, CAST(TDFE_PARAMETRO_EMPRESA.COD_PARAMETRO  AS VARCHAR(40)) AS COD_PARAMETRO, CAST(TDFE_PARAMETRO.DES_PARAMETRO AS VARCHAR(80)) AS DES_PARAMETRO, CAST(TDFE_PARAMETRO_EMPRESA.DES_VALOR AS VARCHAR(40)) AS DES_VALOR FROM TDFE_PARAMETRO_EMPRESA INNER JOIN TFRW_EMPRESA ON(TDFE_PARAMETRO_EMPRESA.COD_EMPRESA=TFRW_EMPRESA.COD_EMPRESA) INNER JOIN TDFE_PARAMETRO ON(TDFE_PARAMETRO_EMPRESA.COD_PARAMETRO=TDFE_PARAMETRO.COD_PARAMETRO)
SET NOEXEC ON;
querydfeestab:
SELECT CAST(TDFE_PARAMETRO_ESTABELECIMENTO.COD_EMPRESA AS VARCHAR(10)) AS COD_EMPRESA, CAST(TDFE_PARAMETRO_ESTABELECIMENTO.COD_ESTABELECIMENTO AS VARCHAR(10)) AS COD_ESTABELECIMENTO, CAST(TDFE_PARAMETRO_NIVEL.DES_NIVEL AS VARCHAR(20)) AS DES_NIVEL, CAST(TDFE_PARAMETRO_ESTABELECIMENTO.COD_PARAMETRO AS VARCHAR(40)) AS COD_PARAMETRO, CAST(TDFE_PARAMETRO.DES_PARAMETRO AS VARCHAR(80)) AS DES_PARAMETRO, 	CAST(TDFE_PARAMETRO_ESTABELECIMENTO.DES_VALOR AS VARCHAR(40)) AS DES_VALOR FROM TDFE_PARAMETRO_ESTABELECIMENTO INNER JOIN TDFE_PARAMETRO ON(TDFE_PARAMETRO_ESTABELECIMENTO.COD_PARAMETRO=TDFE_PARAMETRO.COD_PARAMETRO) LEFT JOIN TDFE_PARAMETRO_NIVEL ON (TDFE_PARAMETRO_NIVEL.DES_TABLE='TDFE_PARAMETRO_ESTABELECIMENTO' AND TDFE_PARAMETRO.COD_NIVEL=TDFE_PARAMETRO_NIVEL.COD_NIVEL)
SET NOEXEC ON;
querydfeconstr:
SELECT DISTINCT(CAST(TDFE_ODBC_CONNECTION_STRING.CONNECTION_STRING AS VARCHAR(244))) AS CONNECTION_STRING, CAST(TDFE_ODBC_CONNECTION_STRING.ID_ODBC_CONNECTION_STRING AS VARCHAR(5)) AS ID_CONNECTION, CAST(TDFE_ODBC_ESTABELECIMENTO.COD_ESTABELECIMENTO AS VARCHAR(5)) AS COD_ESTAB,	CAST(TDFE_ODBC_ESTABELECIMENTO.COD_EMPRESA AS VARCHAR(5)) AS COD_EMPRESA FROM TDFE_ODBC_CONNECTION_STRING INNER JOIN TDFE_ODBC_ESTABELECIMENTO ON(TDFE_ODBC_CONNECTION_STRING.ID_ODBC_CONNECTION_STRING=TDFE_ODBC_ESTABELECIMENTO.ID_ODBC_CONNECTION_STRING) ORDER BY COD_EMPRESA, COD_ESTAB
SET NOEXEC ON;
querydfeodbc:
SELECT CAST(TDFE_ODBC.COD_EMPRESA AS VARCHAR(5)) AS COD_EMPRESA, CAST(TDFE_ODBC.COD_ODBC AS VARCHAR(30)) AS COD_ODBC, CAST(TDFE_ODBC.QUERY AS varchar(4020)) AS QUERY FROM TDFE_ODBC
SET NOEXEC ON;
queryaudaplicacao:
SELECT CAST(TAUD_PARAMETRO_APLICACAO.COD_PARAMETRO  AS VARCHAR(40)) AS COD_PARAMETRO, CAST(TAUD_PARAMETRO.DES_PARAMETRO AS VARCHAR(100)) AS DES_PARAMETRO, CAST(TAUD_PARAMETRO_APLICACAO.DES_VALOR AS VARCHAR(200)) AS DES_VALOR  FROM TAUD_PARAMETRO_APLICACAO INNER JOIN TAUD_PARAMETRO ON(TAUD_PARAMETRO_APLICACAO.COD_PARAMETRO=TAUD_PARAMETRO.COD_PARAMETRO)
SET NOEXEC ON;
queryaudestab:
SELECT CAST(TAUD_PARAMETRO_ESTABELECIMENTO.COD_EMPRESA  AS VARCHAR(10)) AS COD_EMPRESA, CAST(TAUD_PARAMETRO_ESTABELECIMENTO.COD_ESTABELECIMENTO  AS VARCHAR(10)) AS COD_ESTABELECIMENTO, CAST(TAUD_PARAMETRO_ESTABELECIMENTO.COD_PARAMETRO  AS VARCHAR(40)) AS COD_PARAMETRO, CAST(TAUD_PARAMETRO.DES_PARAMETRO AS VARCHAR(80)) AS DES_PARAMETRO, CAST(TAUD_PARAMETRO_ESTABELECIMENTO.DES_VALOR AS VARCHAR(40)) AS DES_VALOR FROM TAUD_PARAMETRO_ESTABELECIMENTO INNER JOIN TAUD_PARAMETRO ON(TAUD_PARAMETRO_ESTABELECIMENTO.COD_PARAMETRO=TAUD_PARAMETRO.COD_PARAMETRO)
SET NOEXEC ON;
msgaplicacao:
BEGIN  SELECT CAST(TDFE_GRUPO_DISTRIBUICAO.DESCRICAO AS VARCHAR(40)) AS DES_GRUPO_DIST,CAST(TDFE_GRUPO_DIST_EMAIL.EMAIL AS VARCHAR(100)) AS EMAIL_GRUPO_DIST FROM TDFE_GRUPO_DIST_EMAIL INNER JOIN TDFE_GRUPO_DISTRIBUICAO ON(TDFE_GRUPO_DISTRIBUICAO.ID=TDFE_GRUPO_DIST_EMAIL.ID_GRUPO_DISTRIBUICAO) ORDER BY DES_GRUPO_DIST,EMAIL_GRUPO_DIST;SELECT CAST(TDFE_GRUPO_DISTRIBUICAO.DESCRICAO AS VARCHAR(40)) AS DES_GRUPO_DIST,CAST(TDFE_GRUPO_DIST_USUARIO.COD_LOGIN AS VARCHAR(100)) AS LOGIN_DIST_USUAR FROM TDFE_GRUPO_DIST_USUARIO INNER JOIN TDFE_GRUPO_DISTRIBUICAO ON(TDFE_GRUPO_DISTRIBUICAO.ID=TDFE_GRUPO_DIST_USUARIO.ID_GRUPO_DISTRIBUICAO) ORDER BY DES_GRUPO_DIST, LOGIN_DIST_USUAR; SELECT CAST(TDFE_GRUPO_DISTRIBUICAO.DESCRICAO AS VARCHAR(40)) AS DES_GRUPO_DIST,CAST(TDFE_GRUPO_DISTRIBUICAO.FLG_ATIVO AS VARCHAR(3)) AS FLG_ATIVO,CAST(TDFE_GRUPO_DIST_MENSAGEM.ID_MENSAGEM AS VARCHAR(5)) AS COD_TIPO_MENSG,CAST(TDFE_MENSAGENS_EMAIL.TIPO_MENSAGEM AS VARCHAR(3)) AS COD_TIPO_MENSG,CAST(TDFE_MENSAGENS_EMAIL.TITULO_MENSAGEM AS VARCHAR(100)) AS TIT_MENSG_EMAIL,CAST(TDFE_MENSAGENS_EMAIL.MENSAGEM AS VARCHAR(350)) AS DES_MENSG_EMAIL FROM TDFE_GRUPO_DIST_MENSAGEM INNER JOIN TDFE_GRUPO_DISTRIBUICAO ON(TDFE_GRUPO_DIST_MENSAGEM.ID_GRUPO_DISTRIBUICAO=TDFE_GRUPO_DISTRIBUICAO.ID) LEFT JOIN TDFE_MENSAGENS_EMAIL ON(TDFE_MENSAGENS_EMAIL.ID_MENSAGEM=TDFE_GRUPO_DIST_MENSAGEM.ID_MENSAGEM) ORDER BY TDFE_GRUPO_DISTRIBUICAO.DESCRICAO, TDFE_MENSAGENS_EMAIL.TIPO_MENSAGEM, TDFE_GRUPO_DIST_MENSAGEM.ID_MENSAGEM; END;
SET NOEXEC ON;



