CLASS zcl_saad_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_ITERATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS max_count TYPE i VALUE 20.

    DATA: numbers TYPE TABLE OF i,
          output  TYPE TABLE OF string.


    DO max_count TIMES.

      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.
        WHEN OTHERS.
          APPEND  numbers[ sy-index - 1 ] + numbers[ sy-index - 2 ] TO numbers.
      ENDCASE.


    ENDDO.

    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).
      counter = counter + 1.
      APPEND |indice: { counter width = 14 align = left } ; conteudo: { number width = 10 align = right }| TO output.
    ENDLOOP.

    out->write(
    data = output
    name = |The first { max_count } Fibonacci Numbers|
    ).


  ENDMETHOD.
ENDCLASS.
