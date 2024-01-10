@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Literals, Cases, Arithmetic Expression &Type Casts'

define view entity Z_03_Demo03
  as select from sbook
{
  /* Literals */
  'Hello World'                                                             as Text1,
  42                                                                        as Integer1,
  0.1                                                                       as FloatingPointNumber,
  /* Cases */
  cancelled,
  case cancelled
  when '' then 'Booked'
  when 'X' then 'Cancelled'
  else cancelled
  end                                                                       as CancelledText,
  class,
  luggweight,
  wunit,
  case when class = 'F' then ''
  when luggweight > 25 and wunit = 'KG' then 'X'
  else ''
  end                                                                       as ExessLuggage,
  /* Arithmetic Expressions */
  loccuram,
  loccurkey,
  forcuram,
  forcurkey,
  cast(loccuram as abap.dec( 16, 2 )) + cast(forcuram as abap.dec( 16, 2 )) as Add1,
  cast(loccuram as abap.dec( 16, 2 )) - cast(forcuram as abap.dec( 16, 2 )) as Subtract1,
  cast(loccuram as abap.dec( 16, 2 )) * cast(forcuram as abap.dec( 16, 2 )) as Multiply1,
  cast(loccuram as abap.fltp) / cast(forcuram as abap.fltp) as Divide1
}
