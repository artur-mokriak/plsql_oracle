CREATE OR REPLACE PACKAGE DEV_SNAPSHOT_DB_OBJECTS IS
  /* ���������� BLOB ���� � ���� */
  PROCEDURE SAVE_BLOBTOFILE(P_FILENAME IN VARCHAR2, P_DIRECTORY_NAME IN VARCHAR2, P_BLOB IN BLOB);
  
  /* ���������� CLOB ���� � ���� */
  PROCEDURE SAVE_CLOBTOFILE(P_FILENAME IN VARCHAR2, P_DIRECTORY_NAME IN VARCHAR2, P_CLOB IN CLOB);
  
  /* ���������� ������� DML ����� PLS/SQL */
  FUNCTION GET_GEN_INSERT(P_SQL CLOB, P_NEW_TABLE_NAME VARCHAR2, P_NEW_OWNER_NAME VARCHAR2 DEFAULT NULL) RETURN CLOB;
  
  /* ���������� ���� �������� ���� ������ */
  FUNCTION CREATE_ALL_OBJECTS RETURN T_STRLIST PIPELINED;
  
  /* ���������� DML ������ ��� ������� ������ � ������� */
  FUNCTION LOADTOFILES_ALL_INSERT_TABLE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;
  
  /* ���������� CTL ������ ��� ������� ������ � ������� */
  FUNCTION LOADTOFILES_ALL_CTL_FILE(P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;
  
  /* ���������� DAT ������ ��� ������� ������ � ������� */
  FUNCTION LOADTOFILES_ALL_DAT_FILE(P_DIRECTORY_NAME_SECOND IN VARCHAR2) RETURN VARCHAR2;
  
  /* ���������� ������������������ (SEQUENCE) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_SEQUENCE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;
  
  /* ���������� ���� ������������� (VIEW) � ���� � ��������� � ����������������� ������������� (MATERIALIZED VIEW) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_VIEW(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ��������� (TRIGGER) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_TRIGGER(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ����� (TYPE) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_TYPE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ������� (FUNCTION) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_FUNCTION(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� �������� (PROCEDURE) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_PROCEDURE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ������� (PACKAGE) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_PACKAGE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ������ (TABLE) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_TABLE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� ����������� (CONSTRAIN) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_CONSTRAIN(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� �������� (INDEX) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_INDEX(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� ���� �������� (SQLQUERY) � ���� � ��������� */
  FUNCTION LOADTOFILES_ALL_SQLQUERY(P_DIRECTORY_NAME IN VARCHAR2) RETURN VARCHAR2;

  /* ���������� CLOB � BLOB ����� � ����  */
  FUNCTION LOADTOFILES_CLOB_BLOB_OFQUERY(P_QUERY IN VARCHAR2, P_TABLE_NAME IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2) RETURN VARCHAR2;

  /* �������� ����� DDL ������������������ */
  FUNCTION GET_DDL_SEQUENCE(P_SEQUENCE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ������������������ ������������� */
  FUNCTION GET_DDL_MVIEW(P_MVIEW_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� DDL ������������� */
  FUNCTION GET_DDL_VIEW(P_VIEW_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� DDL ��������� */
  FUNCTION GET_DDL_TRIGGER(P_TRIGGER_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ��� ������������ */
  FUNCTION GET_DDL_TYPE_SPEC(P_TYPE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� DDL ���� ���� */
  FUNCTION GET_DDL_TYPE_BODY(P_TYPE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ������� */
  FUNCTION GET_DDL_FUNCTION(P_FUNCTION_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� DDL ��������� */
  FUNCTION GET_DDL_PROCEDURE(P_PROCEDURE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ������������ ������ */
  FUNCTION GET_DDL_PACKAGE_SPEC(P_PACKAGE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ���� ������ */
  FUNCTION GET_DDL_PACKAGE_BODY(P_PACKAGE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ������� */
  FUNCTION GET_DDL_TABLE(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� SELECT INSERT ������� */
  FUNCTION GET_DML_INSSCRIPT(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DML INSERT ������� */
  FUNCTION GET_DML_TABLE(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;

  /* �������� ����� ������� �� ���� ������ */
  FUNCTION GET_DML_SQLQUERY(P_BO_QUERY_ID NUMBER) RETURN CLOB;

  /* �������� ����� DDL ����������� */
  FUNCTION GET_DDL_CONSTRAINT(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DDL ������� */
  FUNCTION GET_DDL_INDEX(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� CTL ���� ������� */
  FUNCTION GET_CTL_FILE_SCRIPT(P_TABLE_NAME VARCHAR2, P_OWNER_NAME VARCHAR2) RETURN CLOB;
  
  /* �������� ����� DAT ���� ������� */
  FUNCTION GET_DAT_FILE_QUERY(P_QUERY IN VARCHAR2, P_TABLE_NAME IN VARCHAR2, P_SEPARATOR IN VARCHAR2 DEFAULT ';', P_LINE_TERMINATOR IN VARCHAR2 DEFAULT '{EOL}') RETURN CLOB;

END DEV_SNAPSHOT_DB_OBJECTS;
/
CREATE OR REPLACE PACKAGE BODY DEV_SNAPSHOT_DB_OBJECTS IS
  /*
    ����� - DEV_SNAPSHOT_DB_OBJECTS
    ��������: ������������ ��� �������� �������� ������ ���� ������
              ���� �������� SQL - DDL, DML, SQL*Loader.     
              
    �������������: 
    - ��� ���� ��������:
    SELECT TEXT FROM TABLE(DEV_SNAPSHOT_DB_OBJECTS.CREATE_ALL_OBJECTS);
    ����� ���������� ~ 30:00 �����.
    ���������:
        TEXT
    1 ����� tables ���������!!!
    2 ����� constraints ���������!!!
    3 ����� indexes ���������!!!
    4 ����� views ���������!!!
    5 ����� triggers ���������!!!
    6 ����� types ���������!!!
    7 ����� functions ���������!!!
    8 ����� procedures ���������!!!
    9 ����� packages ���������!!!
    10  ����� sequences ���������!!!
    11  ����� ctl ���������!!!
    12  "����� *.dat ������� ELSYS_ACCTRANS_DETAIL ���������!!!
       ����� *.dat ������� ELSYS_BO_QUERY ���������!!!
       ����� *.dat ������� ELSYS_FIELD_PROPERTY ���������!!!
       ����� *.dat ������� ELSYS_FILTER ���������!!!
       ����� *.dat ������� ELSYS_JOB ���������!!!
       ����� *.dat ������� ELSYS_PRINT_FORM ���������!!!
       ����� *.dat ������� NN_XML_SETTINGS ���������!!!
       ����� *.dat ������� XLRPT_TEMPLATE ���������!!!
       ����� dat ���������!!!"
    13  ����� dml insert ���������!!!

    ������� �������������:
    -- QUERYS
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_SQLQUERY(P_DIRECTORY_NAME => 'DIRPATH_FILE_DATA_TABLES') FROM DUAL;

    -- TABLES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_TABLE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                         P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TABLES',
                                                         P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- CONSTRAINS
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_CONSTRAIN(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP', 
                                                             P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_CONSTRAINTS',       
                                                             P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- INDEXES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_INDEX(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                         P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_INDEXES',
                                                         P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- PACKAGES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_PACKAGE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                           P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_PACKAGES',
                                                           P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- PROCEDURES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_PROCEDURE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP', 
                                                             P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_PROCEDURES',
                                                             P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- FUNCTIONS
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_FUNCTION(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                            P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_FUNCTIONS', 
                                                            P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- TYPES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_TYPE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_FILE_TYPES',
                                                        P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TYPES', 
                                                        P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- TRIGGERS
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_TRIGGER(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                           P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TRIGGERS', 
                                                           P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- VIEWS
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_VIEW(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP', 
                                                        P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_VIEWS', 
                                                        P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;

    -- SEQUENCES
    SELECT DEV_SNAPSHOT_DB_OBJECTS.LOADTOFILES_ALL_SEQUENCE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                                            P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_SEQUENCES', 
                                                            P_OWNER_NAME            => 'DISTRDEV') FROM DUAL;
    ��� ����������� �������� �����.
    ������ � �������� ����� � ���� ����������(DISTRDEV): \\MAINSRV\DevFileTmp

    ��������� ����� � ������ ��� ���������� ��������:
    Root\
      sql_views.sql
      sql_types.sql
      sql_triggers.sql
      sql_tables.sql
      sql_sequences.sql
      sql_procedures.sql
      sql_packages.sql
      sql_indexes.sql
      sql_functions.sql
      sql_data_tables.sql
      sql_constraints.sql
      constraints\
      xlrpt_template.cnstr
      ...
      data_tables\
      rep_type_reestr.sql
      xlrpt_template.ctl
      xlrpt_template.ldr
      xlrpt_template_81012.dat
      ...
      functions\
      wc_sum_credit_update.fnc
      indexes\
      xlrpt_template.idx
      ...
      packages\
      el_xml.spc
      el_xml.bdy
      ...
      procedures\
      write_log.prc
      ...
      sequences\
      xlrpt_template_sqgen.seq
      ...
      tables\
      xlrpt_template.tab
      ...
      triggers\
      xlrpt_template_bi_crtinf.trg
      ...
      types\
      t_stragg_param.typ
      t_tax_debits.tps
      ...
      views\
      v_taxes.vw
      mv_conv_coordinates.mvw
      ...

    ������� ���������� (ALL_DIRECTORIES) �� ���� ����������(DISTRDEV):
        DIRECTORY_NAME          DIRECTORY_PATH
    1 DIRPATH_FILE_DATA_TABLES  D:\DevFileTmp\data_tables
    2 DIRPATH_FILE_VIEWS        D:\DevFileTmp\views
    3 DIRPATH_FILE_TYPES        D:\DevFileTmp\types
    4 DIRPATH_FILE_TRIGGERS     D:\DevFileTmp\triggers
    5 DIRPATH_FILE_TABLES       D:\DevFileTmp\tables
    6 DIRPATH_FILE_SEQUENCES    D:\DevFileTmp\sequences
    7 DIRPATH_FILE_PROCEDURES   D:\DevFileTmp\procedures
    8 DIRPATH_FILE_PACKAGES     D:\DevFileTmp\packages
    9 DIRPATH_FILE_INDEXES      D:\DevFileTmp\indexes
    10  DIRPATH_FILE_FUNCTIONS    D:\DevFileTmp\functions
    11  DIRPATH_FILE_CONSTRAINTS  D:\DevFileTmp\constraints
    12  DIRPATH_DEVFILETMP      D:\DevFileTmp

  */
        
  /*
    ���������� BLOB ���� � ����
    ���������:
     P_FILENAME - ��� ����� 
     P_DIRECTORY_NAME - ����������
     P_BLOB - ������ ��� ���������� 
  */
  PROCEDURE SAVE_BLOBTOFILE(P_FILENAME IN VARCHAR2, P_DIRECTORY_NAME IN VARCHAR2, P_BLOB IN BLOB) IS
  V_LOB_LOC      BLOB;
  V_BUFFER       RAW(32767);
  V_BUFFER_SIZE  BINARY_INTEGER;
  V_AMOUNT       BINARY_INTEGER;
  V_OFFSET       NUMBER(38) := 1;
  V_CHUNKSIZE    INTEGER;
  V_OUT_FILE     UTL_FILE.FILE_TYPE;
  BEGIN
    V_LOB_LOC := P_BLOB;
    V_CHUNKSIZE := DBMS_LOB.GETCHUNKSIZE(V_LOB_LOC);
    IF (V_CHUNKSIZE < 32767) THEN
      V_BUFFER_SIZE := V_CHUNKSIZE;
    ELSE
      V_BUFFER_SIZE := 32767;
    END IF;
    V_AMOUNT := V_BUFFER_SIZE;
    V_OUT_FILE := UTL_FILE.FOPEN(LOCATION     => P_DIRECTORY_NAME,
                                 FILENAME     => P_FILENAME,
                                 OPEN_MODE    => 'wb',
                                 MAX_LINESIZE => 32767);
    IF (DBMS_LOB.GETLENGTH(V_LOB_LOC) > 0) THEN
      DBMS_LOB.OPEN(V_LOB_LOC, DBMS_LOB.LOB_READONLY); 
      WHILE (V_AMOUNT >= V_BUFFER_SIZE)
      LOOP
      DBMS_LOB.READ(LOB_LOC => P_BLOB,
                    AMOUNT  => V_AMOUNT,
                    OFFSET  => V_OFFSET,
                    BUFFER  => V_BUFFER);
      V_OFFSET := V_OFFSET + V_AMOUNT;
      UTL_FILE.PUT_RAW(FILE      => V_OUT_FILE,
                       BUFFER    => V_BUFFER,
                       AUTOFLUSH => TRUE);
      UTL_FILE.FFLUSH(FILE => V_OUT_FILE);
      END LOOP;
      DBMS_LOB.CLOSE(V_LOB_LOC);
    END IF;  
    UTL_FILE.FFLUSH(FILE => V_OUT_FILE);
    UTL_FILE.FCLOSE(V_OUT_FILE);
  EXCEPTION  
  WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20010, 'ERROR - SAVE_BLOBTOFILE');  
  END SAVE_BLOBTOFILE;

  /*
    ���������� CLOB ���� � ����
    ���������:
     P_FILENAME - ��� ����� 
     P_DIRECTORY_NAME - ����������
     P_CLOB - ������ ��� ���������� 
  */ 
  PROCEDURE SAVE_CLOBTOFILE(P_FILENAME IN VARCHAR2, P_DIRECTORY_NAME IN VARCHAR2, P_CLOB IN CLOB) IS
  BEGIN
     DBMS_XSLPROCESSOR.CLOB2FILE(P_CLOB, P_DIRECTORY_NAME, P_FILENAME);
  EXCEPTION
  WHEN OTHERS THEN RAISE;
  END SAVE_CLOBTOFILE;

  /* 
    ���������� ������� DML ���� PLS/SQL 
    �����: https://github.com/teopost/oracle-scripts/blob/master/fn_gen_inserts.sql
    ���������:
     P_SQL - ������, ������: SELECT * FROM ELSYS_PRINT_FORM WHERE ID = 3880004
     P_NEW_TABLE_NAME - ����� �������� �������
     P_NEW_OWNER_NAME - ����� �������� ��������� 
  */
  FUNCTION GET_GEN_INSERT(P_SQL CLOB, P_NEW_TABLE_NAME VARCHAR2, P_NEW_OWNER_NAME VARCHAR2 DEFAULT NULL) RETURN CLOB IS
    L_CUR                        NUMBER;
    NL                           VARCHAR2(2) := CHR(13)||CHR(10);
    L_SQL                        CLOB := P_SQL;
    L_RET                        NUMBER;
    L_COL_CNT                    NUMBER;
    L_REC_TAB                    DBMS_SQL.DESC_TAB;
    L_SEPARATOR                  CHAR(1) := '!';
    L_CLOB                       CLOB;
    L_CLOB_LINE                  CLOB;
    L_CLOB_ALL                   CLOB;
    L_LINE                       CLOB := '-----------------------------------';
    CONS_DATE_FRM                VARCHAR2(32) := 'DD.MM.YYYY HH24:MI:SS';
    CONS_TIMESTAMP_FRM           VARCHAR2(32) := 'DD.MM.YYYY HH24:MI:SSXFF';
    CONS_TIMESTAMP_WTZ_FRM       VARCHAR2(32) := 'DD.MM.YYYY HH24:MI:SSXFF TZR';
    CONS_VARCHAR2_CODE           NUMBER := 1;
    CONS_NUMBER_CODE             NUMBER := 2;
    CONS_DATE_CODE               NUMBER := 12;
    CONS_BINARY_FLOAT_CODE       NUMBER := 100;
    CONS_BINARY_DOUBLE_CODE      NUMBER := 101;
    CONS_TIMESTAMP_CODE          NUMBER := 180;
    CONS_TIMESTAMP_WTZ_CODE      NUMBER := 181;
    CONS_TIMESTAMP_LWTZ_CODE     NUMBER := 231;
    CONS_INTERVAL_YTM_CODE       NUMBER := 182;
    CONS_INTERVAL_DTS_CODE       NUMBER := 183;
    CONS_ROWID_CODE              NUMBER := 11;
    CONS_UROWID_CODE             NUMBER := 208;
    CONS_CHAR_CODE               NUMBER := 96;
    CONS_CLOB_CODE               NUMBER := 112;
    -------------------------------------
    -- SUPPORTED TYPES
    -------------------------------------
    L_VARCHAR2_COL                VARCHAR2(32767); --1
    L_NUMBER_COL                  NUMBER;          --2
    L_DATE_COL                    DATE;            --12
    L_ROWID_COL                   ROWID;           --69
    L_CHAR_COL                    CHAR(2000);      --96
    L_BINARY_FLOAT_COL            BINARY_FLOAT;    --100
    L_BINARY_DOUBLE_COL           BINARY_DOUBLE;   --101
    L_CLOB_COL                    CLOB;            --112
    L_TIMESTAMP_COL               TIMESTAMP(9);    --180
    L_TIMESTAMP_WTZ_COL           TIMESTAMP(9) WITH TIME ZONE;    --181
    L_INTERVAL_YTM_COL            INTERVAL YEAR(9) TO MONTH;      --182
    L_INTERVAL_DTS_COL            INTERVAL DAY(9) TO SECOND(2);   --183
    L_UROWID_COL                  UROWID;                         --208
    L_TIMESTAMP_WLTZ_COL          TIMESTAMP WITH LOCAL TIME ZONE; --231
    PROCEDURE PRINT_REC(REC IN DBMS_SQL.DESC_REC) IS
    BEGIN
      L_CLOB_ALL := L_CLOB_ALL||NL||
        'COL_TYPE            =    ' || REC.COL_TYPE||NL||
        'COL_MAXLEN          =    ' || REC.COL_MAX_LEN||NL||
        'COL_NAME            =    ' || REC.COL_NAME||NL||
        'COL_NAME_LEN        =    ' || REC.COL_NAME_LEN||NL||
        'COL_SCHEMA_NAME     =    ' || REC.COL_SCHEMA_NAME||NL||
        'COL_SCHEMA_NAME_LEN =    ' || REC.COL_SCHEMA_NAME_LEN||NL||
        'COL_PRECISION       =    ' || REC.COL_PRECISION||NL||
        'COL_SCALE           =    ' || REC.COL_SCALE||NL||
        'COL_NULL_OK         =    ';
      IF (REC.COL_NULL_OK) THEN
        L_CLOB_ALL := L_CLOB_ALL||'TRUE'||NL;
      ELSE
        L_CLOB_ALL := L_CLOB_ALL||'FALSE'||NL;
      END IF;
    END;  
  BEGIN
    ---------------------------------------
    -- INSERT - HEADER GENERATION
    ---------------------------------------
    L_CLOB_ALL := 
    'SET DEFINE OFF'||NL||
    'DECLARE'||NL||
    '  TYPE   T_CLOB IS TABLE OF CLOB INDEX BY BINARY_INTEGER;'||NL||
    '  L_CLOB T_CLOB;'||NL||
    '  TYPE   T_VARCHAR2 IS TABLE OF VARCHAR2(64) INDEX BY BINARY_INTEGER;'||NL||
    '  L_VARCHAR2 T_VARCHAR2;'||NL||
    'BEGIN'||NL;
    ---------------------------------------
    -- INTRODUCTION
    ---------------------------------------
    ---------------------------------------
    -- OPEN PARSE CURSOR
    ---------------------------------------
    L_CUR := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(L_CUR, L_SQL, DBMS_SQL.NATIVE);
    ---------------------------------------
    -- DESCRIBE COLUMNS
    ---------------------------------------
    DBMS_SQL.DESCRIBE_COLUMNS(L_CUR, L_COL_CNT, L_REC_TAB);
    L_CLOB_ALL := L_CLOB_ALL||NL||
              '  NULL;'||NL||
              '  -- START GENERATION OF RECORDS'||NL||
              '  '||L_LINE||NL;
    ---------------------------------------
    -- DEFINE COLUMNS
    ---------------------------------------
    FOR I IN 1..L_REC_TAB.COUNT
    LOOP
      IF L_REC_TAB(I).COL_TYPE = CONS_VARCHAR2_CODE THEN --VARCHAR2
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_VARCHAR2_COL, L_REC_TAB(I).COL_MAX_LEN); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_NUMBER_CODE THEN --NUMBER
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_NUMBER_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_DATE_CODE THEN --DATE
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_DATE_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_BINARY_FLOAT_CODE THEN --BINARY_FLOAT
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_BINARY_FLOAT_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_BINARY_DOUBLE_CODE THEN --BINARY_DOUBLE
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_BINARY_DOUBLE_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_ROWID_CODE THEN  --ROWID
        DBMS_SQL.DEFINE_COLUMN_ROWID(L_CUR, I, L_ROWID_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_CHAR_CODE THEN  --CHAR
        DBMS_SQL.DEFINE_COLUMN_CHAR(L_CUR, I, L_CHAR_COL, L_REC_TAB(I).COL_MAX_LEN); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_CLOB_CODE THEN --CLOB
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_CLOB_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_CODE THEN --TIMESTAMP
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_TIMESTAMP_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_WTZ_CODE THEN --TIMESTAMP WITH TIME ZONE
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_TIMESTAMP_WTZ_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_ROWID_CODE THEN --UROWID
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_UROWID_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_LWTZ_CODE THEN --TIMESTAMP WITH LOCAL TIME ZONE
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_TIMESTAMP_WLTZ_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_YTM_CODE THEN --INTERVAL YEAR TO MONTH
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_INTERVAL_YTM_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_DTS_CODE THEN --INTERVAL DAY TO SECOND
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_INTERVAL_DTS_COL); 
      ELSIF L_REC_TAB(I).COL_TYPE = CONS_UROWID_CODE THEN --UROWID
        DBMS_SQL.DEFINE_COLUMN(L_CUR, I, L_UROWID_COL); 
      ELSE
        RAISE_APPLICATION_ERROR(-20001, 'COLUMN: '||L_REC_TAB(I).COL_NAME||NL||
                                        'TYPE NOT SUPPORTED: '||L_REC_TAB(I).COL_TYPE);
        --NOT SUPPORTED
      END IF;
    END LOOP;
    ---------------------------------------
    -- EXECUTE CURSOR
    ---------------------------------------
    L_RET := DBMS_SQL.EXECUTE(L_CUR);
    ---------------------------------------
    -- FETCH ROWS
    ---------------------------------------
    LOOP
      L_RET := DBMS_SQL.FETCH_ROWS(L_CUR);
      EXIT WHEN L_RET = 0;
      ---------------------------------------
      -- BUILDING INSERT - BUILD COLUMN DECLARATIONS
      ---------------------------------------
      L_CLOB_LINE := '';
      FOR I IN 1..L_REC_TAB.COUNT
      LOOP
        IF    L_REC_TAB(I).COL_TYPE = CONS_VARCHAR2_CODE THEN --VARCHAR2
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_VARCHAR2_COL); 
          L_CLOB := L_VARCHAR2_COL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_NUMBER_CODE THEN --NUMBER
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_NUMBER_COL); 
          L_CLOB := TO_CHAR(L_NUMBER_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_DATE_CODE THEN --DATE
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_DATE_COL); 
          L_CLOB := TO_CHAR(L_DATE_COL, CONS_DATE_FRM);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_BINARY_FLOAT_CODE THEN --BINARY_FLOAT
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_BINARY_FLOAT_COL); 
          L_CLOB := TO_CHAR(L_BINARY_FLOAT_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_BINARY_DOUBLE_CODE THEN --BINARY_DOUBLE
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_BINARY_DOUBLE_COL); 
          L_CLOB := TO_CHAR(L_BINARY_DOUBLE_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_ROWID_CODE THEN --ROWID
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_ROWID_COL); 
          L_CLOB := TO_CHAR(L_ROWID_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_CHAR_CODE THEN --CHAR
          DBMS_SQL.COLUMN_VALUE_CHAR(L_CUR, I, L_CHAR_COL); 
          L_CLOB := SUBSTR(L_CHAR_COL, 1, L_REC_TAB(I).COL_MAX_LEN - 1);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_CLOB_CODE THEN --CLOB
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_CLOB_COL); 
          L_CLOB := L_CLOB_COL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_CODE THEN --TIMESTAMP
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_TIMESTAMP_COL); 
          L_CLOB := TO_CHAR(L_TIMESTAMP_COL, CONS_TIMESTAMP_FRM);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_WTZ_CODE THEN --TIMESTAMP WITH TIME ZONE
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_TIMESTAMP_WTZ_COL); 
          L_CLOB := TO_CHAR(L_TIMESTAMP_WTZ_COL, CONS_TIMESTAMP_WTZ_FRM);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_YTM_CODE THEN --INTERVAL YEAR TO MONTH
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_INTERVAL_YTM_COL); 
          L_CLOB := TO_CHAR(L_INTERVAL_YTM_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_DTS_CODE THEN --INTERVAL DAY TO SECOND
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_INTERVAL_DTS_COL); 
          L_CLOB := TO_CHAR(L_INTERVAL_DTS_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_UROWID_CODE THEN --UROWID
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_UROWID_COL); 
          L_CLOB := TO_CHAR(L_UROWID_COL);
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_LWTZ_CODE THEN --TIMESTAMP WITH LOCAL TIME ZONE
          DBMS_SQL.COLUMN_VALUE(L_CUR, I, L_TIMESTAMP_WLTZ_COL); 
          L_CLOB := TO_CHAR(L_TIMESTAMP_WLTZ_COL, CONS_TIMESTAMP_WTZ_FRM);
        END IF;
        IF L_REC_TAB(I).COL_TYPE IN (CONS_CLOB_CODE, CONS_CHAR_CODE, CONS_VARCHAR2_CODE) THEN
          L_CLOB_LINE := L_CLOB_LINE||'  L_CLOB('||TO_CHAR(I)||') :=Q'''||L_SEPARATOR||L_CLOB||L_SEPARATOR||''';'||NL;
        ELSE
          L_CLOB_LINE := L_CLOB_LINE||'  L_VARCHAR2('||TO_CHAR(I)||') :=Q'''||L_SEPARATOR||L_CLOB||L_SEPARATOR||''';'||NL;
        END IF;
      END LOOP;
      L_CLOB_ALL := L_CLOB_ALL||NL||L_CLOB_LINE;
      ---------------------------------------
      -- BUILDING INSERT - BUILD COLUMN LIST
      ---------------------------------------
      IF P_NEW_OWNER_NAME IS NULL THEN
          L_CLOB_ALL := L_CLOB_ALL||CHR(13)||NL||
                '  INSERT INTO '||P_NEW_TABLE_NAME||NL||
                '  ('||NL;
      ELSE
          L_CLOB_ALL := L_CLOB_ALL||CHR(13)||NL||
                '  INSERT INTO '||P_NEW_OWNER_NAME||'.'||P_NEW_TABLE_NAME||NL||
                '  ('||NL;
      END IF;
      FOR I IN 1..L_REC_TAB.COUNT
      LOOP
        IF I = 1 THEN
          L_CLOB_ALL := L_CLOB_ALL||'     '||'"'||L_REC_TAB(I).COL_NAME||'"'||NL;
        ELSE  
          L_CLOB_ALL := L_CLOB_ALL||'    ,'||'"'||L_REC_TAB(I).COL_NAME||'"'||NL;
        END IF;  
      END LOOP;    
      L_CLOB_ALL := L_CLOB_ALL||
                '  )'||NL||
                '  VALUES'||NL||
                '  ('||NL;
      ---------------------------------------
      -- BUILDING INSERT - BUILD VALUES
      ---------------------------------------
      FOR I IN 1..L_REC_TAB.COUNT
      LOOP
        IF I!=1 THEN
          L_CLOB_ALL := L_CLOB_ALL||'    ,';
        ELSE  
          L_CLOB_ALL := L_CLOB_ALL||'     ';
        END IF;
        IF L_REC_TAB(I).COL_TYPE = CONS_NUMBER_CODE THEN --NUMBER
          L_CLOB_ALL := L_CLOB_ALL||'TO_NUMBER(L_VARCHAR2('||TO_CHAR(I)||'))'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_CLOB_CODE THEN --CLOB
          L_CLOB_ALL := L_CLOB_ALL||'L_CLOB('||TO_CHAR(I)||')'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_CHAR_CODE THEN --TIMESTAMP WITH LOCAL TIME ZONE
          L_CLOB_ALL := L_CLOB_ALL||'TO_CHAR(L_CLOB('||TO_CHAR(I)||'))'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_VARCHAR2_CODE THEN --TIMESTAMP WITH LOCAL TIME ZONE
          L_CLOB_ALL := L_CLOB_ALL||'TO_CHAR(L_CLOB('||TO_CHAR(I)||'))'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_DATE_CODE THEN --DATE
          L_CLOB_ALL := L_CLOB_ALL||'TO_DATE(L_VARCHAR2('||TO_CHAR(I)||'),'''||CONS_DATE_FRM||''')'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_CODE THEN --TIMESTAMP
          L_CLOB_ALL := L_CLOB_ALL||'TO_TIMESTAMP(L_VARCHAR2('||TO_CHAR(I)||'),'''||CONS_TIMESTAMP_FRM||''')'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_WTZ_CODE THEN --TIMESTAMP WITH TIME ZONE
          L_CLOB_ALL := L_CLOB_ALL||'TO_TIMESTAMP_TZ(L_VARCHAR2('||TO_CHAR(I)||'),'''||CONS_TIMESTAMP_WTZ_FRM||''')'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_YTM_CODE THEN --INTERVAL YEAR TO MONTH
          L_CLOB_ALL := L_CLOB_ALL||'TO_YMINTERVAL(L_VARCHAR2('||TO_CHAR(I)||'))'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_INTERVAL_DTS_CODE THEN --INTERVAL DAY TO SECOND
          L_CLOB_ALL := L_CLOB_ALL||'TO_DSINTERVAL(L_VARCHAR2('||TO_CHAR(I)||'))'||NL;
        ELSIF L_REC_TAB(I).COL_TYPE = CONS_TIMESTAMP_LWTZ_CODE THEN --TIMESTAMP WITH LOCAL TIME ZONE
          L_CLOB_ALL := L_CLOB_ALL||'TO_TIMESTAMP_TZ(L_VARCHAR2('||TO_CHAR(I)||'),'''||CONS_TIMESTAMP_WTZ_FRM||''')'||NL;
        ELSE  
          L_CLOB_ALL := L_CLOB_ALL||'L_VARCHAR2('||TO_CHAR(I)||')'||NL;
        END IF;  
      END LOOP; 
      L_CLOB_ALL := L_CLOB_ALL||'  );'||NL;
    END LOOP;
    ---------------------------------------
    -- BUILDING INSERT - END OF CODE
    ---------------------------------------
    L_CLOB_ALL := L_CLOB_ALL||NL;
    L_CLOB_ALL := L_CLOB_ALL||'END;'||NL;
    ---------------------------------------
    -- CLOSE CURSOR
    ---------------------------------------
    DBMS_SQL.CLOSE_CURSOR(L_CUR);
    L_CLOB_ALL := L_CLOB_ALL||'/'||NL;
    RETURN TRIM(L_CLOB_ALL);
  END GET_GEN_INSERT;
  
  /* 
     ���������� ���� �������� ���� ������ 
     ��� ����������.
     ��������� - ����� ���������� ������ ������� 
  */
  FUNCTION CREATE_ALL_OBJECTS RETURN T_STRLIST
  PIPELINED IS
    V_TEXT VARCHAR2(4000);
  BEGIN
    -- TABLES
    V_TEXT := LOADTOFILES_ALL_TABLE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                    P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TABLES',
                                    P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- CONSTRAINTS
    V_TEXT := LOADTOFILES_ALL_CONSTRAIN(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                        P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_CONSTRAINTS',
                                        P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- INDEXES
    V_TEXT := LOADTOFILES_ALL_INDEX(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                    P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_INDEXES',
                                    P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- VIEWS
    V_TEXT := LOADTOFILES_ALL_VIEW(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                   P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_VIEWS',
                                   P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- TRIGGERS
    V_TEXT := LOADTOFILES_ALL_TRIGGER(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                      P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TRIGGERS',
                                      P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- TYPES
    V_TEXT := LOADTOFILES_ALL_TYPE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                   P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_TYPES',
                                   P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- FUNCTIONS
    V_TEXT := LOADTOFILES_ALL_FUNCTION(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                       P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_FUNCTIONS',
                                       P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- PROCEDURES
    V_TEXT := LOADTOFILES_ALL_PROCEDURE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                        P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_PROCEDURES',
                                        P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- PACKAGES
    V_TEXT := LOADTOFILES_ALL_PACKAGE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                      P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_PACKAGES',
                                      P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
    -- SEQUENCES
    V_TEXT := LOADTOFILES_ALL_SEQUENCE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP',
                                       P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_SEQUENCES',
                                       P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));
   
    -- QUERYS
    --V_TEXT := LOADTOFILES_ALL_SQLQUERY(P_DIRECTORY_NAME => 'DIRPATH_FILE_DATA_TABLES');
    --PIPE ROW(R_STRLIST(V_TEXT));

    -- SQL LOADER CTL FILE
    V_TEXT := LOADTOFILES_ALL_CTL_FILE(P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_DATA_TABLES',
                                       P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));

    -- SQL LOADER DAT FILE
    V_TEXT := LOADTOFILES_ALL_DAT_FILE(P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_DATA_TABLES');
    PIPE ROW(R_STRLIST(V_TEXT));

    -- SQL DML INSERT TABLE
    V_TEXT := LOADTOFILES_ALL_INSERT_TABLE(P_DIRECTORY_NAME_ROOT   => 'DIRPATH_DEVFILETMP', 
                                           P_DIRECTORY_NAME_SECOND => 'DIRPATH_FILE_DATA_TABLES', 
                                           P_OWNER_NAME            => 'DISTRDEV');
    PIPE ROW(R_STRLIST(V_TEXT));

    RETURN;
  END CREATE_ALL_OBJECTS;

  /*
    ���������� DML ������ ��� ������� ������ � �������
    ������� ���������� ������� ELSYS_TABLES ��� �������� ��������.
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_INSERT_TABLE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT UPPER(T.TABLE_NAME) AS TABLE_NAME
                          FROM ELSYS_TABLES T
                         WHERE T.IS_TRUNCATABLE IS NULL
                           AND UPPER(T.TABLE_NAME) NOT IN ('XLRPT_TEMPLATE', 'NN_XML_SETTINGS', 'ELSYS_PRINT_FORM', 
                                                           'ELSYS_JOB', 'ELSYS_FILTER', 'ELSYS_BO_QUERY', 'ELSYS_ACCTRANS_DETAIL',
                                                           'ELSYS_FIELD_PROPERTY')    
                        ORDER BY T.TABLE_NAME)
        LOOP
          L_CLOB := GET_DML_TABLE(P_TABLE_NAME => CUR_ROWS.TABLE_NAME, P_OWNER_NAME => UPPER(P_OWNER_NAME));
          IF (L_CLOB IS NOT NULL) THEN
            L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.sql'; 
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Inserting data in table ' || UPPER(CUR_ROWS.TABLE_NAME) || CHR(10) ||
                                        'PROMPT =======================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/data_tables/' || L_PATH || CHR(10);

          END IF;  
        END LOOP;
        L_PATH := 'sql_data_tables.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_data_tables.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN('����� dml insert ���������!!!');
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_INSERT_TABLE;

  /*
    ���������� CTL ������ ��� ������� ������ � �������
    ������������ SQL*Loader
    ������� ���������� ������� ELSYS_TABLES ��� �������� ��������.
    ���������: 
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_CTL_FILE(P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT UPPER(T.TABLE_NAME) AS TABLE_NAME
                          FROM ELSYS_TABLES T
                         WHERE T.IS_TRUNCATABLE IS NULL
                           AND UPPER(T.TABLE_NAME) IN ('XLRPT_TEMPLATE', 'NN_XML_SETTINGS', 'ELSYS_PRINT_FORM', 
                                                       'ELSYS_JOB', 'ELSYS_FILTER', 'ELSYS_BO_QUERY', 'ELSYS_ACCTRANS_DETAIL',
                                                       'ELSYS_FIELD_PROPERTY')    
                        ORDER BY T.TABLE_NAME)
        LOOP
          L_CLOB := GET_CTL_FILE_SCRIPT(P_TABLE_NAME => CUR_ROWS.TABLE_NAME, P_OWNER_NAME => UPPER(P_OWNER_NAME));
          IF (L_CLOB IS NOT NULL) THEN
             L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.ctl'; 
             SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
          END IF;  
        END LOOP;
        RETURN('����� ctl ���������!!!');
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_CTL_FILE;

  /*
    ���������� DAT ������ ��� ������� ������ � �������
    ������������ SQL*Loader
    ������� ���������� ������� ELSYS_TABLES ��� �������� ��������.
    ���������: 
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
  */
  FUNCTION LOADTOFILES_ALL_DAT_FILE(P_DIRECTORY_NAME_SECOND IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
    RESULT VARCHAR2(4000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT UPPER(T.TABLE_NAME) AS TABLE_NAME
                          FROM ELSYS_TABLES T
                         WHERE T.IS_TRUNCATABLE IS NULL
                        ORDER BY T.TABLE_NAME)
        LOOP
          IF (CUR_ROWS.TABLE_NAME IN ('XLRPT_TEMPLATE', 'NN_XML_SETTINGS', 'ELSYS_PRINT_FORM', 
                                      'ELSYS_JOB', 'ELSYS_FILTER', 'ELSYS_BO_QUERY', 'ELSYS_ACCTRANS_DETAIL',
                                      'ELSYS_FIELD_PROPERTY')) THEN

            L_CLOB := LOADTOFILES_CLOB_BLOB_OFQUERY(P_QUERY                 => 'SELECT T.* FROM ' || CUR_ROWS.TABLE_NAME || ' T ',
                                                    P_TABLE_NAME            => CUR_ROWS.TABLE_NAME,
                                                    P_DIRECTORY_NAME_SECOND => P_DIRECTORY_NAME_SECOND);
            RESULT := RESULT || DBMS_LOB.SUBSTR(L_CLOB, 1000, 1) || CHR(13);  
            L_CLOB := GET_DAT_FILE_QUERY(P_QUERY           => 'SELECT T.* FROM ' || CUR_ROWS.TABLE_NAME || ' T ',
                                         P_TABLE_NAME      => CUR_ROWS.TABLE_NAME,
                                         P_SEPARATOR       => ';',
                                         P_LINE_TERMINATOR => '{EOL}');
            IF (L_CLOB IS NOT NULL) THEN
               L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.ldr'; 
               SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            END IF;   
          END IF;  
        END LOOP;
        RESULT := RESULT || '����� dat ���������!!!';
        RETURN(RESULT);
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_DAT_FILE;

  /*
    ���������� ���� ������������������� (SEQUENCE) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.seq
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_sequences.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_SEQUENCE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('SEQUENCE')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.seq';
          L_CLOB := GET_DDL_SEQUENCE(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating sequence ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT =================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/sequences/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_sequences.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_sequences.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� sequences ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_SEQUENCE;

  /*
    ���������� ���� ������������� (VIEW) � ���� � ���������
               � ����������������� ������������� (MATERIALIZED VIEW) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.vw � *.mvw
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_views.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_VIEW(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('VIEW')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.vw';
          L_CLOB := GET_DDL_VIEW(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating view ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT =============' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/views/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('MATERIALIZED VIEW')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.mvw';
          L_CLOB := GET_DDL_MVIEW(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating materialized view ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT ==========================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/views/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_views.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_views.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� views ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_VIEW;

  /*
    ���������� ���� ��������� (TRIGGER) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.trg
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_triggers.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_TRIGGER(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('TRIGGER')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.trg';
          L_CLOB := GET_DDL_TRIGGER(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating trigger ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT ================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/triggers/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_triggers.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_triggers.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� triggers ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_TRIGGER;

  /*
    ���������� ���� ����� (TYPE) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.typ � *.tps
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_types.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_TYPE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('TYPE')
                            AND UPPER(O.OBJECT_NAME) NOT LIKE 'SYS_%' 
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME))
        LOOP
          L_CLOB := GET_DDL_TYPE_BODY(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
             L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.typ';
             L_CLOB := GET_DDL_TYPE_SPEC(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
             L_CLOB := L_CLOB || CHR(10) || '/' || CHR(10) || 
                       GET_DDL_TYPE_BODY(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
             L_CLOB := L_CLOB || CHR(10) || '/';
             SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
             L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                         'PROMPT Creating type ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                         'PROMPT =============' || CHR(10) ||
                                         'PROMPT' || CHR(10);
             L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/types/' || L_PATH || CHR(10);
          ELSE
             L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.tps';
             L_CLOB := GET_DDL_TYPE_SPEC(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
             L_CLOB := L_CLOB || CHR(10) || '/';
             IF (L_CLOB IS NOT NULL) THEN
               SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
               L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                           'PROMPT Creating type specification ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                           'PROMPT ===========================' || CHR(10) ||
                                           'PROMPT' || CHR(10);
               L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/types/' || L_PATH || CHR(10);
             END IF;
          END IF;
          L_CLOB := NULL;
        END LOOP;
        L_PATH := 'sql_types.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_types.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� types ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_TYPE;

  /*
    ���������� ���� ������� (FUNCTION) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.fnc
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_functions.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_FUNCTION(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('FUNCTION')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                            AND (O.OBJECT_NAME NOT LIKE 'TEST%' OR O.OBJECT_NAME NOT LIKE 'TST%')
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.fnc';
          L_CLOB := GET_DDL_FUNCTION(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating function ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT =================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/functions/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_functions.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_functions.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => 'DIRPATH_DEVFILETMP', P_CLOB => L_ALL_CLOB);
        RETURN '����� functions ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_FUNCTION;

  /*
    ���������� ���� �������� (PROCEDURE) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.fnc
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_procedures.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_PROCEDURE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = UPPER('PROCEDURE')
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                            AND (O.OBJECT_NAME NOT LIKE 'TEST%' OR O.OBJECT_NAME NOT LIKE 'MY%')
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.prc';
          L_CLOB := GET_DDL_PROCEDURE(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating procedure ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT ==================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/procedures/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_procedures.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_procedures.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� procedures ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_PROCEDURE;

  /*
    ���������� ���� ������� (PACKAGE) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.spc *.bdy
    ������������ ������� ALL_OBJECTS
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_packages.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_PACKAGE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT O.OBJECT_NAME,
                                O.OWNER
                           FROM ALL_OBJECTS O
                          WHERE UPPER(O.OBJECT_TYPE) = 'PACKAGE'
                            AND UPPER(O.OWNER) = UPPER(P_OWNER_NAME)
                            AND (O.OBJECT_NAME LIKE 'EL_%' OR O.OBJECT_NAME LIKE 'DEV%' OR O.OBJECT_NAME LIKE 'ADMINCONSOLE%')
                         ORDER BY O.OWNER, O.OBJECT_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.spc';
          L_CLOB := GET_DDL_PACKAGE_SPEC(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating package specification ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT ==============================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/packages/' || L_PATH || CHR(10);
          END IF;
	        L_PATH := LOWER(CUR_ROWS.OBJECT_NAME) || '.bdy';
          L_CLOB := GET_DDL_PACKAGE_BODY(CUR_ROWS.OBJECT_NAME, CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            L_CLOB := L_CLOB || CHR(10) || '/';
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating package body ' || UPPER(CUR_ROWS.OBJECT_NAME) || CHR(10) ||
                                        'PROMPT =====================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/packages/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_packages.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_packages.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� packages ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_PACKAGE;
  
  /*
    ���������� ���� �������� (INDEX) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.idx
    ������������ ������� ALL_TABLES
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_indexes.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_INDEX(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE); 
        DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.session_transform, 'SQLTERMINATOR', FALSE);
        DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.session_transform, 'PRETTY', FALSE);    
        FOR CUR_ROWS IN (SELECT T.OWNER,
                                 T.TABLE_NAME,
                                 T.IOT_NAME
                            FROM ALL_TABLES T
                           WHERE UPPER(T.OWNER) = UPPER(P_OWNER_NAME)
                             AND T.IOT_TYPE IS NULL 
                             AND ((T.TABLE_NAME LIKE 'DEV_%')
                                  OR (T.TABLE_NAME LIKE 'DSYS_%') 
                                  OR (T.TABLE_NAME LIKE 'ELSYS_%')
                                  OR (T.TABLE_NAME LIKE 'DOC_%') 
                                  OR (T.TABLE_NAME LIKE 'DIC_%')
                                  OR (T.TABLE_NAME LIKE 'XLRPT_%')
                                  OR (T.TABLE_NAME LIKE 'WEB_%')
                                  OR (T.TABLE_NAME LIKE 'LINK_%')
                                  OR (T.TABLE_NAME LIKE 'TMP%')
                                  OR (T.TABLE_NAME LIKE 'RTT_%')
                                  OR (T.TABLE_NAME LIKE 'REP_%')
                                  OR (T.TABLE_NAME LIKE 'REPORT_%')
                                  OR (T.TABLE_NAME LIKE 'REG_%')
                                  OR (T.TABLE_NAME LIKE 'PFLOG_%')
                                  OR (T.TABLE_NAME LIKE 'MV_%')
                                  OR (T.TABLE_NAME LIKE 'LOG_%')
                                  OR (T.TABLE_NAME LIKE 'KPK_%')
                                  OR (T.TABLE_NAME LIKE 'HERMES_%')
                                  OR (T.TABLE_NAME LIKE 'GPS_%')
                                  OR (T.TABLE_NAME LIKE 'GIS_%')
                                  OR (T.TABLE_NAME LIKE 'EL_%')
                                  OR (T.TABLE_NAME LIKE 'TEMP_%') 
                                  OR (T.TABLE_NAME LIKE 'TIMETABLE_WEEKDAY%')
                                  OR (T.TABLE_NAME LIKE 'RDF_DIC_PLACE%')
                                  OR (T.TABLE_NAME LIKE 'OFS_ITEMS%')
                                  OR (T.TABLE_NAME LIKE 'NN_XML_SETTINGS%')
                                  OR (T.TABLE_NAME LIKE 'CERBER_LOGS%')
                                  OR (T.TABLE_NAME LIKE 'DEBTS_PLAN_EXEC_CONTROL%'))
                          ORDER BY T.TABLE_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.idx'; 
          L_CLOB := GET_DDL_INDEX(CUR_ROWS.TABLE_NAME, P_OWNER_NAME => P_OWNER_NAME);
          IF (L_CLOB IS NOT NULL) THEN
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating index table ' || UPPER(CUR_ROWS.TABLE_NAME) || CHR(10) ||
                                        'PROMPT ====================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/indexes/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', TRUE);
        L_PATH := 'sql_indexes.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_indexes.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� indexes ���������!!!';    
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_INDEX;
  
  /*
    ���������� ���� ����������� (CONSTRAIN) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.cnstr
    ������������ ������� ALL_TABLES
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_constraints.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_CONSTRAIN(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT T.OWNER,
                                 T.TABLE_NAME,
                                 T.IOT_NAME
                            FROM ALL_TABLES T
                           WHERE T.OWNER = 'DISTRDEV'
                             AND T.IOT_TYPE IS NULL 
                             AND ((T.TABLE_NAME LIKE 'DEV_%')
                                  OR (T.TABLE_NAME LIKE 'DSYS_%') 
                                  OR (T.TABLE_NAME LIKE 'ELSYS_%')
                                  OR (T.TABLE_NAME LIKE 'DOC_%') 
                                  OR (T.TABLE_NAME LIKE 'DIC_%')
                                  OR (T.TABLE_NAME LIKE 'XLRPT_%')
                                  OR (T.TABLE_NAME LIKE 'WEB_%')
                                  OR (T.TABLE_NAME LIKE 'LINK_%')
                                  OR (T.TABLE_NAME LIKE 'TMP%')
                                  OR (T.TABLE_NAME LIKE 'RTT_%')
                                  OR (T.TABLE_NAME LIKE 'REP_%')
                                  OR (T.TABLE_NAME LIKE 'REPORT_%')
                                  OR (T.TABLE_NAME LIKE 'REG_%')
                                  OR (T.TABLE_NAME LIKE 'PFLOG_%')
                                  OR (T.TABLE_NAME LIKE 'MV_%')
                                  OR (T.TABLE_NAME LIKE 'LOG_%')
                                  OR (T.TABLE_NAME LIKE 'KPK_%')
                                  OR (T.TABLE_NAME LIKE 'HERMES_%')
                                  OR (T.TABLE_NAME LIKE 'GPS_%')
                                  OR (T.TABLE_NAME LIKE 'GIS_%')
                                  OR (T.TABLE_NAME LIKE 'EL_%')
                                  OR (T.TABLE_NAME LIKE 'TEMP_%') 
                                  OR (T.TABLE_NAME LIKE 'TIMETABLE_WEEKDAY%')
                                  OR (T.TABLE_NAME LIKE 'RDF_DIC_PLACE%')
                                  OR (T.TABLE_NAME LIKE 'OFS_ITEMS%')
                                  OR (T.TABLE_NAME LIKE 'NN_XML_SETTINGS%')
                                  OR (T.TABLE_NAME LIKE 'CERBER_LOGS%')
                                  OR (T.TABLE_NAME LIKE 'DEBTS_PLAN_EXEC_CONTROL%'))
                          ORDER BY T.TABLE_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.cnstr';      
          L_CLOB := GET_DDL_CONSTRAINT(P_TABLE_NAME => CUR_ROWS.TABLE_NAME, P_OWNER_NAME => P_OWNER_NAME);
          IF (L_CLOB IS NOT NULL) THEN
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating constraint table ' || UPPER(CUR_ROWS.TABLE_NAME) || CHR(10) ||
                                        'PROMPT =========================' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/constraints/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_constraints.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_constraints.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� constraints ���������!!!';        
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_CONSTRAIN;
  
  /*
    ���������� ���� ������ (TABLE) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ��� �������� ������������ ������� 
    �����: *.tab
    ������������ ������� ALL_TABLES
    ��� ����������� ������ ������������, ����� �������� � ���� � ����� �������, � ���� sql_tables.sql
    ���������: 
      P_DIRECTORY_NAME_ROOT - ���������� �������� ������
      P_DIRECTORY_NAME_SECOND - ���������� ������� ������ (����� �������� �������, �������� �� ���� �������)
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION LOADTOFILES_ALL_TABLE(P_DIRECTORY_NAME_ROOT IN VARCHAR2, P_DIRECTORY_NAME_SECOND IN VARCHAR2, P_OWNER_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_ALL_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);
  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME_ROOT, P_DIRECTORY_NAME_SECOND)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT T.OWNER,
                                 T.TABLE_NAME,
                                 T.IOT_NAME
                            FROM ALL_TABLES T
                           WHERE UPPER(T.OWNER) = UPPER(P_OWNER_NAME)
                             AND T.IOT_TYPE IS NULL 
                             AND ((T.TABLE_NAME LIKE 'DEV_%')
                                  OR (T.TABLE_NAME LIKE 'DSYS_%') 
                                  OR (T.TABLE_NAME LIKE 'ELSYS_%')
                                  OR (T.TABLE_NAME LIKE 'DOC_%') 
                                  OR (T.TABLE_NAME LIKE 'DIC_%')
                                  OR (T.TABLE_NAME LIKE 'XLRPT_%')
                                  OR (T.TABLE_NAME LIKE 'WEB_%')
                                  OR (T.TABLE_NAME LIKE 'LINK_%')
                                  OR (T.TABLE_NAME LIKE 'TMP%')
                                  OR (T.TABLE_NAME LIKE 'RTT_%')
                                  OR (T.TABLE_NAME LIKE 'REP_%')
                                  OR (T.TABLE_NAME LIKE 'REPORT_%')
                                  OR (T.TABLE_NAME LIKE 'REG_%')
                                  OR (T.TABLE_NAME LIKE 'PFLOG_%')
                                  OR (T.TABLE_NAME LIKE 'MV_%')
                                  OR (T.TABLE_NAME LIKE 'LOG_%')
                                  OR (T.TABLE_NAME LIKE 'KPK_%')
                                  OR (T.TABLE_NAME LIKE 'HERMES_%')
                                  OR (T.TABLE_NAME LIKE 'GPS_%')
                                  OR (T.TABLE_NAME LIKE 'GIS_%')
                                  OR (T.TABLE_NAME LIKE 'EL_%')
                                  OR (T.TABLE_NAME LIKE 'TEMP_%') 
                                  OR (T.TABLE_NAME LIKE 'TIMETABLE_WEEKDAY%')
                                  OR (T.TABLE_NAME LIKE 'RDF_DIC_PLACE%')
                                  OR (T.TABLE_NAME LIKE 'OFS_ITEMS%')
                                  OR (T.TABLE_NAME LIKE 'NN_XML_SETTINGS%')
                                  OR (T.TABLE_NAME LIKE 'CERBER_LOGS%')
                                  OR (T.TABLE_NAME LIKE 'DEBTS_PLAN_EXEC_CONTROL%'))
                          ORDER BY T.TABLE_NAME)
        LOOP
          L_PATH := LOWER(CUR_ROWS.TABLE_NAME) || '.tab';      
          L_CLOB := GET_DDL_TABLE(P_TABLE_NAME => CUR_ROWS.TABLE_NAME, P_OWNER_NAME => CUR_ROWS.OWNER);
          IF (L_CLOB IS NOT NULL) THEN
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB);
            L_ALL_CLOB := L_ALL_CLOB || 'PROMPT' || CHR(10) ||
                                        'PROMPT Creating table ' || UPPER(CUR_ROWS.TABLE_NAME) || CHR(10) ||
                                        'PROMPT ==============' || CHR(10) ||
                                        'PROMPT' || CHR(10);
            L_ALL_CLOB := L_ALL_CLOB || '@@$SQLPATH/tables/' || L_PATH || CHR(10);
          END IF;
        END LOOP;
        L_PATH := 'sql_tables.sql';
        L_ALL_CLOB := 'SET DEFINE OFF;' || CHR(10) || 'SPOOL $SQLPATH/logs/sql_tables.log;' || CHR(10)
                      || L_ALL_CLOB || 
                      'SPOOL OFF;';
        SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_ROOT, P_CLOB => L_ALL_CLOB);
        RETURN '����� tables ���������!!!';       
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_TABLE;
  
  /*
    ���������� ���� �������� (SQLQUERY) � ���� � ���������
    ������� ��������� ������ � ����, �������� ����� - ID ������� || '_q'
    �����: *.query
    ������������ ������� ELSYS_BO_QUERY
    ���������: 
      P_DIRECTORY_NAME - ���������� (����� �������� �������)
  */
  FUNCTION LOADTOFILES_ALL_SQLQUERY(P_DIRECTORY_NAME IN VARCHAR2) RETURN VARCHAR2 IS
    L_CLOB CLOB;
    L_DIR  VARCHAR2(4000);
    L_PATH VARCHAR(1000);

  BEGIN
    BEGIN  
      SELECT 'ALL_DIRECTORIES'
        INTO L_DIR
        FROM ALL_DIRECTORIES D
       WHERE DIRECTORY_NAME IN (P_DIRECTORY_NAME)
       GROUP BY 1;
    EXCEPTION
      WHEN OTHERS THEN
        L_DIR := '';
    END;
    IF (L_DIR IS NULL) THEN
      RETURN '������: �� ������ ���� � ALL_DIRECTORIES';
    ELSE
        FOR CUR_ROWS IN (SELECT A.ID,
                               A.SQLTEXT,
                               A.BOCLASS AS 
                          FROM ELSYS_BO_QUERY A
                         WHERE A.ID >= 1
                        ORDER BY A.ID)
        LOOP
          L_PATH := CUR_ROWS.ID || '_q' || '.query';      
          L_CLOB := GET_DML_SQLQUERY(CUR_ROWS.ID);
          IF (L_CLOB IS NOT NULL) THEN
             SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME, P_CLOB => L_CLOB);
          END IF;   
        END LOOP;      
        RETURN '����� querys ���������!!!';
    END IF;
    EXCEPTION
      WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_ALL_SQLQUERY;

  /*
    ���������� CLOB � BLOB ����� � ���� 
    ������� ��������� CLOB � BLOB � ���� "��� �������" || '_' || ID || '.dat'
    ������������ SQL*Loader
    �����: *.dat
    ���������: 
      P_QUERY - ������, ������: "SELECT * FROM TABLE_NAME T"
      P_TABLE_NAME - �������� �������
      P_DIRECTORY_NAME_SECOND - ���������� (����� �������� �������)
  */
  FUNCTION LOADTOFILES_CLOB_BLOB_OFQUERY(P_QUERY                 IN VARCHAR2,
                                         P_TABLE_NAME            IN VARCHAR2,
                                         P_DIRECTORY_NAME_SECOND IN VARCHAR2) RETURN VARCHAR2 AS
  V_THECURSOR  PLS_INTEGER;
  V_STATUS     PLS_INTEGER;
  V_COLCNT     NUMBER DEFAULT 0;
  V_DESCTAB    DBMS_SQL.DESC_TAB;
  V_DATA_ID    NUMBER(12) := NULL;
  L_PATH       VARCHAR(1000);
  NL           VARCHAR2(2) := CHR(13) || CHR(10);
  L_VARCHAR2_COL       VARCHAR2(32767); 
  L_NUMBER_COL         NUMBER;          
  L_DATE_COL           DATE;            
  L_CHAR_COL           CHAR(2000);      
  L_BINARY_FLOAT_COL   BINARY_FLOAT;    
  L_BINARY_DOUBLE_COL  BINARY_DOUBLE;   
  L_CLOB_COL           CLOB;            
  L_BLOB_COL           BLOB;
  L_TIMESTAMP_COL      TIMESTAMP(9);   
  L_TIMESTAMP_WTZ_COL  TIMESTAMP(9) WITH TIME ZONE;  
  L_TIMESTAMP_WLTZ_COL TIMESTAMP WITH LOCAL TIME ZONE;
  BEGIN
    V_THECURSOR := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(V_THECURSOR, P_QUERY, DBMS_SQL.NATIVE);
    DBMS_SQL.DESCRIBE_COLUMNS(V_THECURSOR, V_COLCNT, V_DESCTAB);
    
    FOR I IN 1..V_DESCTAB.COUNT
    LOOP
      IF V_DESCTAB(I).COL_TYPE = DBMS_SQL.VARCHAR2_TYPE THEN --VARCHAR2
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_VARCHAR2_COL, V_DESCTAB(I).COL_MAX_LEN); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.NUMBER_TYPE THEN --NUMBER
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_NUMBER_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.DATE_TYPE THEN --DATE
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_DATE_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_FLOAT_TYPE THEN --BINARY_FLOAT
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BINARY_FLOAT_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_BOUBLE_TYPE THEN --BINARY_DOUBLE
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BINARY_DOUBLE_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CHAR_TYPE THEN  --CHAR
        DBMS_SQL.DEFINE_COLUMN_CHAR(V_THECURSOR, I, L_CHAR_COL, V_DESCTAB(I).COL_MAX_LEN); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CLOB_TYPE THEN --CLOB
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_CLOB_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BLOB_TYPE THEN --BLOB
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BLOB_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_TYPE THEN --TIMESTAMP
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_TZ_TYPE THEN --TIMESTAMP WITH TIME ZONE
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_WTZ_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_LOCAL_TZ_TYPE THEN --TIMESTAMP WITH LOCAL TIME ZONE
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_WLTZ_COL); 
      ELSE
        RAISE_APPLICATION_ERROR(-20001, 'COLUMN: '||V_DESCTAB(I).COL_NAME || NL ||
                                        'TYPE NOT SUPPORTED: '||V_DESCTAB(I).COL_TYPE);
        --NOT SUPPORTED
      END IF;
    END LOOP;
    V_STATUS := DBMS_SQL.EXECUTE(V_THECURSOR);
    IF (V_STATUS = 0) THEN
      WHILE (DBMS_SQL.FETCH_ROWS(V_THECURSOR) > 0)
      LOOP  
        FOR I IN 1 .. V_DESCTAB.COUNT LOOP
          IF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CLOB_TYPE THEN --CLOB
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_CLOB_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BLOB_TYPE THEN --BLOB
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_BLOB_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.NUMBER_TYPE THEN --NUMBER
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_NUMBER_COL); 
          END IF;
          IF (UPPER(V_DESCTAB(I).COL_NAME) IN ('ID', 'XLR_TEMPLATE_ID')) THEN
            V_DATA_ID := L_NUMBER_COL;
          END IF;
        END LOOP;
        IF (V_DATA_ID IS NOT NULL) THEN
          L_PATH := LOWER(P_TABLE_NAME) || '_' || TO_CHAR(V_DATA_ID) || '.dat';
          IF (L_CLOB_COL IS NOT NULL) THEN
            SAVE_CLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_CLOB => L_CLOB_COL); 
            L_CLOB_COL := NULL;
          END IF;
          IF (L_BLOB_COL IS NOT NULL) THEN
            SAVE_BLOBTOFILE(P_FILENAME => L_PATH, P_DIRECTORY_NAME => P_DIRECTORY_NAME_SECOND, P_BLOB => L_BLOB_COL);
            L_BLOB_COL := NULL;
          END IF;  
        END IF;       
      END LOOP;
    END IF;  
    DBMS_SQL.CLOSE_CURSOR(V_THECURSOR);

    RETURN '����� *.dat ������� ' || UPPER(P_TABLE_NAME) || ' ���������!!!';  
  EXCEPTION WHEN OTHERS THEN RETURN SQLERRM;
  END LOADTOFILES_CLOB_BLOB_OFQUERY;
  
  /*
    �������� ����� ������� �� ���� ������
    ������������ ������� ELSYS_BO_QUERY
    ���������: 
      P_BO_QUERY_ID - ID �������
  */
  FUNCTION GET_DML_SQLQUERY(P_BO_QUERY_ID NUMBER) RETURN CLOB AS
  RESULT CLOB;
  V_SQLTEXT CLOB;
  V_SQL_COMMENT CLOB;
  V_CHAR_COMMENT VARCHAR2(50);
  BEGIN
    RESULT := '';     
    BEGIN
      SELECT 
             A.SQLTEXT,
             A.BOCLASS
        INTO V_SQLTEXT, V_SQL_COMMENT     
        FROM ELSYS_BO_QUERY A
       WHERE A.ID = P_BO_QUERY_ID;
    
    V_CHAR_COMMENT := DBMS_LOB.SUBSTR(V_SQLTEXT, 10, 1);  
    IF (INSTR(V_CHAR_COMMENT, '--') > 0) THEN
       RESULT := CONVERT(V_SQLTEXT, 'CL8MSWIN1251'); 
    ELSE   
       RESULT := '-- ' || CONVERT(V_SQL_COMMENT, 'CL8MSWIN1251') || CHR(13) || CONVERT(V_SQLTEXT, 'CL8MSWIN1251');
    END IF;
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DML_SQLQUERY;
  
  /*
    �������� ����� DDL ������������������
    ������������ ������� ALL_SEQUENCES
    ���������: 
      P_SEQUENCE_NAME - ��� ������������������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_SEQUENCE(P_SEQUENCE_NAME VARCHAR2, 
                            P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  V_SQLTEXT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      SELECT 'CREATE SEQUENCE ' || S.SEQUENCE_NAME || CHR(10) ||
             'MINVALUE ' || S.INCREMENT_BY || CHR(10) || 
             'MAXVALUE ' || S.MAX_VALUE || CHR(10) || 
             'START WITH ' || S.INCREMENT_BY || CHR(10) || 
             'INCREMENT BY ' || S.INCREMENT_BY || CHR(10) || 
             DECODE(S.CYCLE_FLAG, 'N', 'NOCYCLE ', 'CYCLE ') || CHR(10) ||
             DECODE(S.CACHE_SIZE, 0, 'NOCACHE ', 'CACHE ' || S.CACHE_SIZE)
       INTO V_SQLTEXT       
       FROM ALL_SEQUENCES S
      WHERE UPPER(S.SEQUENCE_NAME) = UPPER(P_SEQUENCE_NAME)
        AND UPPER(S.SEQUENCE_OWNER) = UPPER(P_OWNER_NAME);     
     
      RESULT := V_SQLTEXT;
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_SEQUENCE;

  /*
    �������� ����� DDL ������������������ �������������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_MVIEW_NAME - ��� ������������������ �������������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_MVIEW(P_MVIEW_NAME VARCHAR2, 
                         P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('MATERIALIZED_VIEW', P_MVIEW_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_MVIEW;

  /*
    �������� ����� DDL �������������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_VIEW_NAME - ��� �������������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_VIEW(P_VIEW_NAME VARCHAR2, 
                        P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('VIEW', P_VIEW_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_VIEW;

  /*
    �������� ����� DDL ���������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TRIGGER_NAME - ��� ���������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_TRIGGER(P_TRIGGER_NAME VARCHAR2, 
                           P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('TRIGGER', P_TRIGGER_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_TRIGGER;

  /*
    �������� ����� DDL ��� ������������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TYPE_NAME - ��� ����
      P_OWNER_NAME - ������������ ���������
  */  
  FUNCTION GET_DDL_TYPE_SPEC(P_TYPE_NAME VARCHAR2, 
                             P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('TYPE_SPEC', P_TYPE_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_TYPE_SPEC;

  /*
    �������� ����� DDL ���� ����
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TYPE_NAME - ��� ����
      P_OWNER_NAME - ������������ ���������
  */ 
  FUNCTION GET_DDL_TYPE_BODY(P_TYPE_NAME VARCHAR2, 
                             P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('TYPE_BODY', P_TYPE_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_TYPE_BODY;

  /*
    �������� ����� DDL �������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_FUNCTION_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */ 
  FUNCTION GET_DDL_FUNCTION(P_FUNCTION_NAME VARCHAR2, 
                            P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('FUNCTION', P_FUNCTION_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_FUNCTION;

  /*
    �������� ����� DDL ���������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_PROCEDURE_NAME - ��� ���������
      P_OWNER_NAME - ������������ ���������
  */ 
  FUNCTION GET_DDL_PROCEDURE(P_PROCEDURE_NAME VARCHAR2, 
                             P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('PROCEDURE', P_PROCEDURE_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_PROCEDURE;

  /*
    �������� ����� DDL ������������ ������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_PACKAGE_NAME - ��� ������
      P_OWNER_NAME - ������������ ���������
  */ 
  FUNCTION GET_DDL_PACKAGE_SPEC(P_PACKAGE_NAME VARCHAR2, 
                                P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('PACKAGE_SPEC', P_PACKAGE_NAME, P_OWNER_NAME);
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_PACKAGE_SPEC;

  /*
    �������� ����� DDL ���� ������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_PACKAGE_NAME - ��� ������
      P_OWNER_NAME - ������������ ���������
  */ 
  FUNCTION GET_DDL_PACKAGE_BODY(P_PACKAGE_NAME VARCHAR2, 
                                P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
      RESULT := DBMS_METADATA.GET_DDL('PACKAGE_BODY', P_PACKAGE_NAME, P_OWNER_NAME);                
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_PACKAGE_BODY;

  /*
    �������� ����� DDL �������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_INDEX(P_TABLE_NAME VARCHAR2,
                         P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);

    FOR CUR_ROWS IN (SELECT DBMS_METADATA.GET_DDL('INDEX', IDX.INDEX_NAME, IDX.OWNER) AS SQL_TEXT
                       FROM ALL_INDEXES IDX
                      WHERE UPPER(IDX.TABLE_NAME) = UPPER(P_TABLE_NAME)
                        AND IDX.UNIQUENESS IN ('NONUNIQUE'))
    LOOP 
       RESULT := RESULT || REPLACE(REPLACE(CUR_ROWS.SQL_TEXT, ';', CHR(10) || '/'), '"' || P_OWNER_NAME || '".', '');  
    END LOOP;   
    RESULT := RESULT;

    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_INDEX; 

  /*
    �������� ����� DDL �����������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_CONSTRAINT(P_TABLE_NAME VARCHAR2, 
                              P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  L_SQL_TEXT CLOB;
  BEGIN
    RESULT := '';     
    BEGIN 
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', TRUE);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);  

    SELECT DBMS_METADATA.GET_DEPENDENT_DDL('REF_CONSTRAINT', T.TABLE_NAME, T.OWNER) 
      INTO L_SQL_TEXT
      FROM ALL_TABLES T
     WHERE UPPER(T.TABLE_NAME) = UPPER(P_TABLE_NAME)
       AND UPPER(T.OWNER) = UPPER(P_OWNER_NAME) 
       AND EXISTS (SELECT 1
                    FROM ALL_CONSTRAINTS
                   WHERE TABLE_NAME = T.TABLE_NAME
                     AND CONSTRAINT_TYPE = 'R');
    RESULT := REPLACE(REPLACE(L_SQL_TEXT, ';', CHR(10) || '/'), '"' || P_OWNER_NAME || '".', ''); 
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_CONSTRAINT; 

  /*
    �������� ����� DDL �������
    ������������ ����� DBMS_METADATA
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DDL_TABLE(P_TABLE_NAME VARCHAR2, 
                         P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  L_SQL_TEXT CLOB; 
  BEGIN
    RESULT := '';     
    BEGIN
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', TRUE);
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', TRUE);
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'CONSTRAINTS_AS_ALTER', TRUE);
      DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'REF_CONSTRAINTS', FALSE);

      SELECT DBMS_METADATA.GET_DDL('TABLE', T.TABLE_NAME, T.OWNER) 
        INTO L_SQL_TEXT
        FROM ALL_TABLES T
       WHERE UPPER(T.OWNER)      = UPPER(P_OWNER_NAME)
         AND UPPER(T.TABLE_NAME) = UPPER(P_TABLE_NAME);

      RESULT := RESULT || REPLACE(REPLACE(L_SQL_TEXT, ';', CHR(10) || '/'), '"' || P_OWNER_NAME || '".', '') || CHR(10); 
   
      FOR ROW_TAB_COMMENT IN (SELECT A.TABLE_NAME, A.COMMENTS, 'COMMENT ON TABLE ' || A.TABLE_NAME || ' IS ''' || A.COMMENTS || '''' || CHR(10) || '/' || CHR(10) AS TEXT 
                              FROM ALL_TAB_COMMENTS A
                              WHERE A.TABLE_NAME = UPPER(P_TABLE_NAME) AND A.OWNER = UPPER(P_OWNER_NAME))
      LOOP
        RESULT := RESULT || ROW_TAB_COMMENT.TEXT;  
      END LOOP;

      FOR ROW_TABCOL_COMMENT IN (SELECT A.COLUMN_NAME, A.COMMENTS,  
                                 'COMMENT ON COLUMN "' || A.TABLE_NAME|| '"."' || A.COLUMN_NAME || '" IS ''' || REPLACE(REPLACE(A.COMMENTS, '''', '"'), '''''') || '''' || CHR(10) || '/' || CHR(10) AS TEXT
                                  FROM USER_COL_COMMENTS A
                                 WHERE A.TABLE_NAME = UPPER(P_TABLE_NAME)
                                 ORDER BY A.COLUMN_NAME)
      LOOP
        RESULT := RESULT || ROW_TABCOL_COMMENT.TEXT;  
      END LOOP;

    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RETURN(RESULT);
  END GET_DDL_TABLE; 

  /*
    �������� ����� DML INSERT �������
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DML_TABLE(P_TABLE_NAME VARCHAR2, 
                         P_OWNER_NAME VARCHAR2) RETURN CLOB AS
  RESULT CLOB;
  TYPE TYPE_SCRIPT_DATA IS RECORD (TEXT VARCHAR2(8000));
  TYPE TYPCUR_DATA  IS REF CURSOR;
  V_CURTYP_DATA TYPCUR_DATA;
  V_REC_SCRIPT_DATA TYPE_SCRIPT_DATA;
  V_PLSQL_BLOCK VARCHAR2(2000);
  V_I NUMBER := 0;
  BEGIN
    RESULT := '';     
    BEGIN
       V_PLSQL_BLOCK := GET_DML_INSSCRIPT(P_TABLE_NAME, P_OWNER_NAME);
       OPEN V_CURTYP_DATA FOR V_PLSQL_BLOCK;
       LOOP
            FETCH V_CURTYP_DATA INTO V_REC_SCRIPT_DATA;
            RESULT := RESULT || V_REC_SCRIPT_DATA.TEXT;
            IF (V_I = 100) THEN
               RESULT := RESULT || 'COMMIT;' || CHR(13);
               V_I := 0;
            END IF;
            V_I := V_I + 1;
            EXIT WHEN V_CURTYP_DATA%NOTFOUND;
       END LOOP;
       CLOSE V_CURTYP_DATA;
    EXCEPTION WHEN OTHERS THEN RESULT := '';
    END;
    RESULT := RESULT || 'COMMIT;';
    RETURN(RESULT);
  END GET_DML_TABLE; 

  /*
    �������� ����� SELECT INSERT �������
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_DML_INSSCRIPT(P_TABLE_NAME VARCHAR2, 
                             P_OWNER_NAME VARCHAR2) RETURN CLOB AS
    V_FOUND BOOLEAN := FALSE;
    V_VARCHARA CLOB;
    V_VARCHARB CLOB;
    V_VARCHARC CLOB;
  BEGIN
    FOR TAB_REC IN (SELECT T.TABLE_NAME
                      FROM ALL_TABLES T
                     WHERE T.TABLE_NAME = UPPER(P_TABLE_NAME)
                       AND T.OWNER = UPPER(P_OWNER_NAME))
    LOOP
      V_FOUND := TRUE;
      V_VARCHARA := 'SELECT ''INSERT INTO ' || TAB_REC.TABLE_NAME || '(';
    
      FOR COL_REC IN (SELECT A.COLUMN_ID,
                             A.COLUMN_NAME,
                             A.DATA_TYPE
                        FROM ALL_TAB_COLUMNS A
                       WHERE A.TABLE_NAME = TAB_REC.TABLE_NAME
                         AND A.OWNER = UPPER(P_OWNER_NAME)    
                       ORDER BY A.COLUMN_ID) 
      LOOP
        IF COL_REC.COLUMN_ID = 1 THEN
          V_VARCHARA := V_VARCHARA || '';
        ELSE
          V_VARCHARA := V_VARCHARA || ',';
          V_VARCHARB := V_VARCHARB || ',';
        END IF;
      
        V_VARCHARA := V_VARCHARA || COL_REC.COLUMN_NAME;

        IF (INSTR(COL_REC.DATA_TYPE, 'VARCHAR2') > 0) THEN
          V_VARCHARC := '''Q''''' || CHR(14) || ''' || ' || COL_REC.COLUMN_NAME || ' || ''' || CHR(14) || '''''''';
        ELSIF (INSTR(COL_REC.DATA_TYPE, 'DATE') > 0) THEN
          V_VARCHARC := '''TO_DATE('''''' || TO_CHAR(' || COL_REC.COLUMN_NAME || ', ''DD.MM.YYYY'') || '''''', ''''DD.MM.YYYY'''')''';
        ELSE
          V_VARCHARC := COL_REC.COLUMN_NAME;
        END IF;
        V_VARCHARB := V_VARCHARB || ''' ||  DECODE(' || COL_REC.COLUMN_NAME || ', NULL, ''NULL'', ' || V_VARCHARC || ') || ''';
      END LOOP;
      V_VARCHARA := V_VARCHARA || ') VALUES(' || V_VARCHARB || ') / ' || CHR(13) || ''' AS TEXT FROM ' || TAB_REC.TABLE_NAME;
    END LOOP;

    IF (NOT V_FOUND) THEN
      V_VARCHARA := 'TABLE ' || P_TABLE_NAME || ' NOT FOUND';
    END IF;

    RETURN(V_VARCHARA);
  END GET_DML_INSSCRIPT;

  /*
    �������� ����� CTL ���� �������
    ��� SQL*Loader
    ������������ ������� ALL_TABLES � ALL_TAB_COLUMNS
    ���������: 
      P_TABLE_NAME - ��� �������
      P_OWNER_NAME - ������������ ���������
  */
  FUNCTION GET_CTL_FILE_SCRIPT(P_TABLE_NAME VARCHAR2, 
                               P_OWNER_NAME VARCHAR2) RETURN CLOB AS
    V_FOUND BOOLEAN := FALSE;
    V_VARCHARA CLOB;
    V_VARCHARB CLOB;
    V_VARCHARC CLOB;
  BEGIN
    FOR TAB_REC IN (SELECT T.TABLE_NAME
                      FROM ALL_TABLES T
                    WHERE T.TABLE_NAME = UPPER(P_TABLE_NAME)
                      AND T.OWNER = UPPER(P_OWNER_NAME))
    LOOP
      V_FOUND := TRUE;
      V_VARCHARA := /*'OPTIONS (SKIP=1, ERRORS=100, SILENT=(FEEDBACK))' || CHR(10)
                    || */'LOAD DATA' || CHR(10)
                    || 'INFILE ''' || LOWER(TAB_REC.TABLE_NAME) || '.ldr'' "str ''{EOL}''"' || CHR(10)
                    || 'BADFILE ''' || LOWER(TAB_REC.TABLE_NAME) || '.bad''' || CHR(10)
                    || 'DISCARDFILE ''' || LOWER(TAB_REC.TABLE_NAME) || '.dsc''' || CHR(10)
                    || 'DISCARDMAX 1' || CHR(10)
                    || 'INTO TABLE "' || TAB_REC.TABLE_NAME || '"' || CHR(10)
                    || 'APPEND' || CHR(10) -- TRUNCATE ???
                    || 'FIELDS TERMINATED BY ";"' || CHR(10)
                    || 'OPTIONALLY ENCLOSED BY ''"'' AND ''"''' || CHR(10)
                    || 'TRAILING NULLCOLS' || CHR(10)
                    || '(' || CHR(10);
    
      FOR COL_REC IN (SELECT A.COLUMN_ID,
                             A.COLUMN_NAME,
                             A.DATA_TYPE,
                             A.DATA_LENGTH
                        FROM ALL_TAB_COLUMNS A
                       WHERE A.TABLE_NAME = TAB_REC.TABLE_NAME
                       ORDER BY COLUMN_ID) 
      LOOP
        IF COL_REC.COLUMN_ID = 1 THEN
          V_VARCHARB := '  ';
        ELSE
          V_VARCHARB := ' ,';
        END IF;
        IF (INSTR(COL_REC.DATA_TYPE, 'DATE') > 0) THEN
          V_VARCHARB := V_VARCHARB || '"' || COL_REC.COLUMN_NAME || '" ' || COL_REC.DATA_TYPE || ' "DD.MM.YYYY"' || CHR(10);
        ELSIF  (INSTR(COL_REC.DATA_TYPE, 'BLOB') > 0) THEN
          V_VARCHARB := V_VARCHARB || 'L_0 FILLER CHAR' || CHR(10);
          V_VARCHARB := V_VARCHARB || ' ,"' || COL_REC.COLUMN_NAME || ' LOBFILE(L_0) TERMINATED BY EOF NULLIF L_0 = ''NULL''' || CHR(10);
        ELSIF (INSTR(COL_REC.DATA_TYPE, 'CLOB') > 0) THEN
          V_VARCHARB := V_VARCHARB || 'L_0 FILLER CHAR' || CHR(10);
          V_VARCHARB := V_VARCHARB || ' ,"' || COL_REC.COLUMN_NAME || ' LOBFILE(L_0) TERMINATED BY EOF NULLIF L_0 = ''NULL''' || CHR(10);
        ELSIF  (INSTR(COL_REC.DATA_TYPE, 'NUMBER') > 0) OR (INSTR(COL_REC.DATA_TYPE, 'FLOAT') > 0) THEN
          V_VARCHARB := V_VARCHARB || '"' || COL_REC.COLUMN_NAME || '" ' || ' DECIMAL EXTERNAL ' || CHR(10);
        ELSIF  (INSTR(COL_REC.DATA_TYPE, 'TIMESTAMP') > 0) THEN
          V_VARCHARB := V_VARCHARB || '"' || COL_REC.COLUMN_NAME || '" ' || COL_REC.DATA_TYPE || ' "DD.MM.YYY HH24:MI:SS.FF"' || CHR(10);
        ELSIF  (INSTR(COL_REC.DATA_TYPE, 'VARCHAR2') > 0) THEN
          V_VARCHARB := V_VARCHARB || '"' || COL_REC.COLUMN_NAME || '" CHAR(' || COL_REC.DATA_LENGTH || ')' || CHR(10);
        ELSE
          V_VARCHARB := V_VARCHARB || '"' || COL_REC.COLUMN_NAME || '" ' || CHR(10);
        END IF;
        
        V_VARCHARC := V_VARCHARC || V_VARCHARB;
      END LOOP;
    
      V_VARCHARA := V_VARCHARA || V_VARCHARC || ')' || CHR(10);
    END LOOP;

    IF NOT V_FOUND THEN
      V_VARCHARA := 'TABLE ' || P_TABLE_NAME || ' NOT FOUND';
    END IF;

    RETURN(V_VARCHARA);
  END GET_CTL_FILE_SCRIPT;

  /*
    �������� ����� DAT ���� �������
    ��� SQL*Loader
    ���������: 
      P_QUERY - ������     
      P_TABLE_NAME - ��� �������
      P_SEPARATOR - �����������
      P_OWNER_NAME - ������������ ���������
      P_LINE_TERMINATOR - ����������� ������
  */
  FUNCTION GET_DAT_FILE_QUERY(P_QUERY           IN VARCHAR2,
                              P_TABLE_NAME      IN VARCHAR2,
                              P_SEPARATOR       IN VARCHAR2 DEFAULT ';',
                              P_LINE_TERMINATOR IN VARCHAR2 DEFAULT '{EOL}') RETURN CLOB AS
    RESULT CLOB;
    V_THECURSOR   PLS_INTEGER;
    V_STATUS      PLS_INTEGER;
    V_COLCNT      NUMBER DEFAULT 0;
    V_DESCTAB     DBMS_SQL.DESC_TAB;
    V_SEPARATOR   VARCHAR2(10) DEFAULT '';
    V_ROWSDATA    VARCHAR2(32000);
    NL            VARCHAR2(2) := CHR(13)||CHR(10);
    V_DATA_ID     NUMBER(12);

    L_VARCHAR2_COL       VARCHAR2(32767); 
    L_NUMBER_COL         NUMBER;          
    L_DATE_COL           DATE;            
    L_CHAR_COL           CHAR(2000);      
    L_BINARY_FLOAT_COL   BINARY_FLOAT;    
    L_BINARY_DOUBLE_COL  BINARY_DOUBLE;   
    L_CLOB_COL           CLOB;            
    L_BLOB_COL           BLOB;
    L_TIMESTAMP_COL      TIMESTAMP(9);   
    L_TIMESTAMP_WTZ_COL  TIMESTAMP(9) WITH TIME ZONE;  
    L_TIMESTAMP_WLTZ_COL TIMESTAMP WITH LOCAL TIME ZONE;
  BEGIN
    V_THECURSOR := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(V_THECURSOR, P_QUERY, DBMS_SQL.NATIVE);
    DBMS_SQL.DESCRIBE_COLUMNS(V_THECURSOR, V_COLCNT, V_DESCTAB);
    
    FOR I IN 1..V_DESCTAB.COUNT
    LOOP
      IF V_DESCTAB(I).COL_TYPE = DBMS_SQL.VARCHAR2_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_VARCHAR2_COL, V_DESCTAB(I).COL_MAX_LEN); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.NUMBER_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_NUMBER_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.DATE_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_DATE_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_FLOAT_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BINARY_FLOAT_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_BOUBLE_TYPE THEN 
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BINARY_DOUBLE_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CHAR_TYPE THEN  
        DBMS_SQL.DEFINE_COLUMN_CHAR(V_THECURSOR, I, L_CHAR_COL, V_DESCTAB(I).COL_MAX_LEN); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CLOB_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_CLOB_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BLOB_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_BLOB_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_TZ_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_WTZ_COL); 
      ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_LOCAL_TZ_TYPE THEN
        DBMS_SQL.DEFINE_COLUMN(V_THECURSOR, I, L_TIMESTAMP_WLTZ_COL); 
      ELSE
        RAISE_APPLICATION_ERROR(-20001, 'COLUMN: '||V_DESCTAB(I).COL_NAME || NL ||
                                        'TYPE NOT SUPPORTED: '||V_DESCTAB(I).COL_TYPE);
      END IF;
    END LOOP;

    V_STATUS := DBMS_SQL.EXECUTE(V_THECURSOR);
    IF (V_STATUS = 0) THEN
      WHILE (DBMS_SQL.FETCH_ROWS(V_THECURSOR) > 0)
      LOOP  
        V_SEPARATOR := '';
        V_ROWSDATA := '';
        FOR I IN 1 .. V_DESCTAB.COUNT LOOP
          IF V_DESCTAB(I).COL_TYPE = DBMS_SQL.VARCHAR2_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_VARCHAR2_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.NUMBER_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_NUMBER_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.DATE_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_DATE_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_FLOAT_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_BINARY_FLOAT_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BINARY_BOUBLE_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_BINARY_DOUBLE_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CHAR_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_CHAR_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.CLOB_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_CLOB_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.BLOB_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_BLOB_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_TIMESTAMP_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_TZ_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_TIMESTAMP_WTZ_COL); 
          ELSIF V_DESCTAB(I).COL_TYPE = DBMS_SQL.TIMESTAMP_WITH_LOCAL_TZ_TYPE THEN
            DBMS_SQL.COLUMN_VALUE(V_THECURSOR, I, L_TIMESTAMP_WLTZ_COL); 
          END IF;
             
          IF (UPPER(V_DESCTAB(I).COL_NAME) IN ('ID', 'XLR_TEMPLATE_ID')) THEN
            V_DATA_ID := L_NUMBER_COL;
          END IF;
          IF (V_DESCTAB(I).COL_TYPE = DBMS_SQL.DATE_TYPE) THEN 
            V_ROWSDATA := V_ROWSDATA || (V_SEPARATOR || NVL(TO_CHAR(L_DATE_COL, 'DD.MM.YYYY HH24:MI:SS'), ''));
          ELSIF (V_DESCTAB(I).COL_TYPE = DBMS_SQL.VARCHAR2_TYPE) THEN 
            V_ROWSDATA := V_ROWSDATA || (V_SEPARATOR || '"' || L_VARCHAR2_COL || '"');
          ELSIF (V_DESCTAB(I).COL_TYPE = DBMS_SQL.CLOB_TYPE) OR (V_DESCTAB(I).COL_TYPE = DBMS_SQL.BLOB_TYPE) THEN
            V_ROWSDATA := V_ROWSDATA || (V_SEPARATOR || LOWER(P_TABLE_NAME) || '_' || TO_CHAR(V_DATA_ID) || '.dat');
          ELSIF (V_DESCTAB(I).COL_TYPE = DBMS_SQL.NUMBER_TYPE) THEN
            V_ROWSDATA := V_ROWSDATA || (V_SEPARATOR || NVL(REPLACE(L_NUMBER_COL, ',', '.'), ''));
          END IF;
          V_SEPARATOR := P_SEPARATOR;
         END LOOP;
         RESULT := RESULT || V_ROWSDATA || P_LINE_TERMINATOR; 
      END LOOP;
    END IF;  
    DBMS_SQL.CLOSE_CURSOR(V_THECURSOR);
    RETURN(RESULT);
  EXCEPTION WHEN OTHERS THEN RETURN SQLERRM;
  END GET_DAT_FILE_QUERY;

END DEV_SNAPSHOT_DB_OBJECTS;
/
