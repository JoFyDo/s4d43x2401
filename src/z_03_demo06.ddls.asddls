@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 6: Nested Views'

define view entity Z_03_Demo06
  as select from Z_03_Demo05
{
  count(*) as NumberOfCarriersWithMoreThan4MRevenxue
}
