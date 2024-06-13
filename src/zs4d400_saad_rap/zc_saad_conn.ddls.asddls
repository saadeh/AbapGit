@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_SAAD_I_CONN'
define root view entity ZC_SAAD_CONN
  provider contract transactional_query
  as projection on ZR_SAAD_I_CONN
{
  key UUID,
  CarrID,
  ConnID,
  AirportFrom,
  CityFrom,
  CountryFrom,
  AirportTo,
  CityTo,
  CountryTo,
  LocalLastChangedAt
  
}
