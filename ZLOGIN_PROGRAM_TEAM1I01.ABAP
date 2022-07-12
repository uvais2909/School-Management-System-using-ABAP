*&---------------------------------------------------------------------*
*&  Include           ZLOGIN_PROGRAM_TEAM1I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1530  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1530 INPUT.
  CASE sy-ucomm.
    WHEN 'PLOGIN'.
      DATA: wa_principal TYPE zprincipal_tb.

      CLEAR: wa_principal.
      SELECT principal_id principal_password FROM zprincipal_tb
        INTO CORRESPONDING FIELDS OF wa_principal
        WHERE principal_id = zprincipal_tb-principal_id AND
              principal_password = zprincipal_tb-principal_password.
      ENDSELECT.

      IF zprincipal_tb-principal_id IS NOT INITIAL.

        IF zprincipal_tb-principal_id = wa_principal-principal_id AND
           zprincipal_tb-principal_password = wa_principal-principal_password.

          MESSAGE: 'YOU HAVE SUCCESSFULLY LOGGED IN.' TYPE 'I'.
          CALL SCREEN '1533'.
        ELSE.
          MESSAGE: 'USERNAME OR PASSWORD IS INNCORRECT.' TYPE 'I'.

        ENDIF.

      ELSE.
        MESSAGE: 'PLEASE FILL THE FIELDS.' TYPE 'I'.
      ENDIF.

    WHEN 'INFO'.
      SUBMIT zpopup_team1 VIA SELECTION-SCREEN AND RETURN.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE PROGRAM.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1531  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1531 INPUT.

  CASE sy-ucomm.
    WHEN 'STU_LOGIN'.
      DATA: wa_student TYPE zstudent_tb.

      CLEAR: wa_student.

      SELECT student_id student_password FROM zstudent_tb
        INTO CORRESPONDING FIELDS OF wa_student
        WHERE student_id = zstudent_tb-student_id AND
              student_password = zstudent_tb-student_password.
      ENDSELECT.

      IF zstudent_tb-student_id IS NOT INITIAL.

        IF zstudent_tb-student_id = wa_student-student_id AND
         zstudent_tb-student_password = wa_student-student_password.
          MESSAGE: 'YOU HAVE SUCCESSFULLY LOGGED IN' TYPE 'I'.
          CALL SCREEN '1540'.
        ELSE.
          MESSAGE: 'PLEASE CHECK YOU USERNAME AND PASSWORD' TYPE 'I'.
        ENDIF.

      ELSE.
        MESSAGE: 'PLEASE FILL ALL THE FIELDS' TYPE 'I'.
      ENDIF.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'INFO'.
      SUBMIT zpopup_team1 VIA SELECTION-SCREEN AND RETURN.

    WHEN 'BACK'.
      LEAVE PROGRAM.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1532  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1532 INPUT.
  CASE sy-ucomm.
    WHEN 'TEA_LOGIN'.

      DATA: wa_teacher TYPE zteacher_tb.

      CLEAR: wa_teacher.

      SELECT teacher_id teacher_password FROM zteacher_tb
        INTO CORRESPONDING FIELDS OF wa_teacher
        WHERE teacher_id = zteacher_tb-teacher_id AND
              teacher_password = zteacher_tb-teacher_password.
      ENDSELECT.

      IF zteacher_tb-teacher_id IS NOT INITIAL.

        IF zteacher_tb-teacher_id = wa_teacher-teacher_id AND
         zteacher_tb-teacher_password = wa_teacher-teacher_password.
          MESSAGE: 'YOU HAVE LOGGED IN SUCCESSFULLY' TYPE 'I'.
          CALL SCREEN '1535'.
        ELSE.
          MESSAGE: 'USERNAME OR PASSWORD IS INCCORECT' TYPE 'I'.
        ENDIF.

      ELSE.
        MESSAGE: 'PLEASE FILL ALL THE FIELDS' TYPE 'I'.
      ENDIF.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE PROGRAM.

    WHEN 'INFO'.
      SUBMIT zpopup_team1 VIA SELECTION-SCREEN AND RETURN.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1533  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1533 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'LIB'.
      CALL TRANSACTION 'ZGROUP_5'.
    WHEN 'STF'.
      CALL SCREEN '1555'.
    WHEN 'NOT'.
      CALL SCREEN '1534'.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1534  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1534 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'SUBMIT'.
      DATA: wa_notice TYPE znotice_tb.

      CLEAR: wa_notice.

      wa_notice-not_date = znotice_tb-not_date.
      wa_notice-content = znotice_tb-content.

      INSERT znotice_tb FROM wa_notice.

      IF sy-subrc = 0.
        MESSAGE: 'NOTICE UPLOAD SUCCESSFULLY CLICK ON PRINT BUTTON TO PRINT' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE'I'.
      ENDIF.

    WHEN 'PRINT'.
      PERFORM sf.
    WHEN 'CHECK'.

      CLEAR: wa_notice.
      SELECT * FROM znotice_tb
        INTO CORRESPONDING FIELDS OF wa_notice
        WHERE not_date = znotice_tb-not_date.
      ENDSELECT.
      znotice_tb-content = wa_notice-content.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1555  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1555 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'CREATE1'.

      wa_teacher-teacher_id       = zteacher_tb-teacher_id.
      wa_teacher-teacher_password = zteacher_tb-teacher_password.
      wa_teacher-teac_first_name  = zteacher_tb-teac_first_name.
      wa_teacher-teac_last_name   = zteacher_tb-teac_last_name.
      wa_teacher-teacher_of_class = zteacher_tb-teacher_of_class.
      wa_teacher-teacher_mb_no    = zteacher_tb-teacher_mb_no.
      wa_teacher-teac_address     = zteacher_tb-teac_address.

      INSERT zteacher_tb FROM wa_teacher.


      IF sy-subrc = 0.
        MESSAGE: 'RECORD CREATED SUCCESSFULLY' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE 'I'.
      ENDIF.



    WHEN 'UPDATE1'.
      wa_teacher-teacher_id       = zteacher_tb-teacher_id.
      wa_teacher-teacher_password = zteacher_tb-teacher_password.
      wa_teacher-teac_first_name  = zteacher_tb-teac_first_name.
      wa_teacher-teac_last_name   = zteacher_tb-teac_last_name.
      wa_teacher-teacher_of_class = zteacher_tb-teacher_of_class.
      wa_teacher-teacher_mb_no    = zteacher_tb-teacher_mb_no.
      wa_teacher-teac_address     = zteacher_tb-teac_address.

      UPDATE zteacher_tb FROM wa_teacher.

      IF sy-subrc = 0.
        MESSAGE: 'RECORD UPDATED SUCCESSFULLY' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'DISPLAY1'.

      CLEAR : wa_teacher.

      SELECT teacher_id teacher_password teac_first_name teac_last_name teacher_of_class teacher_mb_no teac_address
        FROM zteacher_tb
        INTO CORRESPONDING FIELDS OF wa_teacher
        WHERE teacher_id = zteacher_tb-teacher_id.
      ENDSELECT.

      zteacher_tb-teacher_id = wa_teacher-teacher_id.
      zteacher_tb-teacher_password = wa_teacher-teacher_password.
      zteacher_tb-teac_first_name = wa_teacher-teac_first_name.
      zteacher_tb-teac_last_name = wa_teacher-teac_last_name.
      zteacher_tb-teacher_of_class = wa_teacher-teacher_of_class.
      zteacher_tb-teacher_mb_no = wa_teacher-teacher_mb_no.
      zteacher_tb-teac_address = wa_teacher-teac_address.


    WHEN 'CLEAR1'.
      CLEAR: zteacher_tb-teacher_id,
             zteacher_tb-teacher_password,
             zteacher_tb-teac_first_name,
             zteacher_tb-teac_last_name,
             zteacher_tb-teacher_of_class,
             zteacher_tb-teacher_mb_no,
             zteacher_tb-teac_address.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1535  INPUT
*&---------------------------------------------------------------------*
*       text  || TEACHER DASHBOARD
*----------------------------------------------------------------------*
MODULE user_command_1535 INPUT.
  CASE sy-ucomm.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'LIB'.
      CALL TRANSACTION 'ZGROUP_5'.

    WHEN 'RESULT'.
      CALL SCREEN '1537'.

    WHEN 'TIMETABLE'.
      CALL SCREEN '1536'.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1540  INPUT
*&---------------------------------------------------------------------*
*       text ||STUDENT DASHBOARD
*----------------------------------------------------------------------*
MODULE user_command_1540 INPUT.
  CASE sy-ucomm.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'LIB'.
      CALL TRANSACTION 'ZGROUP_5'.

    WHEN 'S_NOTICEBOARD'.
      CALL SCREEN 1539.
    WHEN 'S_TIMETABLE'.
      CALL SCREEN 1541.
    WHEN 'S_RESULTS'.
      CALL SCREEN 1538.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1536  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1536 INPUT.
  CASE sy-ucomm.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'CREATE_TIMETABLE'.
      DATA: wa_time TYPE ztimetable_tb.

      wa_time-class          = ztimetable_tb-class.
      wa_time-period_time    = ztimetable_tb-period_time.
      wa_time-first_period   = ztimetable_tb-first_period.
      wa_time-second_period  = ztimetable_tb-second_period.
      wa_time-third_period   = ztimetable_tb-third_period.
      wa_time-fourth_period  = ztimetable_tb-fourth_period.
      wa_time-fifth_period   = ztimetable_tb-fifth_period.
      wa_time-sixth_period   = ztimetable_tb-sixth_period.
      wa_time-seventh_period = ztimetable_tb-seventh_period.
      wa_time-eighth_period  = ztimetable_tb-eighth_period.


      INSERT ztimetable_tb FROM wa_time.
      CLEAR wa_time.

      IF sy-subrc = 0.
        MESSAGE: 'TIMETABLE CREATED SUCCESSFULLY' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'PRINT_TIMETABLE'.
      PERFORM sf_timetable.

    WHEN 'DISPLAY_TIMETABLE'.

      SELECT * FROM ztimetable_tb INTO CORRESPONDING FIELDS OF wa_time
        WHERE class = ztimetable_tb-class.
      ENDSELECT.


        ztimetable_tb-class =  wa_time-class.
        ztimetable_tb-period_time =  wa_time-period_time.
        ztimetable_tb-first_period =  wa_time-first_period.
        ztimetable_tb-second_period =  wa_time-second_period.
        ztimetable_tb-third_period =  wa_time-third_period.
        ztimetable_tb-fourth_period =  wa_time-fourth_period.
        ztimetable_tb-fifth_period =  wa_time-fifth_period.
        ztimetable_tb-sixth_period =  wa_time-sixth_period.
        ztimetable_tb-seventh_period =  wa_time-seventh_period.
        ztimetable_tb-eighth_period =  wa_time-eighth_period.
        CLEAR wa_time.

      WHEN 'BACK'.
        LEAVE PROGRAM.
    ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1537  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1537 INPUT.
  CASE sy-ucomm.

    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE PROGRAM.

    WHEN 'T_SUBMIT'.
      DATA: wa_result TYPE zresult_tb.

      CLEAR: wa_result.

      wa_result-stu_roll_no = zresult_tb-stu_roll_no.
      wa_result-stu_fir_name = zresult_tb-stu_fir_name.
      wa_result-stu_last_name = zresult_tb-stu_last_name.
      wa_result-hindi = zresult_tb-hindi.
      wa_result-english = zresult_tb-english.
      wa_result-maths = zresult_tb-maths.
      wa_result-science = zresult_tb-science.
      wa_result-socail_science = zresult_tb-socail_science.
      wa_result-computer_science = zresult_tb-computer_science.
      wa_result-overall = zresult_tb-overall.

      INSERT zresult_tb FROM wa_result.

      IF sy-subrc = 0.
        MESSAGE: 'RECORD SUBMITTED SUCCESSFULLY' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'T_UPDATE'.
      CLEAR: wa_result.

      wa_result-stu_roll_no      = zresult_tb-stu_roll_no.
      wa_result-stu_fir_name     = zresult_tb-stu_fir_name.
      wa_result-stu_last_name    = zresult_tb-stu_last_name.
      wa_result-hindi            = zresult_tb-hindi.
      wa_result-english          = zresult_tb-english.
      wa_result-maths            = zresult_tb-maths.
      wa_result-science          = zresult_tb-science.
      wa_result-socail_science   = zresult_tb-socail_science.
      wa_result-computer_science = zresult_tb-computer_science.
      wa_result-overall          = zresult_tb-overall.

      UPDATE zresult_tb FROM wa_result.

      IF sy-subrc = 0.
        MESSAGE: 'RECORD UPDATED SUCCESSFULLY' TYPE 'I'.
      ELSE.
        MESSAGE: 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'T_DISPLAY'.
      CLEAR : wa_result.
      SELECT stu_roll_no stu_fir_name stu_last_name hindi english maths science socail_science computer_science overall
      FROM zresult_tb
        INTO CORRESPONDING FIELDS OF wa_result
    WHERE stu_roll_no = zresult_tb-stu_roll_no.
      ENDSELECT.



      zresult_tb-stu_roll_no    =  wa_result-stu_roll_no.
      zresult_tb-stu_fir_name   =  wa_result-stu_fir_name.
      zresult_tb-stu_last_name  =   wa_result-stu_last_name .
      zresult_tb-hindi          = wa_result-hindi .
      zresult_tb-english        = wa_result-english.
      zresult_tb-maths          = wa_result-maths .
      zresult_tb-science        = wa_result-science .
      zresult_tb-socail_science = wa_result-socail_science.
      zresult_tb-computer_science =    wa_result-computer_science.
      zresult_tb-overall          =   wa_result-overall.


    WHEN 'T_EXIT'.
      LEAVE TO SCREEN 0.



    WHEN 'T_PRINT'.
      PERFORM sf_result.

    WHEN 'T_CLEAR'.
      CLEAR: zresult_tb-stu_roll_no,
             zresult_tb-stu_fir_name,
             zresult_tb-stu_last_name,
             zresult_tb-hindi,
             zresult_tb-english,
             zresult_tb-maths,
             zresult_tb-science,
             zresult_tb-socail_science,
             zresult_tb-computer_science,
             zresult_tb-overall.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1538  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1538 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'R_PRINT'.
      PERFORM sf_result.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1539  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1539 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'S_PRINT'.
      PERFORM sf.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1556  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1556 INPUT.
  CASE sy-ucomm.
    WHEN 'REFRESH'.
      PERFORM refresh_alv.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1541  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1541 INPUT.
  CASE SY-UCOMM.
    WHEN 'TT_PRINT'.
      PERFORM sf_timetable.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
