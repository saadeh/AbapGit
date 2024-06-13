CLASS zcl_saad_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_saad_insert_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT zsaad_employee FROM @( VALUE #(
        employee_id = '000001'
        first_name = 'Joao'
        last_name  = 'Renato'
        some_field = 'ABC' ) ).


    SELECT FROM zsaad_employee
    FIELDS *
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
