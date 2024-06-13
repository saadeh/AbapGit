CLASS zcl_saad_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA number1 type i.
  Data number2 type i.

  number1 = -8.
  number2 = 3.

  data result type p LENGTH 8 DECIMALS 2.
  result = number1 / number2.

  data(output) = | { number1 } / { number2 } = { result }|.

  out->write( output ).

  ENDMETHOD.
ENDCLASS.
