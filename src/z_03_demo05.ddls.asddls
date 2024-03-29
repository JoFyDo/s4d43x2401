@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5: Aggregations'

define view entity Z_03_Demo05
  as select from sflight
{
  carrid,
  count(*)                                             as NumberOfFlights,
  count(distinct seatsmax)                             as NumberOfDifferentPlaneTypes,
  @Semantics.amount.currencyCode: 'Currency'
  sum(paymentsum)                                      as TotalRevenue,
  currency                                             as Currency,
  avg(price as abap.dec(16,2))                         as AveragePrice,
  min(seatsocc)                                        as MinimumOccupiedSeats,
  max(seatsocc)                                        as MaximumOccupiedSeats,
  sum(case when seatsocc = 0 then 1 else 0 end)        as NumberOfEmptyFlights,
  sum(case when seatsocc = seatsmax then 1 else 0 end) as NumberOfBookedFlights
}
where
  planetype = 'A380-800'
group by
  currency,
  carrid
having
  sum(paymentsum) > 5000000
