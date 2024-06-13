*"* use this source file for your ABAP unit test classes
CLASS ltcl_saad_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_success FOR TESTING RAISING cx_static_check,
      test_exception FOR TESTING.
ENDCLASS.


CLASS ltcl_saad_test IMPLEMENTATION.

  METHOD test_success.
*    cl_abap_unit_assert=>fail( 'Implement your first test here' ).

* Preparation: read an arbitrary carrier_id from DB
**********************************************************************
    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).

    IF sy-subrc IS NOT INITIAL.
      "No data in table /dmo/carrier, stop testing
      cl_abap_unit_assert=>fail( `Test requires at least one entry in DB table /DMO/Carrier` ).

    ENDIF.

    TRY.

        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).

      CATCH cx_abap_invalid_value.

        cl_abap_unit_assert=>fail( msg = `Inapropriate exception`
                             "level = if_abap_unit_constant=>severity-medium
                             "quit = if_abap_unit_constant=>quit-test
                             detail = `Method lcl_data=>get_carrier( ) raises an exception when it should not` ).

    ENDTRY.
  ENDMETHOD.

  METHOD test_exception.

* specify a carrier_id that (hopefully) does not exist in the DB
**********************************************************************
    CONSTANTS c_wrong_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.

* preparation: make sure the carrier does not existe on DB.
**********************************************************************
    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    WHERE carrier_id = 'XX'
    INTO @DATA(carrier_id).

    IF sy-subrc IS INITIAL.
      "Carrier exists in DB table /DMO/Carrier, stop testing
      cl_abap_unit_assert=>fail( msg = |Carrier { c_wrong_carrier_id } exists in /DMO/Carrier|
                                 level = if_abap_unit_constant=>severity-high
                                 quit = if_abap_unit_constant=>quit-test
                                 detail = `If DB table /dmo/carrier contains an entry` && |with carrier_id = '{ c_wrong_carrier_id }'| && `it is not possible to test exception` ).
    ENDIF.

    try.

        data(carrier) = lcl_data=>get_carrier( carrier_id ).

        cl_abap_unit_assert=>fail( msg = `No exception`
                                   detail = `Method lcl_data=>get_carrier( ) does not raise an exception whe it should do so` ).
      catch cx_abap_invalid_value.

    endtry.

  ENDMETHOD.

ENDCLASS.
