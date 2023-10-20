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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 80
entity rot_0CLK_870b5434 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_870b5434;
architecture arch of rot_0CLK_870b5434 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2818_c6_4a52]
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2818_c2_c2a9]
signal l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_87df]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2823_c7_c9ec]
signal l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_975d]
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2826_c7_9960]
signal n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2826_c7_9960]
signal t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2826_c7_9960]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2826_c7_9960]
signal l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_0e1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2830_c7_35e1]
signal l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_b256]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2833_c7_c94f]
signal l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_c6f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_0538]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2837_c7_0538]
signal l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_32f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2840_c7_3e41]
signal l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2843_c30_7422]
signal sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_b431]
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_e8a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2848_c7_e8a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_e8a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_e8a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2848_c7_e8a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_667a]
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2853_c7_7e1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2853_c7_7e1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2853_c7_7e1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2853_c7_7e1c]
signal result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_b9e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c7_1694]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c7_1694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52
BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left,
BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right,
BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output);

-- n8_MUX_uxn_opcodes_h_l2818_c2_c2a9
n8_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- t8_MUX_uxn_opcodes_h_l2818_c2_c2a9
t8_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- l8_MUX_uxn_opcodes_h_l2818_c2_c2a9
l8_MUX_uxn_opcodes_h_l2818_c2_c2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond,
l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue,
l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse,
l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output);

-- n8_MUX_uxn_opcodes_h_l2823_c7_c9ec
n8_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- t8_MUX_uxn_opcodes_h_l2823_c7_c9ec
t8_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- l8_MUX_uxn_opcodes_h_l2823_c7_c9ec
l8_MUX_uxn_opcodes_h_l2823_c7_c9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond,
l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue,
l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse,
l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output);

-- n8_MUX_uxn_opcodes_h_l2826_c7_9960
n8_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- t8_MUX_uxn_opcodes_h_l2826_c7_9960
t8_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960
result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- l8_MUX_uxn_opcodes_h_l2826_c7_9960
l8_MUX_uxn_opcodes_h_l2826_c7_9960 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond,
l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue,
l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse,
l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output);

-- n8_MUX_uxn_opcodes_h_l2830_c7_35e1
n8_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- l8_MUX_uxn_opcodes_h_l2830_c7_35e1
l8_MUX_uxn_opcodes_h_l2830_c7_35e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond,
l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue,
l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse,
l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output);

-- n8_MUX_uxn_opcodes_h_l2833_c7_c94f
n8_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f
result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- l8_MUX_uxn_opcodes_h_l2833_c7_c94f
l8_MUX_uxn_opcodes_h_l2833_c7_c94f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond,
l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue,
l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse,
l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- l8_MUX_uxn_opcodes_h_l2837_c7_0538
l8_MUX_uxn_opcodes_h_l2837_c7_0538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond,
l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue,
l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse,
l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41
result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- l8_MUX_uxn_opcodes_h_l2840_c7_3e41
l8_MUX_uxn_opcodes_h_l2840_c7_3e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond,
l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue,
l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse,
l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2843_c30_7422
sp_relative_shift_uxn_opcodes_h_l2843_c30_7422 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins,
sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x,
sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y,
sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7
result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c
result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c
result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c
result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output,
 n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output,
 n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output,
 n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output,
 n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output,
 n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output,
 sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_b684 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_0550 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_0748 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_a907 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2e71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_c625 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_9ddf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_44b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2854_c3_b3cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2853_c7_7e1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2862_l2814_DUPLICATE_0946_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_0550 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_0550;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_0748 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_0748;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_c625 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_c625;
     VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_44b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_44b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_a907 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_a907;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2e71 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2e71;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_9ddf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_9ddf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_b684 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_b684;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2854_c3_b3cd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2854_c3_b3cd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_b9e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_b431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_left;
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output := BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2853_c7_7e1c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2853_c7_7e1c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_975d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_b256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_0e1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2818_c6_4a52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_667a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_c6f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2843_c30_7422] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_ins;
     sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_x;
     sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output := sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_87df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_32f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;

     -- Submodule level 1
     VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c6_4a52_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_87df_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_975d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0e1d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_b256_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_c6f3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_32f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_b431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_667a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_b9e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2818_l2840_l2837_l2833_DUPLICATE_e371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2840_l2837_l2833_DUPLICATE_edd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2830_l2826_l2823_l2848_l2818_l2837_l2833_DUPLICATE_17f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2830_l2857_l2826_l2853_l2823_l2848_l2818_l2837_l2833_DUPLICATE_2a78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2830_l2826_l2853_l2823_l2818_l2837_l2833_DUPLICATE_5993_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2853_c7_7e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2843_c30_7422_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2848_c7_e8a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2853_c7_7e1c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c7_1694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output;

     -- l8_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c7_1694] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2853_c7_7e1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- n8_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- Submodule level 2
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1694_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1694_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     -- n8_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2853_c7_7e1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2853_c7_7e1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;

     -- l8_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2848_c7_e8a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_e8a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2853_c7_7e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- l8_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- t8_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_e8a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_e8a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_e8a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- l8_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_3e41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- n8_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_3e41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- l8_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- n8_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_0538] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- l8_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_c94f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_c94f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     -- l8_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_35e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_35e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2826_c7_9960] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_9960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_c9ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_c9ec_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2818_c2_c2a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2862_l2814_DUPLICATE_0946 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2862_l2814_DUPLICATE_0946_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2818_c2_c2a9_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2862_l2814_DUPLICATE_0946_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2862_l2814_DUPLICATE_0946_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
