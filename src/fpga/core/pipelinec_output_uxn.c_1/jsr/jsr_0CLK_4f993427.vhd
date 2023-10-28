-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 66
entity jsr_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_4f993427;
architecture arch of jsr_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l769_c6_ab90]
signal BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l769_c1_0a94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l769_c2_9ff1]
signal t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l770_c3_45fd[uxn_opcodes_h_l770_c3_45fd]
signal printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l774_c11_e6f1]
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c7_f689]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l774_c7_f689]
signal t8_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_4730]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_30e9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l777_c7_30e9]
signal t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l780_c30_8597]
signal sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l782_c11_6fb6]
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c7_1fc4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_7de6]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_f98b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l792_c31_f3cd]
signal CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l794_c22_b540]
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l796_c11_6fff]
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l796_c7_c412]
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l796_c7_c412]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_c412]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_c412]
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_615a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90
BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left,
BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right,
BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1
result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1
result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1
result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1
result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- t8_MUX_uxn_opcodes_h_l769_c2_9ff1
t8_MUX_uxn_opcodes_h_l769_c2_9ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond,
t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue,
t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse,
t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

-- printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd
printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd : entity work.printf_uxn_opcodes_h_l770_c3_45fd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1
BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left,
BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right,
BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689
result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689
result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689
result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- t8_MUX_uxn_opcodes_h_l774_c7_f689
t8_MUX_uxn_opcodes_h_l774_c7_f689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l774_c7_f689_cond,
t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue,
t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse,
t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730
BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9
result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9
result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- t8_MUX_uxn_opcodes_h_l777_c7_30e9
t8_MUX_uxn_opcodes_h_l777_c7_30e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond,
t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue,
t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse,
t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l780_c30_8597
sp_relative_shift_uxn_opcodes_h_l780_c30_8597 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins,
sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x,
sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y,
sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6
BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4
result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4
result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6
BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b
result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b
result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd
CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x,
CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540
BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left,
BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right,
BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff
BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output,
 sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output,
 CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_0c24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l775_c3_df9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_91fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l784_c3_153e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_4708_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_26b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l794_c3_a01d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c21_d080_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c27_ce81_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l777_DUPLICATE_7e05_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l803_l765_DUPLICATE_8433_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_91fb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_91fb;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_0c24 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_0c24;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_26b0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_26b0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l775_c3_df9f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l775_c3_df9f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l784_c3_153e := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l784_c3_153e;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l782_c11_6fb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l777_DUPLICATE_7e05 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l777_DUPLICATE_7e05_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l796_c11_6fff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_left;
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output := BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l780_c30_8597] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_ins;
     sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x <= VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_x;
     sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y <= VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output := sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output := result.u8_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l794_c27_ce81] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c27_ce81_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l774_c11_e6f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l769_c6_ab90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_left;
     BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output := BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_4730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l787_c21_4708] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_4708_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_7de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l792_c31_f3cd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output := CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c6_ab90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_e6f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_4730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_6fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_7de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_6fff_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c27_ce81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_4708_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l774_l769_l782_DUPLICATE_a082_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l777_l774_l769_l789_l782_DUPLICATE_b102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l774_l796_l789_l782_DUPLICATE_ca43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l774_l769_l796_l782_DUPLICATE_8fcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l774_l789_l769_l782_DUPLICATE_38e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_1e21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l774_l769_l796_l789_DUPLICATE_d7fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l777_DUPLICATE_7e05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l777_DUPLICATE_7e05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l774_l789_l777_l769_DUPLICATE_1415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l780_c30_8597_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l794_c22_b540] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_left;
     BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output := BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_c412] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output;

     -- t8_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l769_c1_0a94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_c412] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l792_c21_d080] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c21_d080_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c31_f3cd_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l796_c7_c412] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l796_c7_c412] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l794_c3_a01d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c22_b540_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c21_d080_return_output;
     VAR_printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l769_c1_0a94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_c412_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_c412_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_c412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_c412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_t8_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l794_c3_a01d;
     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- t8_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output := t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- printf_uxn_opcodes_h_l770_c3_45fd[uxn_opcodes_h_l770_c3_45fd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l770_c3_45fd_uxn_opcodes_h_l770_c3_45fd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_f98b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_f98b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- t8_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_1fc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l782_c7_1fc4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_30e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_30e9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l774_c7_f689] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c7_f689_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c2_9ff1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l803_l765_DUPLICATE_8433 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l803_l765_DUPLICATE_8433_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_615a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c2_9ff1_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l803_l765_DUPLICATE_8433_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l803_l765_DUPLICATE_8433_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
