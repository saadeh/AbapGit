CLASS zcl_saad_check_and_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_saad_check_and_fill IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


types: t_version type c LENGTH 1.

* CONSTANTS c_version TYPE t_version VALUE lcl_generator=>employee_table_only.
* CONSTANTS c_version TYPE t_version VALUE lcl_generator=>with_relationships.
* CONSTANTS c_version TYPE t_version VALUE lcl_generator=>with_extensions.


  ENDMETHOD.
ENDCLASS.
