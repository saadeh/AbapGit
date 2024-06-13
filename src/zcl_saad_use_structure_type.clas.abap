CLASS zcl_saad_use_structure_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_saad_use_structure_type IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_person type zsaad_person.
    lv_person-country_code = 'US'.



  ENDMETHOD.
ENDCLASS.
