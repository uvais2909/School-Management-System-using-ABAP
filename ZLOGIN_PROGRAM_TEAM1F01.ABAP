FORM image.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'LOGO',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'SCH'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMG1
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM img1.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'IMG1',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'LIBLOGO'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMG2
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM img2.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'IMG2',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'RSDSTAFF_HEADER'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMG3
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM img3.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'IMG3',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'OBS_INFO'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.


************************************************************************
*                                                                      *
*                                                                      *
************************************************************************
FORM sf.
  DATA: it_notice TYPE znotice_tt,
        wa_notice TYPE znotice_str.

  DATA: zfnam TYPE rs38l_fnam.

  SELECT not_date content FROM znotice_tb
    INTO TABLE it_notice
    WHERE not_date = znotice_tb-not_date.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname = 'ZSF_NOTICE_BOARD_TEAM1'
*     VARIANT  = ' '
*     DIRECT_CALL              = ' '
    IMPORTING
      fm_name  = zfnam
*   EXCEPTIONS
*     NO_FORM  = 1
*     NO_FUNCTION_MODULE       = 2
*     OTHERS   = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  CALL FUNCTION zfnam "'/1BCDWB/SF00004782'
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
    TABLES
      itab = it_notice
* EXCEPTIONS
*     FORMATTING_ERROR           = 1
*     INTERNAL_ERROR             = 2
*     SEND_ERROR                 = 3
*     USER_CANCELED              = 4
*     OTHERS                     = 5
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.

************************************************************************
*                                                                      *
*                                                                      *
************************************************************************
FORM sf_timetable.
  DATA: it_time TYPE ztt_tmtab_pro_team1,
        wa_time TYPE zstr_tmtab_pro_team1.

  DATA: zfnam1 TYPE rs38l_fnam.

 SELECT CLASS
        PERIOD_TIME
        FIRST_PERIOD
        SECOND_PERIOD
        THIRD_PERIOD
        FOURTH_PERIOD
        FIFTH_PERIOD
        SIXTH_PERIOD
        SEVENTH_PERIOD
        EIGHTH_PERIOD
  FROM ztimetable_tb INTO TABLE it_time
    WHERE class = ztimetable_tb-class.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname = 'ZSF_SCHPRO_TEAM1'
*     VARIANT  = ' '
*     DIRECT_CALL              = ' '
    IMPORTING
      fm_name  = zfnam1
*   EXCEPTIONS
*     NO_FORM  = 1
*     NO_FUNCTION_MODULE       = 2
*     OTHERS   = 3
    .

    CALL FUNCTION zfnam1 "'/1BCDWB/SF00004787'
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
      TABLES
        itab_tt = it_time
* EXCEPTIONS
*       FORMATTING_ERROR           = 1
*       INTERNAL_ERROR             = 2
*       SEND_ERROR                 = 3
*       USER_CANCELED              = 4
*       OTHERS  = 5
      .
ENDFORM.
************************************************************************
*                                                                      *
*                                                                      *
************************************************************************
FORM SF_RESULT.
  DATA: IT_RES TYPE ZTT_RESULT_TEAM1,
        WA_RES TYPE ZSTR_RESULT_TEAM1.

  DATA: ZFNAME2 TYPE rs38l_fnam.

  SELECT STU_ROLL_NO STU_FIR_NAME STU_LAST_NAME HINDI ENGLISH MATHS SCIENCE SOCAIL_SCIENCE
          COMPUTER_SCIENCE OVERALL
    FROM ZRESULT_TB
    INTO TABLE IT_RES
    WHERE STU_ROLL_NO = ZRESULT_TB-stu_roll_no.

    CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
      EXPORTING
        formname                 = 'ZSF_RESULT_TEAM1'
*       VARIANT                  = ' '
*       DIRECT_CALL              = ' '
     IMPORTING
       FM_NAME                  = ZFNAME2
*     EXCEPTIONS
*       NO_FORM                  = 1
*       NO_FUNCTION_MODULE       = 2
*       OTHERS                   = 3
              .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    CALL FUNCTION ZFNAME2 "/1BCDWB/SF00004802'
*     EXPORTING
*       ARCHIVE_INDEX              =
*       ARCHIVE_INDEX_TAB          =
*       ARCHIVE_PARAMETERS         =
*       CONTROL_PARAMETERS         =
*       MAIL_APPL_OBJ              =
*       MAIL_RECIPIENT             =
*       MAIL_SENDER                =
*       OUTPUT_OPTIONS             =
*       USER_SETTINGS              = 'X'
*     IMPORTING
*       DOCUMENT_OUTPUT_INFO       =
*       JOB_OUTPUT_INFO            =
*       JOB_OUTPUT_OPTIONS         =
      TABLES
        itab                       = IT_RES
*     EXCEPTIONS
*       FORMATTING_ERROR           = 1
*       INTERNAL_ERROR             = 2
*       SEND_ERROR                 = 3
*       USER_CANCELED              = 4
*       OTHERS                     = 5
              .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  REFRESH_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM refresh_alv .

   DATA: cont TYPE REF TO cl_gui_custom_container,
         alv_grid TYPE REF TO cl_gui_alv_grid.

   DATA: WA TYPE LVC_S_STBL.


      DATA: it_final TYPE STANDARD TABLE OF zteacher_tb.

      SELECT * FROM zteacher_tb
        INTO TABLE it_final.

      CREATE OBJECT cont
        EXPORTING
*          parent                      =
          container_name              = 'ALV_CONT'
*          style                       =
*          lifetime                    = lifetime_default
*          repid                       =
*          dynnr                       =
*          no_autodef_progid_dynnr     =
*        EXCEPTIONS
*          cntl_error                  = 1
*          cntl_system_error           = 2
*          create_error                = 3
*          lifetime_error              = 4
*          lifetime_dynpro_dynpro_link = 5
*          others                      = 6
          .
      IF sy-subrc <> 0.
*       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.

      CREATE OBJECT alv_grid
        EXPORTING
*          i_shellstyle      = 0
*          i_lifetime        =
          i_parent          = CONT
*          i_appl_events     = space
*          i_parentdbg       =
*          i_applogparent    =
*          i_graphicsparent  =
*          i_name            =
*          i_fcat_complete   = SPACE
*        EXCEPTIONS
*          error_cntl_create = 1
*          error_cntl_init   = 2
*          error_cntl_link   = 3
*          error_dp_create   = 4
*          others            = 5
          .
      IF sy-subrc <> 0.
*       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.


      CALL METHOD alv_grid->set_table_for_first_display
        EXPORTING
*          i_buffer_active               =
*          i_bypassing_buffer            =
*          i_consistency_check           =
          i_structure_name              = 'ZTEACHER_TB'
*          is_variant                    =
*          i_save                        =
*          i_default                     = 'X'
*          is_layout                     =
*          is_print                      =
*          it_special_groups             =
*          it_toolbar_excluding          =
*          it_hyperlink                  =
*          it_alv_graphics               =
*          it_except_qinfo               =
*          ir_salv_adapter               =
        CHANGING
          it_outtab                     = IT_FINAL
*          it_fieldcatalog               =
*          it_sort                       =
*          it_filter                     =
*        EXCEPTIONS
*          invalid_parameter_combination = 1
*          program_error                 = 2
*          too_many_lines                = 3
*          others                        = 4
              .
      IF sy-subrc <> 0.
*       Implement suitable error handling here
      ENDIF.

      CALL METHOD alv_grid->refresh_table_display
        EXPORTING
          is_stable      = WA
*          i_soft_refresh =
*        EXCEPTIONS
*          finished       = 1
*          others         = 2
              .
      IF sy-subrc <> 0.
*       Implement suitable error handling here
      ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE2
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM IMAGE2 .
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'T_IMG2',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'ZTIMETABLE_KAP1'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE3
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM IMAGE3 .
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'T_IMG3',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'ZRESULT_KAP1'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE6
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM IMAGE6 .
 DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'S_IMG4',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'ZRESULT_KAP1'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE5
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM IMAGE5 .
 DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'S_IMG3',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'ZTIMETABLE_KAP1'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE4
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM IMAGE4 .
 DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'S_IMG2',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'OBS_INFO'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
