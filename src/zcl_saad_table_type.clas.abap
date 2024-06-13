CLASS zcl_saad_table_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_saad_table_type IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES tt_addresses
      TYPE SORTED TABLE
      OF zsaad_address
      WITH NON-UNIQUE KEY country_code postal_code.

    TYPES: BEGIN OF st_person_deep,
             first_name TYPE /dmo/first_name,
             last_name  TYPE /dmo/last_name,
             addresses  TYPE zsaad_taddress,
           END OF st_person_deep.


* Task 1
**********************************************************************
*    DATA addresses TYPE tt_addresses.
    DATA addresses TYPE zsaad_taddress.

    addresses =
      VALUE #(
              ( street           = 'Dietmar-Hopp-Allee 16'
                postal_code      = '69190'
                city             = 'Walldorf'
                country_code     = 'DE'
              )
              ( street       = '3999 West Chester Pike'
                postal_code  = '19073'
                city         = 'Newtown Square, PA'
                country_code = 'US'
              )
             ).



* Task 2
**********************************************************************
*  DATA person TYPE st_person_deep.
    DATA person TYPE zsaads_person_deep.

    person-first_name = 'Dictionary'.
    person-last_name = 'ABAP'.
    person-addresses = addresses.


* Task 3
**********************************************************************
* DATA persons TYPE tt_persons.
    DATA persons TYPE zsaadt_persons.

    persons =
       VALUE #(
          ( person )
          (
            first_name = 'CDS'
            last_name  = 'ABAP'
            addresses =
              VALUE #(
                ( street           = 'SAP-Allee 29'
                  postal_code      = '68789'
                  city             = 'St.Leon-Rot'
                  country_code     = 'DE'
                )
                ( street       = '35 rue d''Alsace'
                  postal_code  = '92300'
                  city         = 'Levallois-Perret'
                  country_code = 'FR'
                )
                ( street       = 'Bedfont Road'
                  postal_code  = 'TW14 8HD'
                  city         = 'Feltham'
                  country_code = 'GB'
                )
               )
              )
            ).



  ENDMETHOD.
ENDCLASS.
