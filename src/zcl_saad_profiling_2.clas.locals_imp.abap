*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_data DEFINITION.
  PUBLIC SECTION.
    TYPES tt_connections TYPE STANDARD TABLE OF /dmo/connection WITH NON-UNIQUE KEY carrier_id connection_id.


    CLASS-METHODS get_connections RETURNING VALUE(lt_connections) TYPE tt_connections.
    CLASS-METHODS get_airport_city IMPORTING lv_airport     TYPE /dmo/airport_id
                                   RETURNING VALUE(lv_city) TYPE /dmo/city.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD get_airport_city.

    SELECT SINGLE FROM /dmo/airport
    FIELDS city
    WHERE airport_id = @lv_airport
    INTO @lv_city.

  ENDMETHOD.

  METHOD get_connections.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @lt_connections.

  ENDMETHOD.


ENDCLASS.
