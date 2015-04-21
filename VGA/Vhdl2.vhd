library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my.all;

ENTITY SYNC IS
PORT(
CLK: IN STD_LOGIC;
HSYNC: OUT STD_LOGIC;
VSYNC: OUT STD_LOGIC;
R: OUT STD_LOGIC_VECTOR(3 downto 0);
G: OUT STD_LOGIC_VECTOR(3 downto 0);
B: OUT STD_LOGIC_VECTOR(3 downto 0);
KEYS: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
S: IN STD_LOGIC_VECTOR(1 downto 0)
);
END SYNC;


ARCHITECTURE MAIN OF SYNC IS
-----1280x1024 @ 60 Hz pixel clock 108 MHz
SIGNAL RGB: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL SQ_X1,SQ_Y1: INTEGER RANGE 0 TO 1688:=500;
SIGNAL SQ_X2,SQ_Y2: INTEGER RANGE 0 TO 1688:=600;
SIGNAL DRAW1,DRAW2:STD_LOGIC:='0';
SIGNAL HPOS: INTEGER RANGE 0 TO 1688:=0;
SIGNAL VPOS: INTEGER RANGE 0 TO 1066:=0;
BEGIN
SQ(HPOS,VPOS,SQ_X1,SQ_Y1,RGB,DRAW1);
SQ(HPOS,VPOS,SQ_X2,SQ_Y2,RGB,DRAW2);
 PROCESS(CLK)
 BEGIN
IF(CLK'EVENT AND CLK='1')THEN
      IF(DRAW1='1')THEN
		  IF(S(0)='1')THEN
			R<=(others=>'1');
			G<=(others=>'0');
			B<=(others=>'0');
			ELSE
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1');
			END IF;
      END IF;
		 IF(DRAW2='1')THEN
		  IF(S(1)='1')THEN
			R<=(others=>'1');
			G<=(others=>'0');
			B<=(others=>'0');
			ELSE
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1');
		  END IF;
      END IF;
		IF (DRAW1='0' AND DRAW2='0')THEN
		   R<=(others=>'0');
	      G<=(others=>'0');
	      B<=(others=>'0');
		END IF;
		IF(HPOS<1688)THEN
		HPOS<=HPOS+1;
		ELSE
		HPOS<=0;
		  IF(VPOS<1066)THEN
			  VPOS<=VPOS+1;
			  ELSE
			  VPOS<=0; 
			      IF(S(0)='1')THEN
					    IF(KEYS(0)='0')THEN
						  SQ_X1<=SQ_X1+5;
						 END IF;
                   IF(KEYS(1)='0')THEN
						  SQ_X1<=SQ_X1-5;
						 END IF;
						  IF(KEYS(2)='0')THEN
						  SQ_Y1<=SQ_Y1-5;
						 END IF;
						 IF(KEYS(3)='0')THEN
						  SQ_Y1<=SQ_Y1+5;
						 END IF;  
					END IF;
			      IF(S(1)='1')THEN
					    IF(KEYS(0)='0')THEN
						  SQ_X2<=SQ_X2+5;
						 END IF;
                   IF(KEYS(1)='0')THEN
						  SQ_X2<=SQ_X2-5;
						 END IF;
						  IF(KEYS(2)='0')THEN
						  SQ_Y2<=SQ_Y2-5;
						 END IF;
						 IF(KEYS(3)='0')THEN
						  SQ_Y2<=SQ_Y2+5;
						 END IF; 
					END IF;  
		      END IF;
		END IF;
   IF((HPOS>0 AND HPOS<408) OR (VPOS>0 AND VPOS<42))THEN
	R<=(others=>'0');
	G<=(others=>'0');
	B<=(others=>'0');
	END IF;
   IF(HPOS>48 AND HPOS<160)THEN----HSYNC
	   HSYNC<='0';
	ELSE
	   HSYNC<='1';
	END IF;
   IF(VPOS>0 AND VPOS<4)THEN----------vsync
	   VSYNC<='0';
	ELSE
	   VSYNC<='1';
	END IF;
 END IF;
 END PROCESS;
 END MAIN;