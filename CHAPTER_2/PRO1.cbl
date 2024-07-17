       IDENTIFICATION   DIVISION.
       PROGRAM-ID.      PRO1.
       DATA             DIVISION.
       WORKING-STORAGE  SECTION.
       01 TEST-TARGET.
          05 TEST-1    PIC X(5).
          05 TEST-2    PIC X(10).
          05 TEST-3    PIC N(5).
       01 STR      PIC X(2)  VALUE "ZX".
       01 D-COUNT.
      *ゼロで初期化。何度も使用する場合はそのたび初期化します。
          05 COUNT-1    PIC 9     VALUE ZERO.
          05 COUNT-2    PIC 9     VALUE ZERO.
          05 COUNT-3    PIC 9     VALUE ZERO.
          05 COUNT-4    PIC 9     VALUE ZERO.
          05 COUNT-5    PIC 9     VALUE ZERO.
          05 COUNT-6    PIC 9     VALUE ZERO.
          05 COUNT-7    PIC 9     VALUE ZERO.
          05 COUNT-8    PIC 9     VALUE ZERO.
          05 COUNT-9    PIC 9     VALUE ZERO.
          05 COUNT-10   PIC 9     VALUE ZERO.
       PROCEDURE        DIVISION.
       開始             SECTION.
       D-COUNTを取得.
      *CHARACTERS指定
           MOVE "PC" TO TEST-1.
           INSPECT TEST-1 TALLYING COUNT-1 FOR CHARACTERS.
      *BEFORE指定
           MOVE "XYZ" TO TEST-1.
           INSPECT TEST-1 TALLYING COUNT-2 FOR CHARACTERS BEFORE "Z".
      *AFTER指定
           INSPECT TEST-1 TALLYING COUNT-3 FOR CHARACTERS AFTER "XY".
      *単独のALL指定、複数のALL指定(「,」は任意記述)
           MOVE "XYZXY" TO TEST-1.
           INSPECT TEST-1 TALLYING COUNT-4 FOR ALL "XY".
           INSPECT TEST-1 TALLYING COUNT-5 FOR ALL "XY", ALL STR.
      *LEADING指定
           MOVE "ABABCABABC" TO TEST-2.
           INSPECT TEST-2 TALLYING COUNT-6 FOR LEADING "AB".
      *複数のFOR指定
           INSPECT TEST-2 TALLYING
              COUNT-7 FOR ALL "ABC"
              COUNT-8 FOR LEADING "AB"
              COUNT-9 FOR CHARACTERS.
      *日本語のD-COUNT
           MOVE N"日本語TEST-" TO TEST-3.
           INSPECT TEST-3 TALLYING COUNT-10 FOR ALL N"TEST-".
       画面表示.
      *COUNT-1→5、COUNT-2→2、COUNT-3→3、COUNT-4→2、COUNT-5→2、COUNT-6→2、
      *COUNT-7→2、COUNT-8→1、COUNT-9→2、COUNT-10→1
           DISPLAY COUNT-1.
           DISPLAY COUNT-2.
           DISPLAY COUNT-3.
           DISPLAY COUNT-4.
           DISPLAY COUNT-5.
           DISPLAY COUNT-6.
           DISPLAY COUNT-7.
           DISPLAY COUNT-8.
           DISPLAY COUNT-9.
           DISPLAY COUNT-10.
       プログラム終了.
           STOP RUN.
