CLASS zcl_saad_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_GLOBAL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_connection TYPE REF TO lcl_connection.
    DATA lt_connections TYPE TABLE OF REF TO lcl_connection.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    TRY.
* First Instance
*************************************************************************
        ls_connection = NEW #(  ).

        ls_connection->set_attributes(
                        EXPORTING
                        i_carrier_id = 'LH'
                        i_connection_id = '0400'
                         ).

        APPEND ls_connection TO lt_connections.

* Second Instance
*************************************************************************
        ls_connection = NEW #( i_carrier_id = 'AA' i_connection_id = '0017' ).

        ls_connection->set_attributes(
                        EXPORTING
                        i_carrier_id = 'AA'
                        i_connection_id = '0017'
                         ).

        APPEND ls_connection TO lt_connections.

* Third Instance
*************************************************************************
        ls_connection = NEW #( i_carrier_id = 'SQ' i_connection_id = '0001'  ).

        ls_connection->set_attributes(
                        EXPORTING
                        i_carrier_id = 'SQ'
                        i_connection_id = '0001'
                         ).

        APPEND ls_connection TO lt_connections.

* Loop Get Parameters
**********************************************************************
        LOOP AT lt_connections INTO ls_connection.

          ls_connection->get_attributes(
          IMPORTING
            e_carrier_id    = carrier_id
            e_connection_id = connection_id
            ).

          out->write( |Flight Connection { carrier_id } { connection_id }| ).

        ENDLOOP.

      CATCH cx_abap_invalid_value.
        out->write( 'Valor invalido para metodo set_attribute' ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
