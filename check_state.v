module check_state (
	input [17:0] move,
	input [1:0] state,
	output reg [1:0] next_state
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

parameter 	PLAY = 2'b00,	// 0
			Awin = 2'b01,	// 1
			Bwin = 2'b10,	// 2
			DRAW = 2'b11;	// 3

always @(*)
begin
	if (
			(move[0] && move[1] && move[2]) ||
			(move[3] && move[4] && move[5]) ||
			(move[6] && move[7] && move[8]) ||
			(move[0] && move[3] && move[6]) ||
			(move[1] && move[4] && move[7]) ||
			(move[2] && move[5] && move[8]) ||
			(move[0] && move[4] && move[8]) ||
			(move[2] && move[4] && move[6])
		)
			next_state = Awin;
	else
	if (
			(move[09] && move[10] && move[11]) ||
			(move[12] && move[13] && move[14]) ||
			(move[15] && move[16] && move[17]) ||
			(move[09] && move[12] && move[15]) ||
			(move[10] && move[13] && move[16]) ||
			(move[11] && move[14] && move[17]) ||
			(move[09] && move[13] && move[17]) ||
			(move[11] && move[13] && move[15])
		)
			next_state = Bwin;
	else
	if (move == (-18'd1))
			next_state = DRAW;
	else
			next_state = PLAY;
end

endmodule
