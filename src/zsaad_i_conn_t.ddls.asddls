@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS REFENCE ZSAADI_CONNECTION_R'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSAAD_I_CONN_T as select from ZSAADI_CONNECTION_R
//{
//    key AirlineID,
//    key ConnectionID,
//    DepartureAirport,
//    DestinationAirport,
//    DepartureTime,
//    ArrivalTime,
//    Distance,
//    DistanceUnit,
//    /* Associations */
//    _Airline,
//    _Flight
//}

{
    key AirlineID,
    key ConnectionID,

//        _Airline._Currency._Text.CurrencyName

//        _Airline._Currency._Text[ Language = 'E' ].CurrencyName

        _Airline._Currency._Text[ 1: Language = 'E' ].CurrencyName
  }
where
      AirlineID    = 'AA'
  and ConnectionID = '0017'
