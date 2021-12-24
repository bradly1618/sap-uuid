*Examples
*In the case that a single UUID needs to be created or converted the aliases which are defined in the class
*cl_system_uuid can be used.
*Example for static UUID creation in format binary (16 bytes):
DATA: L_UUID_X16 TYPE SYSUUID_X16.
DATA: OREF TYPE REF TO CX_UUID_ERROR.
TRY.
    L_UUID_X16 = CL_SYSTEM_UUID=>CREATE_UUID_X16_STATIC( ). " create uuid_x16
  CATCH CX_UUID_ERROR INTO OREF. " catch error
    DATA: S1 TYPE STRING.
    S1 = OREF->GET_TEXT( ).
ENDTRY.
*Example for static UUID conversion:
DATA: L_UUID TYPE SYSUUID_C22 VALUE 'oucIZjgq4Tg62803kedwLG'.
DATA: L_UUID_X16 TYPE SYSUUID_X16.
DATA: L_UUID_C32 TYPE SYSUUID_C32.
DATA: OREF TYPE REF TO CX_UUID_ERROR.
TRY.
    CL_SYSTEM_UUID=>CONVERT_UUID_C22_STATIC( EXPORTING UUID = L_UUID
    IMPORTING UUID_X16 = L_UUID_X16
    UUID_C32 = L_UUID_C32 ).
  CATCH CX_UUID_ERROR INTO OREF. " catch error
    DATA: S1 TYPE STRING.
    S1 = OREF->GET_TEXT( ).
ENDTRY.
