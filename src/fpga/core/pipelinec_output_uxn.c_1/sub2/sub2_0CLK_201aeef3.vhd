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
-- Submodules: 123
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2857_c6_371e]
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_e2b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2857_c2_8fe2]
signal n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2858_c3_25fa[uxn_opcodes_h_l2858_c3_25fa]
signal printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_6cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2863_c7_03d6]
signal n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_c276]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2866_c7_368b]
signal t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_368b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2866_c7_368b]
signal tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2866_c7_368b]
signal n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_6b5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2871_c7_ef56]
signal n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_3316]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2874_c7_930b]
signal t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_930b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2874_c7_930b]
signal tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2874_c7_930b]
signal n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2875_c3_0e26]
signal BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_3a4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_7883]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2878_c7_7883]
signal tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2878_c7_7883]
signal n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_60a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2881_c7_3d65]
signal n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_a4e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2886_c7_1ef6]
signal n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5504]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_389c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2889_c7_389c]
signal tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2889_c7_389c]
signal n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2890_c3_6dbd]
signal BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2891_c11_bfd1]
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2894_c32_6720]
signal BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2894_c32_b88c]
signal BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2894_c32_aa92]
signal MUX_uxn_opcodes_h_l2894_c32_aa92_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2894_c32_aa92_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_ce62]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_e1a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_e1a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_e1a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_e1a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_e1a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_4afa]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_8de8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2902_c7_8de8]
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_8de8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_8de8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2904_c34_7cdf]
signal CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_01a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_cd2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_cd2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e
BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left,
BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right,
BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output);

-- t16_MUX_uxn_opcodes_h_l2857_c2_8fe2
t16_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2
tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- n16_MUX_uxn_opcodes_h_l2857_c2_8fe2
n16_MUX_uxn_opcodes_h_l2857_c2_8fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond,
n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue,
n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse,
n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

-- printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa
printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa : entity work.printf_uxn_opcodes_h_l2858_c3_25fa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output);

-- t16_MUX_uxn_opcodes_h_l2863_c7_03d6
t16_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6
result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6
result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6
result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6
result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6
tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- n16_MUX_uxn_opcodes_h_l2863_c7_03d6
n16_MUX_uxn_opcodes_h_l2863_c7_03d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond,
n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue,
n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse,
n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output);

-- t16_MUX_uxn_opcodes_h_l2866_c7_368b
t16_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b
result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2866_c7_368b
tmp16_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- n16_MUX_uxn_opcodes_h_l2866_c7_368b
n16_MUX_uxn_opcodes_h_l2866_c7_368b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond,
n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue,
n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse,
n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output);

-- t16_MUX_uxn_opcodes_h_l2871_c7_ef56
t16_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56
tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- n16_MUX_uxn_opcodes_h_l2871_c7_ef56
n16_MUX_uxn_opcodes_h_l2871_c7_ef56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond,
n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue,
n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse,
n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output);

-- t16_MUX_uxn_opcodes_h_l2874_c7_930b
t16_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2874_c7_930b
tmp16_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- n16_MUX_uxn_opcodes_h_l2874_c7_930b
n16_MUX_uxn_opcodes_h_l2874_c7_930b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond,
n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue,
n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse,
n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26
BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left,
BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right,
BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2878_c7_7883
tmp16_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- n16_MUX_uxn_opcodes_h_l2878_c7_7883
n16_MUX_uxn_opcodes_h_l2878_c7_7883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond,
n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue,
n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse,
n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65
tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- n16_MUX_uxn_opcodes_h_l2881_c7_3d65
n16_MUX_uxn_opcodes_h_l2881_c7_3d65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond,
n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue,
n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse,
n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6
tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- n16_MUX_uxn_opcodes_h_l2886_c7_1ef6
n16_MUX_uxn_opcodes_h_l2886_c7_1ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond,
n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue,
n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse,
n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c
result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c
result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2889_c7_389c
tmp16_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- n16_MUX_uxn_opcodes_h_l2889_c7_389c
n16_MUX_uxn_opcodes_h_l2889_c7_389c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond,
n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue,
n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse,
n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd
BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left,
BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right,
BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1
BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left,
BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right,
BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720
BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left,
BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right,
BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c
BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left,
BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right,
BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output);

-- MUX_uxn_opcodes_h_l2894_c32_aa92
MUX_uxn_opcodes_h_l2894_c32_aa92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2894_c32_aa92_cond,
MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue,
MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse,
MUX_uxn_opcodes_h_l2894_c32_aa92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf
CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x,
CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0
CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output,
 t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output,
 t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output,
 t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output,
 t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output,
 t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output,
 MUX_uxn_opcodes_h_l2894_c32_aa92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_517e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2864_c3_a9be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2869_c3_3c3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_3c4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_0c79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_b37b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_052d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_023f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2900_c24_4ada_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2903_c3_a859 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2904_c24_18e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2889_l2902_DUPLICATE_fab3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2911_l2853_DUPLICATE_bd8a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_023f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_023f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_b37b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_b37b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43dc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_0c79 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_0c79;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2869_c3_3c3e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2869_c3_3c3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2864_c3_a9be := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2864_c3_a9be;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_052d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_052d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_3c4e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_3c4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2903_c3_a859 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2903_c3_a859;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_517e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_517e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := tmp16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2900_c24_4ada] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2900_c24_4ada_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2857_c6_371e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l2894_c32_6720] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_left;
     BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output := BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_6cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2889_l2902_DUPLICATE_fab3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2889_l2902_DUPLICATE_fab3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_3316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_60a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_ce62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_01a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_c276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_a4e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5504] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_3a4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2904_c34_7cdf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output := CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_4afa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_6b5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2894_c32_6720_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c6_371e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_6cf6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_c276_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_6b5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_3316_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3a4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_60a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a4e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ce62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_4afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_01a2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2882_l2875_l2890_l2867_DUPLICATE_08f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2900_c24_4ada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_0a59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2896_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_1aa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2878_l2874_l2896_l2871_l2866_l2886_l2863_l2881_l2857_DUPLICATE_de88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2878_l2874_l2871_l2889_l2866_l2886_l2863_l2881_DUPLICATE_a1b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2906_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_1cfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2889_l2902_DUPLICATE_fab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2889_l2902_DUPLICATE_fab3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2878_l2902_l2874_l2871_l2889_l2866_l2886_l2863_l2881_l2857_DUPLICATE_60b3_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2894_c32_b88c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_left;
     BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output := BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_e1a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_8de8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_cd2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2875_c3_0e26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_left;
     BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output := BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2904_c24_18e4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2904_c24_18e4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2904_c34_7cdf_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_e2b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2890_c3_6dbd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_left;
     BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output := BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_cd2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2894_c32_b88c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2875_c3_0e26_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2890_c3_6dbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2904_c24_18e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2868_l2883_DUPLICATE_d8b0_return_output;
     VAR_printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_e2b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_cd2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_8de8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;

     -- printf_uxn_opcodes_h_l2858_c3_25fa[uxn_opcodes_h_l2858_c3_25fa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2858_c3_25fa_uxn_opcodes_h_l2858_c3_25fa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_e1a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2891_c11_bfd1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2902_c7_8de8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;

     -- MUX[uxn_opcodes_h_l2894_c32_aa92] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2894_c32_aa92_cond <= VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_cond;
     MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue <= VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iftrue;
     MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse <= VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_return_output := MUX_uxn_opcodes_h_l2894_c32_aa92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_8de8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c11_bfd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue := VAR_MUX_uxn_opcodes_h_l2894_c32_aa92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_8de8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- n16_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_e1a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_e1a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_e1a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e1a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2889_c7_389c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- n16_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2889_c7_389c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- n16_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2886_c7_1ef6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2886_c7_1ef6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- n16_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2881_c7_3d65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_3d65_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_7883] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output := result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_7883_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_930b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_930b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     -- n16_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_ef56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output := result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_ef56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_368b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_368b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2863_c7_03d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2863_c7_03d6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c2_8fe2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2911_l2853_DUPLICATE_bd8a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2911_l2853_DUPLICATE_bd8a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c2_8fe2_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2911_l2853_DUPLICATE_bd8a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2911_l2853_DUPLICATE_bd8a_return_output;
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
