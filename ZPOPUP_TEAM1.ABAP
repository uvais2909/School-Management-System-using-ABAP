*&---------------------------------------------------------------------*
*& Report ZPOPUP_TEAM1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPOPUP_TEAM1.

TABLES sscrfields.

SELECTION-SCREEN:
  BEGIN OF SCREEN 500 AS WINDOW TITLE title,
    PUSHBUTTON 2(15)  TEXT-bt1 USER-COMMAND OK1,
    PUSHBUTTON 17(15) TEXT-bt2 USER-COMMAND OK2,
  END OF SCREEN 500.

AT SELECTION-SCREEN.
  CASE sscrfields.
    WHEN 'OK1'.
      CALL TRANSACTION 'ZSTU_TC'.
    WHEN 'OK2'.
      CALL TRANSACTION 'ZTEACHER_TC'.
  ENDCASE.

START-OF-SELECTION.
  title  = 'SELECT LOGIN MODE'.


  CALL SELECTION-SCREEN '0500' STARTING AT 10 10.
