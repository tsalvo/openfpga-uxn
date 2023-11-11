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
-- Submodules: 71
entity sft2_0CLK_77062510 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_77062510;
architecture arch of sft2_0CLK_77062510 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_d29d]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_a036]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_4f4b]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2134_c3_c9bb[uxn_opcodes_h_l2134_c3_c9bb]
signal printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_8338]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_575a]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_575a]
signal n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2138_c7_575a]
signal t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_575a]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_c78b]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_341f]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_341f]
signal n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2141_c7_341f]
signal t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_341f]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_289d]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2145_c7_1233]
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2145_c7_1233]
signal n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_1233]
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2147_c3_df9d]
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_f68a]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_2469]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_2469]
signal n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_2469]
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2150_c3_f210]
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2152_c30_70e7]
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2153_c20_7c34]
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2153_c12_6ab1]
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2153_c36_a43f]
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2153_c12_52d9]
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_cdc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_b2b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_b2b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_b2b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_b2b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_b2b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2161_c31_6ed0]
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_90c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_031e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_031e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b
tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c2_4f4b
n16_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c2_4f4b
t8_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

-- printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb
printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb : entity work.printf_uxn_opcodes_h_l2134_c3_c9bb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_575a
tmp16_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_575a
n16_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- t8_MUX_uxn_opcodes_h_l2138_c7_575a
t8_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_341f
tmp16_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_341f
n16_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- t8_MUX_uxn_opcodes_h_l2141_c7_341f
t8_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2145_c7_1233
tmp16_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- n16_MUX_uxn_opcodes_h_l2145_c7_1233
n16_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d
CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x,
CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_2469
tmp16_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_2469
n16_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7
sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins,
sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x,
sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y,
sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34
BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1
BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f
CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x,
CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9
BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0
CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x,
CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output,
 CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output,
 sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output,
 CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_a9f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_c116 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_398d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_6c60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_dea7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_9e27 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_72a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_b387_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_a121_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2168_l2128_DUPLICATE_8fb6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_398d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_398d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_c116 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_c116;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_9e27 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_9e27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right := to_unsigned(15, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_a9f7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_a9f7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_6c60 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_6c60;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y := resize(to_signed(-1, 2), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_f68a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2152_c30_70e7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_ins;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_x;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output := sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_a121 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_a121_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_c78b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2153_c20_7c34] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_left;
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output := BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_90c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2153_c36_a43f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output := CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_b387 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_b387_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2161_c31_6ed0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output := CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_8338] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_d29d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_289d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_cdc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_7c34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_d29d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_8338_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_c78b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_289d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_f68a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_cdc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_90c6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_b387_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_b387_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_c91e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2158_l2149_l2145_l2141_l2138_l2163_DUPLICATE_da01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_52a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_l2163_DUPLICATE_ed85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_a121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_a121_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2158_l2145_l2141_l2138_l2133_DUPLICATE_7bcc_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right := VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_a43f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_70e7_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2161_c21_72a9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_72a9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_6ed0_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2150_c3_f210] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_left;
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output := BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_b2b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_a036] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2147_c3_df9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output := CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_031e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_b2b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_031e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f210_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_72a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_df9d_return_output;
     VAR_printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_a036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_031e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_031e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_b2b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- printf_uxn_opcodes_h_l2134_c3_c9bb[uxn_opcodes_h_l2134_c3_c9bb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2134_c3_c9bb_uxn_opcodes_h_l2134_c3_c9bb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_b2b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2153_c12_6ab1] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_left;
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output := BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_b2b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_6ab1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_b2b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- n16_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2153_c12_52d9] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_left;
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output := BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2156_c21_dea7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_dea7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_52d9_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_dea7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_2469] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output := result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_2469_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_1233] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output := result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_1233_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_341f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_341f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_575a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_575a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_4f4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2168_l2128_DUPLICATE_8fb6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2168_l2128_DUPLICATE_8fb6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_4f4b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2168_l2128_DUPLICATE_8fb6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2168_l2128_DUPLICATE_8fb6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
