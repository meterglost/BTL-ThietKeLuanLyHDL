
`timescale 1ns / 1ns
module tic_tac_toe_tb  ; 

parameter A  = 2'b01 ;
parameter B  = 2'b10 ;
parameter PLAY  = 2'b00 ;
parameter Awin  = 2'b01 ; 
parameter Bwin  = 2'b10 ;
parameter DRAW  = 2'b11 ;

  reg  [8:0]  A_move   ; 
  reg  [8:0]  B_move   ;  
  reg    OK_btn   ; 
  reg    reset   ; 
  wire  [8:0]  A_state   ;
  wire  [8:0]  B_state   ; 
  wire  [160:0]  result   ; 
  
  tic_tac_toe    #(A , B , PLAY , Awin , Bwin , DRAW )
   DUT  ( 
       .B_move (B_move ) ,
      .A_state (A_state ) ,
      .OK_btn (OK_btn ) ,
      .B_state (B_state ) ,
      .result (result ) ,
      .reset (reset ) ,
      .A_move (A_move ) ); 



// "Constant Pattern"
// Start Time = 870 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  A_move  = 9'b000000000  ;
	 # 70	  A_move  = 9'b000000001  ;
	 # 200	  A_move  = 9'b000001001  ;
	 # 100	  A_move  = 9'b010001001  ;
	 # 100	  A_move  = 9'b110001001  ;
	 # 150	  A_move  = 9'b000000000  ;
	 # 50	  A_move  = 9'b000000010  ;
	 # 200	  A_move  = 9'b000000000  ;
	 # 130 ;
// dumped values till 1 us
  end


// "Constant Pattern"
// Start Time = 870 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  B_move  = 9'b000000000  ;
	 # 20	  B_move  = 9'b000000001  ;
	 # 100	  B_move  = 9'b000000000  ;
	 # 50	  B_move  = 9'b000000001  ;
	 # 50	  B_move  = 9'b000000010  ;
	 # 100	  B_move  = 9'b000010010  ;
	 # 100	  B_move  = 9'b001010010  ;
	 # 100	  B_move  = 9'b001010110  ;
	 # 100	  B_move  = 9'b000000000  ;
	 # 100	  B_move  = 9'b000000100  ;
	 # 150	  B_move  = 9'b000000000  ;
	 # 130 ;
// dumped values till 1 us
  end


// "Clock Pattern" : dutyCycle = 20
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
	  OK_btn  = 1'b0  ;
	 # 40 ;
   repeat(19)
   begin
	   OK_btn  = 1'b1  ;
	  #10  OK_btn  = 1'b0  ;
	  #40 ;
// 990 ns, repeat pattern in loop.
   end
	  OK_btn  = 1'b1  ;
	 # 10 ;
// dumped values till 1 us
  end


// "Constant Pattern"
// Start Time = 815 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  reset  = 1'b0  ;
	 # 815	  reset  = 1'b1  ;
	 # 10	  reset  = 1'b0  ;
	 # 175 ;
// dumped values till 1 us
  end

  initial
	#2000 $stop;
endmodule
