CLASS lhc_connection DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Connection
        RESULT result,
      CheckSemanticKey FOR VALIDATE ON SAVE
        IMPORTING keys FOR Connection~CheckSemanticKey,
      GetCities FOR DETERMINE ON SAVE
        IMPORTING keys FOR Connection~GetCities.
ENDCLASS.

CLASS lhc_connection IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD CheckSemanticKey.

    READ ENTITIES OF zr_saad_i_conn IN LOCAL MODE
    ENTITY connection FIELDS ( uuid carrid connid )
    WITH CORRESPONDING #( keys )
    RESULT DATA(connections).

    LOOP AT connections INTO DATA(connection).
      SELECT FROM zsaadaconn
      FIELDS uuid
      WHERE carrid = @connection-carrid AND connid = @connection-connid
      UNION
      SELECT FROM zsaadaconn
      FIELDS uuid
      WHERE carrid = @connection-carrid AND connid = @connection-connid
      INTO TABLE @DATA(check_result).

      IF check_result IS NOT INITIAL.
        DATA(message) = me->new_message( id = 'ZS4D400'
                                         number = '001'
                                         severity = ms-error
                                         v1 = connection-carrid
                                         v2 = connection-connid ).
        DATA reported_record LIKE LINE OF reported-connection.
        reported_record-%tky = connection-%tky.
        reported_record-%msg = message.
        reported_record-%element-carrid = if_abap_behv=>mk-on.
        reported_record-%element-connid = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-connection.


      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD GetCities.
    DATA: read_data TYPE TABLE FOR READ RESULT zr_saad_i_conn.

    READ ENTITIES OF zr_saad_i_conn IN LOCAL MODE
    ENTITY connection
    FIELDS ( cityfrom cityto )
    WITH CORRESPONDING #( keys )
    RESULT read_data.

    LOOP AT read_data INTO DATA(connection).
      SELECT SINGLE FROM /dmo/i_airport
      FIELDS city, countrycode
      WHERE airportid = @connection-AirportFrom
      INTO ( @connection-cityfrom, @connection-CountryFrom ).

      SELECT SINGLE FROM /dmo/i_airport
      FIELDS city, countrycode
      WHERE airportid = @connection-AirportTo
      INTO ( @connection-CityTo, @connection-CountryTo ).

      MODIFY read_data FROM connection.
    ENDLOOP.

    DATA update_data TYPE TABLE FOR UPDATE zr_saad_i_conn.
    update_data = CORRESPONDING #( read_data ).

  ENDMETHOD.

ENDCLASS.
