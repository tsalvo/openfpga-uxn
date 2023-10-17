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
-- Submodules: 91
entity gth2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_c96e1a89;
architecture arch of gth2_0CLK_c96e1a89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1952_c6_1b21]
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1952_c1_fcf9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1952_c2_641a]
signal n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1952_c2_641a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1952_c2_641a]
signal t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1953_c3_4e04[uxn_opcodes_h_l1953_c3_4e04]
signal printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_af6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1957_c7_49a5]
signal t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_fa0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_79e7]
signal t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_42d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1965_c7_5f74]
signal t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_7051]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_cf7c]
signal t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1969_c3_6932]
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_9628]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_f63d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_de87]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1975_c7_af14]
signal n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_af14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_6e83]
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1980_c7_1378]
signal n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_1378]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_2269]
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1983_c7_696e]
signal n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_696e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1984_c3_0883]
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1986_c30_f864]
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1989_c21_f0dd]
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1989_c21_3699]
signal MUX_uxn_opcodes_h_l1989_c21_3699_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_3699_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_3699_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_3699_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_5779]
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_d872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c7_d872]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_d872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left,
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right,
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output);

-- n16_MUX_uxn_opcodes_h_l1952_c2_641a
n16_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- t16_MUX_uxn_opcodes_h_l1952_c2_641a
t16_MUX_uxn_opcodes_h_l1952_c2_641a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond,
t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue,
t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse,
t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

-- printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04
printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04 : entity work.printf_uxn_opcodes_h_l1953_c3_4e04_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output);

-- n16_MUX_uxn_opcodes_h_l1957_c7_49a5
n16_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- t16_MUX_uxn_opcodes_h_l1957_c7_49a5
t16_MUX_uxn_opcodes_h_l1957_c7_49a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond,
t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue,
t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse,
t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_79e7
n16_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_79e7
t16_MUX_uxn_opcodes_h_l1960_c7_79e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output);

-- n16_MUX_uxn_opcodes_h_l1965_c7_5f74
n16_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- t16_MUX_uxn_opcodes_h_l1965_c7_5f74
t16_MUX_uxn_opcodes_h_l1965_c7_5f74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond,
t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue,
t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse,
t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_cf7c
n16_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_cf7c
t16_MUX_uxn_opcodes_h_l1968_c7_cf7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932
BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output);

-- n16_MUX_uxn_opcodes_h_l1972_c7_f63d
n16_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output);

-- n16_MUX_uxn_opcodes_h_l1975_c7_af14
n16_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output);

-- n16_MUX_uxn_opcodes_h_l1980_c7_1378
n16_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output);

-- n16_MUX_uxn_opcodes_h_l1983_c7_696e
n16_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883
BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left,
BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right,
BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1986_c30_f864
sp_relative_shift_uxn_opcodes_h_l1986_c30_f864 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins,
sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x,
sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y,
sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd
BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left,
BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right,
BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output);

-- MUX_uxn_opcodes_h_l1989_c21_3699
MUX_uxn_opcodes_h_l1989_c21_3699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1989_c21_3699_cond,
MUX_uxn_opcodes_h_l1989_c21_3699_iftrue,
MUX_uxn_opcodes_h_l1989_c21_3699_iffalse,
MUX_uxn_opcodes_h_l1989_c21_3699_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output,
 n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output,
 n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output,
 n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output,
 n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output,
 n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output,
 n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output,
 n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output,
 sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output,
 MUX_uxn_opcodes_h_l1989_c21_3699_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_8066 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_b6e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_434b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_0e11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_5aa7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_d996 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_699d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d75d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_bd73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_696e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_3699_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_3699_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1997_l1948_DUPLICATE_c83c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_bd73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_bd73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_5aa7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_5aa7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_8066 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_8066;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_b6e4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_b6e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_d996 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_d996;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_434b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_434b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d75d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d75d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_0e11 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_0e11;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_699d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_699d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_fa0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_de87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_af6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_42d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_2269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_left;
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output := BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1952_c6_1b21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1986_c30_f864] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_ins;
     sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_x;
     sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output := sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_7051] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_6e83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_696e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_9628] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_5779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_left;
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output := BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_1b21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_af6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_fa0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_42d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_7051_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_9628_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_de87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_6e83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_5779_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1976_l1969_l1984_DUPLICATE_284a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_3480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1975_l1972_l1968_l1965_l1991_DUPLICATE_b42d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_5bc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1957_l1980_l1952_l1975_l1972_l1968_l1965_l1991_DUPLICATE_a2fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1960_l1983_l1957_l1980_l1952_l1975_l1972_l1968_l1965_DUPLICATE_c408_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_f864_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1969_c3_6932] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_left;
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output := BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_d872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_d872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1952_c1_fcf9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c7_d872] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1984_c3_0883] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_left;
     BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output := BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_6932_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_0883_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_b9dc_return_output;
     VAR_printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_fcf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_d872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1989_c21_f0dd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_left;
     BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output := BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- printf_uxn_opcodes_h_l1953_c3_4e04[uxn_opcodes_h_l1953_c3_4e04] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1953_c3_4e04_uxn_opcodes_h_l1953_c3_4e04_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1989_c21_3699_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_f0dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- t16_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- n16_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- MUX[uxn_opcodes_h_l1989_c21_3699] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1989_c21_3699_cond <= VAR_MUX_uxn_opcodes_h_l1989_c21_3699_cond;
     MUX_uxn_opcodes_h_l1989_c21_3699_iftrue <= VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iftrue;
     MUX_uxn_opcodes_h_l1989_c21_3699_iffalse <= VAR_MUX_uxn_opcodes_h_l1989_c21_3699_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1989_c21_3699_return_output := MUX_uxn_opcodes_h_l1989_c21_3699_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue := VAR_MUX_uxn_opcodes_h_l1989_c21_3699_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- t16_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_696e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_696e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_1378] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output := result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_1378_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_af14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output := result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_af14_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_f63d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_f63d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_cf7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_cf7c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_5f74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output := result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_5f74_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_79e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_79e7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_49a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_49a5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1952_c2_641a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1997_l1948_DUPLICATE_c83c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1997_l1948_DUPLICATE_c83c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_641a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_641a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1997_l1948_DUPLICATE_c83c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1997_l1948_DUPLICATE_c83c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
