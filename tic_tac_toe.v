module tic_tac_toe (
	input [8:0] A_move, B_move,
	input OK_btn, reset,
	output [8:0] A_state, B_state,
	output [8*20:0] result
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

parameter 	PLAY = 2'b00,	// 0
			Awin = 2'b01,	// 1
			Bwin = 2'b10,	// 2
			DRAW = 2'b11;	// 3

wire 	[17:0] curr_move;
reg 	[17:0] temp_move;
wire 	[17:0] next_move = {B_move, A_move};

wire 	[1:0] curr_state;
reg 	[1:0] temp_state;
wire 	[1:0] next_state;

wire 	[1:0] curr_turn;
reg 	[1:0] temp_turn;

wire valid_move;

initial
begin
	temp_move = 18'd0;
	temp_state = PLAY;
	temp_turn = A;
end

check_move SM1 (
	.turn(temp_turn),
	.state(temp_state),
	.curr_move(temp_move),
	.next_move(next_move),
	.valid_move(valid_move)
);

check_state SM2 (
	.move(next_move),
	.state(temp_state),
	.next_state(next_state)
);

update SM3 (
	.OK_button(OK_btn),
	.reset(reset),

	.valid_move(valid_move),
	.next_move(next_move),
	.curr_move(curr_move),

	.state(temp_state),
	.next_state(next_state),
	.curr_state(curr_state),

	.next_turn(temp_turn),
	.curr_turn(curr_turn)
);

always @(curr_move)		temp_move <= curr_move;
always @(curr_turn)		temp_turn <= curr_turn;
always @(curr_state)	temp_state <= curr_state;

assign A_state = temp_move[8:0];
assign B_state = temp_move[17:9];
assign result = 	(temp_state == Awin) ? "A win" :
					(temp_state == Bwin) ? "B win" :
					(temp_state == DRAW) ? "draw" :
					(temp_turn == A) ? "A's turn" : "B's turn";
endmodule
