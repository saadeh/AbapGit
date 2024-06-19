*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_generator DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA employee_table_only TYPE c LENGTH 1 value 1.
    CLASS-DATA with_relationships TYPE c LENGTH 1 value 2.
    CLASS-DATA with_extensions TYPE c LENGTH 1 value 3.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

class lcl_generator IMPLEMENTATION.
ENDCLASS.
