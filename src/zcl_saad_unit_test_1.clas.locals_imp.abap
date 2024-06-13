*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_data DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS get_carrier IMPORTING i_carrier_id     TYPE /dmo/carrier_id
                              RETURNING VALUE(s_carrier) TYPE /dmo/carrier
                              RAISING
                                cx_abap_invalid_value.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD get_carrier.

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS *
    WHERE carrier_id = @i_carrier_id
    INTO @s_carrier.

    IF sy-subrc IS NOT INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
