
*To create more than one UUID, the class cl_uuid_factory can be used to create an object of the type
*cl_system_uuid which implements if_system_uuid. This object then can be used for both UUID creation and
*UUID conversion.
*Example for UUID creation with instance methods:
DATA: L_UUID_X16 TYPE SYSUUID_X16.
DATA: SYSTEM_UUID TYPE REF TO IF_SYSTEM_UUID.
DATA: OREF TYPE REF TO CX_UUID_ERROR.
SYSTEM_UUID = CL_UUID_FACTORY=>CREATE_SYSTEM_UUID( ).
TRY.
    L_UUID_X16 = SYSTEM_UUID->CREATE_UUID_X16( ). " create uuid_x16
  CATCH CX_UUID_ERROR INTO OREF. " catch error
    DATA: S1 TYPE STRING.
    S1 = OREF->GET_TEXT( ).
ENDTRY.

*Example for UUID conversion with instance methods:
DATA: L_UUID TYPE SYSUUID_C22 VALUE 'oucIZjgq4Tg62803kedwLG'.
*DATA: L_UUID_X16 TYPE SYSUUID_X16.
DATA: L_UUID_C32 TYPE SYSUUID_C32.
*DATA: SYSTEM_UUID TYPE REF TO IF_SYSTEM_UUID.
*DATA: OREF TYPE REF TO CX_UUID_ERROR.
SYSTEM_UUID = CL_UUID_FACTORY=>CREATE_SYSTEM_UUID( ).
TRY.
    SYSTEM_UUID->CONVERT_UUID_C22( EXPORTING UUID = L_UUID
    IMPORTING UUID_X16 = L_UUID_X16
    UUID_C32 = L_UUID_C32 ).
  CATCH CX_UUID_ERROR INTO OREF. " catch error
*    DATA: S1 TYPE STRING.
    S1 = OREF->GET_TEXT( ).
ENDTRY.
