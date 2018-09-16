
`timescale 1ns/1ps

   module SW_BANK_01 (
     input  SW,
     output POS, NEG 
     );
     BUFFD3 b01  (.I(SW),.Z(SWB));
     TGAT   sw00 (.SW(SWB),.POS(POS),.NEG(NEG));
     TGAT   sw01 (.SW(SWB),.POS(POS),.NEG(NEG));
     TGAT   sw02 (.SW(SWB),.POS(POS),.NEG(NEG));
     TGAT   sw03 (.SW(SWB),.POS(POS),.NEG(NEG));
     TGAT   sw04 (.SW(SWB),.POS(POS),.NEG(NEG));
     TGAT   sw05 (.SW(SWB),.POS(POS),.NEG(NEG));
   endmodule
