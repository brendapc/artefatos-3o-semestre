1. nome das cidades do RS

Select cid.nome from arruda.cidades cid where cid.uf = 'RS' order by cid.nome

cid é um apelido para a tabela arruda.cidades

2.

select from
    inner join arruda.cliente cli 
    inner join arruda.pessoas_fisicas pf on pf.cod_cliente = cli.cod_cliente
    inner join arruda.enderecos ender on ender.cod_cliente = cli.cod_cliente
    inner join arruda.cidades cid on  cid.cod_cidade = ender.cod_cidade
where 
    cid.uf = 'RS'
order by
    pf.data_nascimento desc,
    cli.nome
;

3. nome dos clientes, nome dos produtos e nome da categorias para todos os produtos pedidos por clientes do sexo feminino do ano de 2019 (data emissão do pedido) ordenando pelo nome do cliente

select from  
	arruda.clientes cli 
	inner join arruda.pessoas_fisicas pf on pf.cod_cliente = cli.cod.cliente  (clientes que são pessoas fisicas)
	inner join arruda.pedidos ped itens on ped.cod_cliente = cli.cod_cliente
	inner join arruda.itens_pedido itped  on itped.num_pedido = ped.num_pedido
	inner join arruda.produtos prod on prod.cod_produto = itped.cod_produto
	inner join arruda.categorias cat on cat.cod_categoria = prod.cod_categoria
where
    pf.genero = 'F'
    and extract(year from ped.data_emissao) = 2019
order by cli.nome;

/* and ped.data_emissao between to_date('01/01/2019', '31/12/2019') and  to_date('01/01/2019', '31/12/2019') */

4.

select 
    cli.nome 
    trunc(months_between(sysdate, pf.data_nascimento)/12,0),
    count(ped.num_pedido)
from 
    arruda.clientes cli
    inner join arruda.pessoas_fisicas pf on ped.cod_cliente = cli.cod_cliente
    left outer join arruda.pedidos ped on ped.cod_cliente = cli.cod_cliente
group by    
    cli.nome
    pf.data_nascimento
order by
 3 desc;