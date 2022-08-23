# BTL-ThietKeLuanLyHDL
Implement Tic-Tac-Toe game with Verilog on FPGA

# Requirement
- [Intel FPGA Design Software & Cyclone IV device support](https://www.intel.com/content/www/us/en/products/details/fpga/development-tools/quartus-prime/resource.html)
- DE2i-150 FPGA Development Kit

# Description
- `tic_tac_toe.v` is the main module link to other modules
- For each move, `check_move.v` will check if that is a valid move (on its turn & no one has moved in), else player has to rollback to previous move before continue
- After a valid move, `check_state.v` will check if anyone win or draw if all the blocks are moved in, else the game continue
