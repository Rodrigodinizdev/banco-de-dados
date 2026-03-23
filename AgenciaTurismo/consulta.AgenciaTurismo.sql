SELECT * FROM Pais;

-- Hotéis com 5 estrelas
SELECT * FROM Hotel WHERE Estrela = 5;

-- Pacotes ordenados por preço
SELECT * FROM Pacote ORDER BY Preco DESC;

-- Clientes em ordem alfabética
SELECT * FROM Cliente ORDER BY Nome ASC;

SELECT  
        cl.Nome as NomeCliente,
        cl.CPF as CPFCliente,
        cl.Telefone as TelefoneCliente,
        pk.Nome as NomePacote,
        pk.Preco as PrecoPacote,
        rv.Quantidade as Quantidade,
        rv.ValorReserva as ValorReserva,
        sr.Nome as StatusReserva,
        FORMAT(rv.DataReserva, 'dd/MM/yyyy') as DataReserva
    FROM Reserva AS rv
        JOIN Cliente AS cl 
            ON cl.Id = rv.IdCliente
        JOIN Pacote AS pk 
            ON pk.Id = rv.IdPacote
        JOIN StatuReserva AS sr 
            ON sr.Id = rv.IdStatusReserva
        JOIN Agencia AS ag 
            ON ag.Id = rv.IdAgencia
    ORDER BY rv.DataReserva DESC;

-- =============================================
-- 2. PAGAMENTOS COMPLETOS
-- =============================================
SELECT
        cl.Nome as NomeCliente,
        pk.Nome as NomePacote,
        tp.Nome as TipoPagamento,
        sp.Nome as StatusPagamento,
        pg.ValorPago as ValorPago,
        FORMAT(pg.DataPagamento, 'dd/MM/yyyy') as DataPagamento
    FROM Pagamento AS pg
        JOIN Reserva AS rv
                ON rv.Id = pg.IdReserva
        JOIN Cliente AS cl
                ON cl.Id = rv.IdCliente
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
        JOIN TipoPagamento AS tp
                ON tp.Id = pg.IdTipoPagamento
        JOIN StatusPagamento AS sp
                ON sp.Id = pg.IdStatusPagamento
    ORDER BY pg.DataPagamento DESC;


-- =============================================
-- 3. HOTEIS COM PAIS E PACOTE
-- =============================================
SELECT
        ht.Nome as NomeHotel,
        ht.Estrela as Estrelas,
        ht.Cidade as Cidade,
        pa.Nome as NomePais,
        pk.Nome as NomePacote,
        pk.Preco as PrecoPacote,
        hp.QuantidadeDias as QuantidadeDias
    FROM Hotel AS ht
        JOIN Pais AS pa
                ON pa.Id = ht.IdPais
        JOIN HotelPacote AS hp
                ON hp.IdHotel = ht.Id
        JOIN Pacote AS pk
                ON pk.Id = hp.IdPacote
    ORDER BY ht.Estrela DESC;


-- =============================================
-- 4. RESERVAS CONFIRMADAS
-- =============================================
SELECT
        cl.Nome as NomeCliente,
        pk.Nome as NomePacote,
        rv.ValorReserva as ValorReserva,
        sr.Nome as StatusReserva,
        FORMAT(rv.DataReserva, 'dd/MM/yyyy') as DataReserva
    FROM Reserva AS rv
        JOIN Cliente AS cl
                ON cl.Id = rv.IdCliente
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
        JOIN StatuReserva AS sr
                ON sr.Id = rv.IdStatusReserva
    WHERE sr.Nome = 'Confirmada';


-- =============================================
-- 5. CLIENTES QUE VIAJARAM PARA A EUROPA
-- =============================================
SELECT DISTINCT
        cl.Nome as NomeCliente,
        cl.Email as EmailCliente,
        pa.Nome as NomePais
    FROM Reserva AS rv
        JOIN Cliente AS cl
                ON cl.Id = rv.IdCliente
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
        JOIN HotelPacote AS hp
                ON hp.IdPacote = pk.Id
        JOIN Hotel AS ht
                ON ht.Id = hp.IdHotel
        JOIN Pais AS pa
                ON pa.Id = ht.IdPais
    WHERE pa.Sigla IN ('PT','ES','FR','IT','DE','GB','NL','CH','GR','HR');


-- =============================================
-- 6. TOTAL ARRECADADO POR PACOTE
-- =============================================
SELECT
        pk.Nome as NomePacote,
        COUNT(rv.Id) as TotalReservas,
        SUM(rv.ValorReserva) as TotalArrecadado,
        AVG(rv.ValorReserva) as TicketMedio
    FROM Reserva AS rv
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
    GROUP BY pk.Nome
    ORDER BY TotalArrecadado DESC;


-- =============================================
-- 7. PACOTE MAIS VENDIDO
-- =============================================
SELECT TOP 3
        pk.Nome as NomePacote,
        COUNT(rv.Id) as TotalReservas
    FROM Reserva AS rv
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
    GROUP BY pk.Nome
    ORDER BY TotalReservas DESC;


-- =============================================
-- 8. FATURAMENTO POR TIPO DE PAGAMENTO
-- =============================================
SELECT
        tp.Nome as TipoPagamento,
        COUNT(pg.Id) as Quantidade,
        SUM(pg.ValorPago) as TotalPago
    FROM Pagamento AS pg
        JOIN TipoPagamento AS tp
                ON tp.Id = pg.IdTipoPagamento
    GROUP BY tp.Nome
    ORDER BY TotalPago DESC;


-- =============================================
-- 9. PAISES MAIS VISITADOS
-- =============================================
SELECT
        pa.Nome as NomePais,
        COUNT(rv.Id) as TotalReservas
    FROM Reserva AS rv
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
        JOIN HotelPacote AS hp
                ON hp.IdPacote = pk.Id
        JOIN Hotel AS ht
                ON ht.Id = hp.IdHotel
        JOIN Pais AS pa
                ON pa.Id = ht.IdPais
    GROUP BY pa.Nome
    ORDER BY TotalReservas DESC;


-- =============================================
-- 10. CLIENTES SEM RESERVA
-- =============================================
SELECT
        cl.Nome as NomeCliente,
        cl.Email as EmailCliente
    FROM Cliente AS cl
        LEFT JOIN Reserva AS rv
                ON rv.IdCliente = cl.Id
    WHERE rv.Id IS NULL;


-- =============================================
-- 11. RESERVAS COM PAGAMENTO PENDENTE
-- =============================================
SELECT
        cl.Nome as NomeCliente,
        pk.Nome as NomePacote,
        rv.ValorReserva as ValorReserva,
        sp.Nome as StatusPagamento
    FROM Reserva AS rv
        JOIN Cliente AS cl
                ON cl.Id = rv.IdCliente
        JOIN Pacote AS pk
                ON pk.Id = rv.IdPacote
        JOIN Pagamento AS pg
                ON pg.IdReserva = rv.Id
        JOIN StatusPagamento AS sp
                ON sp.Id = pg.IdStatusPagamento
    WHERE sp.Nome = 'Aguardando Pagamento';


-- =============================================
-- 12. TOP 5 CLIENTES QUE MAIS GASTARAM
-- =============================================
SELECT TOP 5
        cl.Nome as NomeCliente,
        COUNT(rv.Id) as TotalReservas,
        SUM(rv.ValorReserva) as TotalGasto
    FROM Reserva AS rv
        JOIN Cliente AS cl
                ON cl.Id = rv.IdCliente
    GROUP BY cl.Nome
    ORDER BY TotalGasto DESC;