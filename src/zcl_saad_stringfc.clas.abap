CLASS zcl_saad_stringfc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_STRINGFC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    DATA text   TYPE string VALUE `  Let's talk about ABAP  `.
*    DATA result TYPE i.
*
*    out->write(  text ).

*    result = find( val = text sub = 'A' ).
*
*    result = find( val = text sub = 'A' case = abap_false ).
*
*    result = find( val = text sub = 'A' case = abap_false occ =  -1 ).
*    result = find( val = text sub = 'A' case = abap_false occ =  -2 ).
*    result = find( val = text sub = 'A' case = abap_false occ =   2 ).
*
*    result = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 ).
*    result = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 len = 4 ).
*
*    out->write( |RESULT = { result } | ).



* DATA result TYPE i.
*
*    DATA text    TYPE string VALUE `  ABAP  `.
*    DATA substring TYPE string VALUE `AB`.
*    DATA offset    TYPE i      VALUE 1.
*
** Call different description functions
*******************************************************************************
**    result = strlen(     string ).
**    result = numofchar(  string ).
*
**    result = count(             val = text sub = substring off = offset ).
**    result = find(             val = text sub = substring off = offset ).
*
**    result = count_any_of(     val = text sub = substring off = offset ).
**    result = find_any_of(      val = text sub = substring off = offset ).
*
**    result = count_any_not_of( val = text sub = substring off = offset ).
*    result = find_any_not_of(  val = text sub = substring off = offset ).
*
*    out->write( |Text      = `{ text }`| ).
*    out->write( |Substring = `{ substring }` | ).
*    out->write( |Offset    = { offset } | ).
*    out->write( |Result    = { result } | ).


DATA text TYPE string      VALUE ` SAP BTP,   ABAP Environment  `.

* Change Case of characters
**********************************************************************
    out->write( |TO_UPPER         = {   to_upper(  text ) } | ).
    out->write( |TO_LOWER         = {   to_lower(  text ) } | ).
    out->write( |TO_MIXED         = {   to_mixed(  text ) } | ).
    out->write( |FROM_MIXED       = { from_mixed(  text ) } | ).


* Change order of characters
**********************************************************************
    out->write( |REVERSE             = {  reverse( text ) } | ).
    out->write( |SHIFT_LEFT  (places)= {  shift_left(  val = text places   = 3  ) } | ).
    out->write( |SHIFT_RIGHT (places)= {  shift_right( val = text places   = 3  ) } | ).
    out->write( |SHIFT_LEFT  (circ)  = {  shift_left(  val = text circular = 3  ) } | ).
    out->write( |SHIFT_RIGHT (circ)  = {  shift_right( val = text circular = 3  ) } | ).


* Extract a Substring
**********************************************************************
    out->write( |SUBSTRING       = {  substring(        val = text off = 4 len = 10 ) } | ).
    out->write( |SUBSTRING_FROM  = {  substring_from(   val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_AFTER = {  substring_after(  val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_TO    = {  substring_to(     val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_BEFORE= {  substring_before( val = text sub = 'ABAP'     ) } | ).


* Condense, REPEAT and Segment
**********************************************************************
    out->write( |CONDENSE         = {   condense( val = text ) } | ).
    out->write( |REPEAT           = {   repeat(   val = text occ = 2 ) } | ).

    out->write( |SEGMENT1         = {   segment(  val = text sep = ',' index = 1 ) } |  ).
    out->write( |SEGMENT2         = {   segment(  val = text sep = ',' index = 2 ) } |  ).




  ENDMETHOD.
ENDCLASS.
