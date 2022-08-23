module update (
	input OK_button, reset,

	input valid_move,
	input [17:0] next_move,
	output reg [17:0] curr_move,

	input [1:0] state,
	input [1:0] next_state,
	output reg [1:0] curr_state,

	input [1:0] next_turn,
	output reg [1:0] curr_turn
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

parameter 	PLAY = 2'b00,	// 0
			Awin = 2'b01,	// 1
			Bwin = 2'b10,	// 2
			DRAW = 2'b11;	// 3

always @(posedge OK_button or posedge reset)
begin
	if (reset)
	begin
		curr_move <= 18'd0;
		curr_state <= DRAW;
		curr_turn <= A;
	end
	else
	if (state != PLAY)
	begin
		curr_move <= 18'd0;
		curr_state <= PLAY;
		curr_turn <= A;
	end
	else
	if (valid_move)
	begin
		curr_move <= next_move;
		curr_state <= next_state;
		curr_turn <= (A^B)^next_turn;
	end
end

endmodule
