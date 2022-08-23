module check_move(
	input [1:0] turn,
	input [1:0] state,
	input [17:0] curr_move,
	input [17:0] next_move,
	output reg valid_move
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

parameter 	PLAY = 2'b00,	// 0
			Awin = 2'b01,	// 1
			Bwin = 2'b10,	// 2
			DRAW = 2'b11;	// 3

integer tempA, tempB, i, j;
reg check_st, check_mr, check_rm, check_wm, check_wt;

always @(*)
begin
	tempA = 0;
	tempB = 0;

	for (i = 0; i < 9; i = i + 1)
	begin
		tempA = tempA + (next_move[i] ^ curr_move[i]);
	end

	for (j = 9; j < 18; j = j + 1)
	begin
		tempB = tempB + (next_move[j] ^ curr_move[j]);
	end

	check_st = state != PLAY;
	check_mr = (tempA + tempB) != 1;
	check_rm = curr_move > next_move;
	check_wm = (next_move[17:9] & next_move[8:0]) != 0;
	check_wt = ((tempA == 1) && (turn != A)) || ((tempB == 1) && (turn != B));

	if (state != PLAY)
		valid_move = 1'b0;
	else
	if ((tempA + tempB) != 1) // Di khong phai 1 o
		valid_move = 1'b0;
	else
	if (curr_move > next_move) // Xoa o da di
		valid_move = 1'b0;
	else
	if ((next_move[17:9] & next_move[8:0]) != 0) // di vao o da di
		valid_move = 1'b0;
	else
	if (((tempA == 1) && (turn != A)) || ((tempB == 1) && (turn != B))) // di khong dung luot
		valid_move = 1'b0;
	else
		valid_move = 1'b1;
end

endmodule
