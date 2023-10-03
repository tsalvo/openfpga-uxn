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
-- BIN_OP_EQ[uxn_opcodes_h_l834_c6_3db2]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_c324]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l834_c2_8f40]
signal n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l834_c2_8f40]
signal tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l834_c2_8f40]
signal t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_8f40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l835_c3_3429[uxn_opcodes_h_l835_c3_3429]
signal printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l842_c11_4d03]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l842_c7_2002]
signal n16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l842_c7_2002]
signal tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l842_c7_2002]
signal t16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_2002]
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_613f]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l846_c7_7230]
signal n16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l846_c7_7230]
signal tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l846_c7_7230]
signal t16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_7230]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_49b4]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l852_c7_0817]
signal n16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l852_c7_0817]
signal tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l852_c7_0817]
signal t16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_0817]
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l856_c11_72e6]
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_c4ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l857_c3_1f97]
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_9dc7]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l861_c7_7699]
signal n16_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l861_c7_7699]
signal tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_7699]
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_1ce6]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l865_c7_cbab]
signal n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l865_c7_cbab]
signal tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_cbab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l871_c11_462a]
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_a5ac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_5baf]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_ad70]
signal n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_ad70]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_ad70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_3f24]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l877_c11_8b23]
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l880_c32_ea6c]
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l880_c32_9f06]
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l880_c32_a89b]
signal MUX_uxn_opcodes_h_l880_c32_a89b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_a89b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_a89b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l880_c32_a89b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_fe34]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_ea9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_ea9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_ea9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_ea9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l882_c7_ea9b]
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l888_c11_7741]
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_8416]
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_8416]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_8416]
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l888_c7_8416]
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l891_c34_921d]
signal CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l893_c11_2911]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_e63a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_e63a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2
BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output);

-- n16_MUX_uxn_opcodes_h_l834_c2_8f40
n16_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- tmp16_MUX_uxn_opcodes_h_l834_c2_8f40
tmp16_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- t16_MUX_uxn_opcodes_h_l834_c2_8f40
t16_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40
result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

-- printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429
printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429 : entity work.printf_uxn_opcodes_h_l835_c3_3429_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output);

-- n16_MUX_uxn_opcodes_h_l842_c7_2002
n16_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l842_c7_2002_cond,
n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- tmp16_MUX_uxn_opcodes_h_l842_c7_2002
tmp16_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond,
tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- t16_MUX_uxn_opcodes_h_l842_c7_2002
t16_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l842_c7_2002_cond,
t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002
result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f
BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output);

-- n16_MUX_uxn_opcodes_h_l846_c7_7230
n16_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l846_c7_7230_cond,
n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- tmp16_MUX_uxn_opcodes_h_l846_c7_7230
tmp16_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond,
tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- t16_MUX_uxn_opcodes_h_l846_c7_7230
t16_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l846_c7_7230_cond,
t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230
result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4
BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output);

-- n16_MUX_uxn_opcodes_h_l852_c7_0817
n16_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l852_c7_0817_cond,
n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- tmp16_MUX_uxn_opcodes_h_l852_c7_0817
tmp16_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond,
tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- t16_MUX_uxn_opcodes_h_l852_c7_0817
t16_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l852_c7_0817_cond,
t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817
result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6
BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right,
BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output);

-- n16_MUX_uxn_opcodes_h_l856_c7_c4ab
n16_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab
tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- t16_MUX_uxn_opcodes_h_l856_c7_c4ab
t16_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab
result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97
BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left,
BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right,
BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output);

-- n16_MUX_uxn_opcodes_h_l861_c7_7699
n16_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l861_c7_7699_cond,
n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- tmp16_MUX_uxn_opcodes_h_l861_c7_7699
tmp16_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond,
tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699
result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6
BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output);

-- n16_MUX_uxn_opcodes_h_l865_c7_cbab
n16_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l865_c7_cbab
tmp16_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab
result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a
BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right,
BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output);

-- n16_MUX_uxn_opcodes_h_l871_c7_a5ac
n16_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac
tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf
BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_ad70
n16_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_ad70
tmp16_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70
result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24
BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23
BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right,
BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c
BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left,
BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right,
BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06
BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left,
BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right,
BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output);

-- MUX_uxn_opcodes_h_l880_c32_a89b
MUX_uxn_opcodes_h_l880_c32_a89b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l880_c32_a89b_cond,
MUX_uxn_opcodes_h_l880_c32_a89b_iftrue,
MUX_uxn_opcodes_h_l880_c32_a89b_iffalse,
MUX_uxn_opcodes_h_l880_c32_a89b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34
BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b
result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741
BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right,
BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416
result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output);

-- CONST_SR_8_uxn_opcodes_h_l891_c34_921d
CONST_SR_8_uxn_opcodes_h_l891_c34_921d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x,
CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911
BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output,
 n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output,
 n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output,
 n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output,
 n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output,
 n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output,
 n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output,
 n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output,
 n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output,
 BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output,
 MUX_uxn_opcodes_h_l880_c32_a89b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output,
 CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_449d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7357 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_a5ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_fb10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5d0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_30ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_3b4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_f486 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_ad70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_a89b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l880_c32_a89b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3539 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_ee02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_eceb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_5222_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_06b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l898_l830_DUPLICATE_3568_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_f486 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_f486;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5d0d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_5d0d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3539 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_3539;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_3b4a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_3b4a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7357 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_7357;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_fb10 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l854_c3_fb10;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_449d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_449d;
     VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_a5ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_a5ca;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_eceb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_eceb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_30ef := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_30ef;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c11_2911] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l891_c34_921d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output := CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_1ce6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l842_c11_4d03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_ad70_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_49b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l888_c11_7741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_left;
     BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output := BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c6_3db2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_9dc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l880_c32_ea6c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_left;
     BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output := BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_613f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l886_c24_ee02] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_ee02_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_5baf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l871_c11_462a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_left;
     BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output := BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_06b2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_06b2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l856_c11_72e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_8f40_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_fe34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left := VAR_BIN_OP_AND_uxn_opcodes_h_l880_c32_ea6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c6_3db2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4d03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_613f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_49b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l856_c11_72e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9dc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_1ce6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c11_462a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_5baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_fe34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l888_c11_7741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c11_2911_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l857_l847_l866_DUPLICATE_da6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l886_c24_ee02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l846_l875_l842_l871_DUPLICATE_ee5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l865_l861_l893_l856_l888_l852_l882_l846_l875_l842_l871_DUPLICATE_e978_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l834_l865_l861_l856_l852_l882_l846_l842_l871_DUPLICATE_3e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l865_l861_l893_l856_l852_l846_l875_l842_l871_DUPLICATE_1a53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_06b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l888_DUPLICATE_06b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l834_l865_l861_l856_l888_l852_l846_l875_l842_l871_DUPLICATE_cf44_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l834_c2_8f40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l875_c7_ad70_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c7_e63a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l882_c7_ea9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l891_c24_5222] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_5222_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l891_c34_921d_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l857_c3_1f97] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_left;
     BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output := BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c7_e63a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_3f24] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l834_c1_c324] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l880_c32_9f06] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_left;
     BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output := BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l888_c7_8416] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l880_c32_a89b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l880_c32_9f06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l857_c3_1f97_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_3f24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l891_c24_5222_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l867_l848_DUPLICATE_b309_return_output;
     VAR_printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l834_c1_c324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c7_e63a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c7_e63a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l888_c7_8416_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l888_c7_8416] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_cond;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output := result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_ea9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l888_c7_8416] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output;

     -- printf_uxn_opcodes_h_l835_c3_3429[uxn_opcodes_h_l835_c3_3429] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l835_c3_3429_uxn_opcodes_h_l835_c3_3429_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_XOR[uxn_opcodes_h_l877_c11_8b23] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_left;
     BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output := BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l888_c7_8416] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- MUX[uxn_opcodes_h_l880_c32_a89b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l880_c32_a89b_cond <= VAR_MUX_uxn_opcodes_h_l880_c32_a89b_cond;
     MUX_uxn_opcodes_h_l880_c32_a89b_iftrue <= VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iftrue;
     MUX_uxn_opcodes_h_l880_c32_a89b_iffalse <= VAR_MUX_uxn_opcodes_h_l880_c32_a89b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l880_c32_a89b_return_output := MUX_uxn_opcodes_h_l880_c32_a89b_return_output;

     -- t16_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l877_c11_8b23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue := VAR_MUX_uxn_opcodes_h_l880_c32_a89b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l888_c7_8416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l888_c7_8416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l888_c7_8416_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_t16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     -- n16_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- t16_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output := t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_ea9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l882_c7_ea9b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output := result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_ea9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l882_c7_ea9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_t16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- n16_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- t16_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output := t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_ad70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_n16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_ad70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_t16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l871_c7_a5ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- t16_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output := t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- n16_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output := n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l871_c7_a5ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_t16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- t16_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_cbab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output := tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- n16_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_n16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c7_cbab_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- n16_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output := n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l861_c7_7699] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_n16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_7699_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- n16_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output := n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output := tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l856_c7_c4ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_n16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l856_c7_c4ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output := tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- n16_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output := n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_0817] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c7_0817_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output := tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- n16_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_7230] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_7230_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l842_c7_2002] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_cond;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output := result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l842_c7_2002_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c2_8f40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l898_l830_DUPLICATE_3568 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l898_l830_DUPLICATE_3568_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c2_8f40_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l834_c2_8f40_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l898_l830_DUPLICATE_3568_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l898_l830_DUPLICATE_3568_return_output;
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
