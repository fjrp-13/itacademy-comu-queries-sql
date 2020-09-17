-- #1
SELECT count(*) AS Total
FROM usairlineflights2.flights;

-- #2
SELECT Origin, avg(ArrDelay) AS prom_arribades, avg(DepDelay) AS prom_sortides
FROM usairlineflights2.flights
GROUP BY Origin
ORDER BY Origin;

-- #3
SELECT Origin, colYear, colMonth, avg(ArrDelay) AS prom_arribades
FROM usairlineflights2.flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, colMonth;

-- #4
SELECT usairports.City, colYear, colMonth, avg(ArrDelay) AS prom_arribades
FROM usairlineflights2.flights
JOIN usairlineflights2.usairports ON usairports.IATA = flights.Origin
GROUP BY City, colYear, colMonth
ORDER BY City, colYear, colMonth;

-- #5
SELECT UniqueCarrier, colYear, colMonth, count(1) AS total_cancelled
FROM usairlineflights2.flights
WHERE Cancelled = 1
GROUP BY UniqueCarrier, colYear, colMonth
ORDER BY total_cancelled DESC, UniqueCarrier, colYear, colMonth;

-- #6
SELECT TailNum, sum(Distance) as totalDistance
FROM usairlineflights2.flights
WHERE TailNum <> ''
GROUP BY TailNum
ORDER BY totalDistance DESC, TailNum
LIMIT 10;

-- #7
SELECT UniqueCarrier, avg(ArrDelay) as avgDelay
FROM usairlineflights2.flights
GROUP BY UniqueCarrier
HAVING avgDelay > 10
ORDER BY avgDelay DESC, UniqueCarrier;