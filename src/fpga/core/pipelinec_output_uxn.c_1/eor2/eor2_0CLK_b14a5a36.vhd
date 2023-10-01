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
-- Submodules: 124
entity eor2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_b14a5a36;
architecture arch of eor2_0CLK_b14a5a36 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l834_c6_6cbf]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_ab20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l834_c2_2d55]
signal n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l834_c2_2d55]
signal t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l834_c2_2d55]
signal tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_2d55]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l835_c3_18e6[uxn_opcodes_h_l835_c3_18e6]
signal printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l842_c11_8432]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l842_c7_04e9]
signal n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l842_c7_04e9]
signal t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l842_c7_04e9]
signal tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_04e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_6dcb]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l846_c7_405d]
signal n16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l846_c7_405d]
signal t16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l846_c7_405d]
signal tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_405d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_214f]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_d3d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l856_c11_f3e1]
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l856_c7_b73c]
signal n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l856_c7_b73c]
signal t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l856_c7_b73c]
signal tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_b73c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l857_c3_a7fd]
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_ea8f]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l861_c7_3864]
signal n16_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l861_c7_3864]
signal tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_3864]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_ca6c]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_7a6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l871_c11_6c67]
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l871_c7_2d86]
signal n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l871_c7_2d86]
signal tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_2d86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_8ced]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_082e]
signal n16_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_082e]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_082e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_f42d]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l877_c11_0ebf]
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l880_c32_ae78]
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l880_c32_aaac]
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l880_c32_f7aa]
signal MUX_uxn_opcodes_h_l880_c32_f7aa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_f7aa_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_d7a0]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l882_c7_0a07]
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_0a07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_0a07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_0a07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_0a07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l888_c11_5fb6]
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_486c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_486c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l888_c7_486c]
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_486c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l891_c34_5139]
signal CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l893_c11_4f5c]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_221b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_221b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf
BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output);

-- n16_MUX_uxn_opcodes_h_l834_c2_2d55
n16_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- t16_MUX_uxn_opcodes_h_l834_c2_2d55
t16_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l834_c2_2d55
tmp16_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55
result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

-- printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6
printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6 : entity work.printf_uxn_opcodes_h_l835_c3_18e6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432
BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output);

-- n16_MUX_uxn_opcodes_h_l842_c7_04e9
n16_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- t16_MUX_uxn_opcodes_h_l842_c7_04e9
t16_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l842_c7_04e9
tmp16_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9
result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output);

-- n16_MUX_uxn_opcodes_h_l846_c7_405d
n16_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l846_c7_405d_cond,
n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- t16_MUX_uxn_opcodes_h_l846_c7_405d
t16_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l846_c7_405d_cond,
t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l846_c7_405d
tmp16_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond,
tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d
result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f
BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output);

-- n16_MUX_uxn_opcodes_h_l852_c7_d3d2
n16_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- t16_MUX_uxn_opcodes_h_l852_c7_d3d2
t16_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2
tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2
result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1
BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output);

-- n16_MUX_uxn_opcodes_h_l856_c7_b73c
n16_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- t16_MUX_uxn_opcodes_h_l856_c7_b73c
t16_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l856_c7_b73c
tmp16_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c
result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd
BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left,
BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right,
BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output);

-- n16_MUX_uxn_opcodes_h_l861_c7_3864
n16_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l861_c7_3864_cond,
n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- tmp16_MUX_uxn_opcodes_h_l861_c7_3864
tmp16_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond,
tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864
result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c
BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output);

-- n16_MUX_uxn_opcodes_h_l865_c7_7a6c
n16_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c
tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c
result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67
BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output);

-- n16_MUX_uxn_opcodes_h_l871_c7_2d86
n16_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- tmp16_MUX_uxn_opcodes_h_l871_c7_2d86
tmp16_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86
result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced
BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_082e
n16_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_082e_cond,
n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_082e
tmp16_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e
result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d
BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf
BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78
BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left,
BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right,
BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac
BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left,
BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right,
BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output);

-- MUX_uxn_opcodes_h_l880_c32_f7aa
MUX_uxn_opcodes_h_l880_c32_f7aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l880_c32_f7aa_cond,
MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue,
MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse,
MUX_uxn_opcodes_h_l880_c32_f7aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07
result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6
BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c
result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l891_c34_5139
CONST_SR_8_uxn_opcodes_h_l891_c34_5139 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x,
CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c
BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output,
 n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output,
 n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output,
 n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output,
 n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output,
 n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output,
 n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output,
 n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output,
 n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output,
 BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output,
 MUX_uxn_opcodes_h_l880_c32_f7aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output,
 CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_c814 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_af8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_7fa6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_0ec7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_30e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_6b60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_31d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_94d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_082e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3b5b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_3623_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_8dc8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_ed06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_1483_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l898_l830_DUPLICATE_1cf3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_af8a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_af8a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_31d9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_31d9;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_30e4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_30e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_8dc8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_8dc8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_94d7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_94d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_7fa6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_7fa6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_6b60 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_6b60;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_c814 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_c814;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right := to_unsigned(11, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3b5b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3b5b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_0ec7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_0ec7;

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_ca6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_082e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c6_6cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_2d55_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l842_c11_8432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l880_c32_ae78] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_left;
     BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output := BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_8ced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_d7a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l856_c11_f3e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_ea8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_1483 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_1483_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l888_c11_5fb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l886_c24_3623] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_3623_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c11_4f5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_214f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_6dcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l871_c11_6c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_left;
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output := BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l891_c34_5139] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x <= VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output := CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left := VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ae78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_6cbf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_8432_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_6dcb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_214f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_f3e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_ea8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_ca6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_6c67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_8ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d7a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_5fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_4f5c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l866_l876_l847_l857_DUPLICATE_b7c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_3623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l852_l834_l865_l871_l856_l875_l842_l846_DUPLICATE_2244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l861_l893_l852_l882_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_b721_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l852_l882_l834_l865_l871_l856_l842_l846_DUPLICATE_41d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l893_l852_l865_l871_l856_l875_l842_l846_DUPLICATE_5f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_1483_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_1483_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l852_l834_l865_l888_l871_l856_l875_l842_l846_DUPLICATE_fcdb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_2d55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_082e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_0a07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l891_c24_ed06] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_ed06_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_5139_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_221b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_ab20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l880_c32_aaac] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_left;
     BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output := BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_486c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_f42d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l857_c3_a7fd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_left;
     BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output := BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_221b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_aaac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_a7fd_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_f42d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_ed06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_5cdf_return_output;
     VAR_printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_ab20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_221b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_221b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_486c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- MUX[uxn_opcodes_h_l880_c32_f7aa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l880_c32_f7aa_cond <= VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_cond;
     MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue <= VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iftrue;
     MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse <= VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_return_output := MUX_uxn_opcodes_h_l880_c32_f7aa_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l877_c11_0ebf] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_left;
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output := BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output;

     -- t16_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_486c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_0a07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_486c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l888_c7_486c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output := result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- printf_uxn_opcodes_h_l835_c3_18e6[uxn_opcodes_h_l835_c3_18e6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l835_c3_18e6_uxn_opcodes_h_l835_c3_18e6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output := n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_0ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue := VAR_MUX_uxn_opcodes_h_l880_c32_f7aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_486c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_486c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_486c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_0a07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_0a07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- t16_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l882_c7_0a07] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_cond;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output := result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;

     -- n16_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_0a07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- t16_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output := t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- n16_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_082e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_n16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_082e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output := n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l871_c7_2d86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output := result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;

     -- t16_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_2d86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_t16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- n16_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output := tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- t16_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_7a6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_7a6c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- n16_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l861_c7_3864] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_3864_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_b73c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;

     -- n16_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output := n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_b73c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output := tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- n16_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_d3d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_d3d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- n16_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_405d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_405d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_04e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_04e9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_2d55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l898_l830_DUPLICATE_1cf3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l898_l830_DUPLICATE_1cf3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_2d55_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_2d55_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l898_l830_DUPLICATE_1cf3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l898_l830_DUPLICATE_1cf3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
