
select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_LIMITE, X.QUANTIDADE_VENDAS,
case
	when X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS > 0 then 'Inválida'
    else 'Válida'
end as STATUS_VENDA
from(
select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO,
SUM(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
MAX(TC.VOLUME_DE_COMPRA) as QUANTIDADE_LIMITE from notas_fiscais NF
inner join itens_notas_fiscais INF 
on INF.NUMERO = NF.NUMERO
inner join tabela_de_clientes TC 
on TC.CPF = NF.CPF
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')
) X













