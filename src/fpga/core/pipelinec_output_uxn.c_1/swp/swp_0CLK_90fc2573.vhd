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
-- Submodules: 68
entity swp_0CLK_90fc2573 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_90fc2573;
architecture arch of swp_0CLK_90fc2573 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2918_c6_72ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_5786]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c2_6e25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2919_c3_422c[uxn_opcodes_h_l2919_c3_422c]
signal printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_13f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_fd3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_24d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2927_c7_5afc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_9166]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2931_c7_e7ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_773c]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_aa70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2938_c32_d473]
signal BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2938_c32_5e38]
signal BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2938_c32_b2e8]
signal MUX_uxn_opcodes_h_l2938_c32_b2e8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_bd6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2940_c7_390a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2940_c7_390a]
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c7_390a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c7_390a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c7_390a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_c3da]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2946_c7_a8b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2946_c7_a8b2]
signal result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2946_c7_a8b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2946_c7_a8b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_d4d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2950_c7_9ab6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2950_c7_9ab6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff
BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output);

-- t8_MUX_uxn_opcodes_h_l2918_c2_6e25
t8_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- n8_MUX_uxn_opcodes_h_l2918_c2_6e25
n8_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25
result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25
result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

-- printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c
printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c : entity work.printf_uxn_opcodes_h_l2919_c3_422c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output);

-- t8_MUX_uxn_opcodes_h_l2924_c7_fd3f
t8_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- n8_MUX_uxn_opcodes_h_l2924_c7_fd3f
n8_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output);

-- t8_MUX_uxn_opcodes_h_l2927_c7_5afc
t8_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- n8_MUX_uxn_opcodes_h_l2927_c7_5afc
n8_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc
result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc
result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc
result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc
result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc
result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output);

-- n8_MUX_uxn_opcodes_h_l2931_c7_e7ee
n8_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output);

-- n8_MUX_uxn_opcodes_h_l2934_c7_aa70
n8_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473
BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left,
BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right,
BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38
BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left,
BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right,
BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output);

-- MUX_uxn_opcodes_h_l2938_c32_b2e8
MUX_uxn_opcodes_h_l2938_c32_b2e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2938_c32_b2e8_cond,
MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue,
MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse,
MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a
result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2
result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output,
 t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output,
 t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output,
 t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output,
 n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output,
 n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output,
 MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_2788 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_cca5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_7f83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_61e5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_a1bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_c077 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2946_l2934_DUPLICATE_939f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2955_l2914_DUPLICATE_115a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_a1bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_a1bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_61e5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_61e5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_2788 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_2788;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_c077 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_c077;
     VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_7f83 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_7f83;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_cca5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_cca5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_bd6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_24d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2946_l2934_DUPLICATE_939f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2946_l2934_DUPLICATE_939f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_d4d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c6_72ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2938_c32_d473] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_left;
     BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output := BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_773c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_c3da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_13f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_9166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2938_c32_d473_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c6_72ff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_13f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_24d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_9166_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_773c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_bd6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_c3da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_d4d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2934_l2931_DUPLICATE_2bee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2946_l2940_l2934_l2931_DUPLICATE_dcbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2940_l2931_DUPLICATE_7f4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2927_l2931_l2924_l2934_DUPLICATE_8e15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2927_l2924_l2950_l2918_l2946_l2934_l2931_DUPLICATE_761b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2946_l2934_DUPLICATE_939f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2946_l2934_DUPLICATE_939f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2927_l2924_l2918_l2946_l2934_l2931_DUPLICATE_7fed_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_5786] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output;

     -- n8_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2950_c7_9ab6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2946_c7_a8b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2938_c32_5e38] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_left;
     BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output := BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- t8_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2946_c7_a8b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2950_c7_9ab6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2940_c7_390a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2938_c32_5e38_return_output;
     VAR_printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_5786_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_9ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     -- n8_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2940_c7_390a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- MUX[uxn_opcodes_h_l2938_c32_b2e8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2938_c32_b2e8_cond <= VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_cond;
     MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue <= VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iftrue;
     MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse <= VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output := MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2946_c7_a8b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c7_390a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;

     -- printf_uxn_opcodes_h_l2919_c3_422c[uxn_opcodes_h_l2919_c3_422c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2919_c3_422c_uxn_opcodes_h_l2919_c3_422c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2946_c7_a8b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue := VAR_MUX_uxn_opcodes_h_l2938_c32_b2e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_a8b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     -- n8_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c7_390a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c7_390a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- t8_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_390a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_aa70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_aa70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2931_c7_e7ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2931_c7_e7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2927_c7_5afc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2927_c7_5afc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_fd3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_fd3f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c2_6e25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2955_l2914_DUPLICATE_115a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2955_l2914_DUPLICATE_115a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c2_6e25_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2955_l2914_DUPLICATE_115a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2955_l2914_DUPLICATE_115a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
