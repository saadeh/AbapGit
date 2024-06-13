CLASS zcl_saad_profiling_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_PROFILING_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    Data(flights) = lcl_data=>get_flights(  ).

    sort flights by flight_date DESCENDING.

    out->write( name = `List of all Flights`
                data = flights ).

  ENDMETHOD.
ENDCLASS.
