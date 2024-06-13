CLASS zcl_saad_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAAD_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA update_tab TYPE TABLE FOR UPDATE /DMO/R_Agencytp.
    update_tab = VALUE #( ( agencyID = '070004' Name = 'Pink Panther Returns' ) ).

    MODIFY ENTITIES OF /DMO/R_AgencyTP
    ENTITY /DMO/Agency
    UPDATE FIELDS ( name )
    WITH update_tab.

    COMMIT ENTITIES.

    IF sy-subrc IS INITIAL.
      out->write( |Agencia atualizado com sucesso.| ).
    ELSE.
      out->write( 'Agencia não atualizado.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
