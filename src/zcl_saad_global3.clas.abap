CLASS zcl_saad_global3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_GLOBAL3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connection  TYPE REF TO lcl_connection.
    DATA connections  TYPE TABLE OF REF TO lcl_connection.

* Create Instance
**********************************************************************

    connection = NEW #(  ).

    connection->set_attributes(
      EXPORTING
        i_carrier_id    = 'LH'
        i_connection_id = '0400'
    ).

    APPEND connection TO connections.

* Calling Functional Method
**********************************************************************
    " in a value assignment (with inline declaration for result)
    DATA(result) = connection->get_output( ).

    out->write( data = connection->get_output( )
                name = 'teste impressao result  ' ).

    " in logical expression
    IF connection->get_output(  ) IS NOT INITIAL.

      " as operand in a statement
      LOOP AT connection->get_output(  ) INTO DATA(line).
        out->write( |Line: { sy-tabix WIDTH = 10 ALIGN = RIGHT } Content: { line WIDTH = 40 ALIGN = RIGHT } | ).
      ENDLOOP.
      out->write( ' ' ).
      "  to supply input parameter of another method
      out->write( data = connection->get_output( )
                  name = 'teste impressao string table  ' ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
