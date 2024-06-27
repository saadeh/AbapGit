@AbapCatalog.sqlViewName: 'ZSAAD_ICONN_R'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS REFENCE ZSAADI_CONNECTION_R'
define view ZSAAD_I_CONN_R as select from ZSAADI_CONNECTION_R
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

// _Airline.CurrencyCode,
// _Flight.PlaneType,

DepartureAirport,
DestinationAirport

}
where
AirlineID = 'LH'          // Only one connection
and ConnectionID = '0400' // fulfills this filter


// and _Airline.CurrencyCode = 'EUR'
// and _Flight.PlaneType = '747-400'

