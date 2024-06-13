*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.


    CLASS-DATA conn_counter TYPE i.

    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id OPTIONAL
      RAISING
        cx_abap_invalid_value.
    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.
    " Functional Method
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.
    DATA carrier_name TYPE /dmo/carrier_name.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.

    IF i_carrier_id IS INITIAL AND i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

*    SELECT SINGLE airport_from_id, airport_to_id
*        FROM /dmo/connection
*        WHERE carrier_id = @i_carrier_id
*          AND connection_id = @i_connection_id
*          INTO ( @airport_from_id, @airport_to_id ).

    SELECT SINGLE
        FROM /dmo/i_connection
        FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
        WHERE AirlineID = @i_carrier_id
          AND ConnectionID = @i_connection_id
         INTO ( @airport_from_id,@airport_to_id,@carrier_name ).

    conn_counter = conn_counter + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_carrier_id    = carrier_id.
    e_connection_id = connection_id.

  ENDMETHOD.

  METHOD set_attributes.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.

      RAISE EXCEPTION TYPE cx_abap_invalid_value.

    ENDIF.

    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.

*    SELECT SINGLE airport_from_id, airport_to_id
*    FROM /dmo/connection
*    WHERE carrier_id = @i_carrier_id
*      AND connection_id = @i_connection_id
*      INTO ( @airport_from_id, @airport_to_id ).

    SELECT SINGLE
        FROM /dmo/i_connection
        FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
        WHERE AirlineID = @i_carrier_id
          AND ConnectionID = @i_connection_id
         INTO ( @airport_from_id,@airport_to_id,@carrier_name ).

  ENDMETHOD.

  METHOD get_output.

    APPEND |--------------------------------| TO r_output.
    APPEND |Carrier:     { carrier_id } { carrier_name } | TO r_output.
    APPEND |Connection:  { connection_id }  | TO r_output.
    APPEND |Airport from:{ airport_from_id }| TO r_output.
    APPEND |Airport to:  { airport_to_id }  | TO r_output.


  ENDMETHOD.

ENDCLASS.
