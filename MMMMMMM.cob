000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID.    MMMMMMM.
000300*
000400 ENVIRONMENT DIVISION.
000500 DATA DIVISION.
000600 WORKING-STORAGE SECTION.
000700     COPY MYCOPY013.
000800     EXEC SQL INCLUDE SQLCA END-EXEC.
000900*
001000 01  WS-DATA.
001100     05  WS-PRODUCT-ID  PIC 9(5).
001200     05  WS-DESCRIPTION PIC X(40).
001300     05  WS-PRICE       PIC 9(5)V99.
001400*
001500 PROCEDURE DIVISION.
001600     PERFORM INIT
001700     PERFORM QUERY-PRODUCT
001900     PERFORM DISPLAY-RESULT
002000     PERFORM EXIT-ROUTINE
002100     EXEC CICS RETURN END-EXEC.
002200*
002300 INIT.
002400     MOVE ZEROS TO WS-PRODUCT-ID WS-PRICE.
002500*
002600 QUERY-PRODUCT.
002700     EXEC SQL
002800         SELECT PRODUCT_ID, DESCRIPTION, PRICE
002900         INTO :WS-PRODUCT-ID, :WS-DESCRIPTION, :WS-PRICE
003000         FROM PRODUCTS
003100         WHERE PRODUCT_ID = 2001
003200     END-EXEC.
003300*
004100*
004200 DISPLAY-RESULT.
004300     EXEC CICS SEND TEXT
004400         FROM(WS-DESCRIPTION)
004500         LENGTH(40)
004600     END-EXEC.
004700*
004800 EXIT-ROUTINE.
004900     EXEC SQL COMMIT END-EXEC.