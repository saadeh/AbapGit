*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    " Functional Method
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:BEGIN OF st_airport,
            airportid TYPE /dmo/airport_id,
            name      TYPE /dmo/airport_name,
          END OF st_airport.


    TYPES:
      BEGIN OF st_details,
        DepartureAirport   TYPE /dmo/airport_from_id,
        DestinationAirport TYPE /dmo/airport_to_id,
        AirlineName        TYPE /dmo/carrier_name,
      END OF st_details.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
        WITH NON-UNIQUE KEY airportid.

    CLASS-DATA airports TYPE tt_airports.

    DATA details TYPE st_details.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.
    SELECT
    FROM /DMO/I_Airport
    FIELDS airportid, name
    INTO TABLE @airports.

  ENDMETHOD.

  METHOD get_output.

*    select from /dmo/connection

    details = VALUE #( DepartureAirport     = 'SFO'
                       DestinationAirport   = 'SIN'
                       AirlineName          = 'United Airlines' ).

    DATA(departure)   = airports[ airportID = details-departureairport ].
    DATA(destination)   = airports[ airportID = details-destinationairport   ].

    APPEND |Departure:   { airports[ airportID = details-departureairport ]-name   } | TO r_output.
    APPEND |Destination: { airports[ airportID = details-destinationairport ]-name } | TO r_output.


  ENDMETHOD.

ENDCLASS.
