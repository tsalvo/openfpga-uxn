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
-- Submodules: 79
entity sub2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_f74041be;
architecture arch of sub2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_696c]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_27ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2367_c2_35f9]
signal t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2368_c3_b212[uxn_opcodes_h_l2368_c3_b212]
signal printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_009c]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_fa36]
signal t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_4c7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2375_c7_bf46]
signal t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_ebe1]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2380_c7_e327]
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2380_c7_e327]
signal n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_e327]
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2380_c7_e327]
signal t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_8fac]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_e59d]
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_2b32]
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_cfa3]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2388_c7_6755]
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2388_c7_6755]
signal n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_6755]
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2389_c3_1f3d]
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_59f9]
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2392_c30_7c44]
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_e42d]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_a6ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_a6ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_a6ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_a6ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_a6ab]
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2400_c31_e3e4]
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_16a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_c1af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_c1af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9
tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- n16_MUX_uxn_opcodes_h_l2367_c2_35f9
n16_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- t16_MUX_uxn_opcodes_h_l2367_c2_35f9
t16_MUX_uxn_opcodes_h_l2367_c2_35f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond,
t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue,
t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse,
t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

-- printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212
printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212 : entity work.printf_uxn_opcodes_h_l2368_c3_b212_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36
tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- n16_MUX_uxn_opcodes_h_l2372_c7_fa36
n16_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_fa36
t16_MUX_uxn_opcodes_h_l2372_c7_fa36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46
tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- n16_MUX_uxn_opcodes_h_l2375_c7_bf46
n16_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- t16_MUX_uxn_opcodes_h_l2375_c7_bf46
t16_MUX_uxn_opcodes_h_l2375_c7_bf46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond,
t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue,
t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse,
t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2380_c7_e327
tmp16_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- n16_MUX_uxn_opcodes_h_l2380_c7_e327
n16_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- t16_MUX_uxn_opcodes_h_l2380_c7_e327
t16_MUX_uxn_opcodes_h_l2380_c7_e327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond,
t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue,
t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse,
t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac
BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right,
BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32
tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- n16_MUX_uxn_opcodes_h_l2384_c7_2b32
n16_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2388_c7_6755
tmp16_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- n16_MUX_uxn_opcodes_h_l2388_c7_6755
n16_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d
BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right,
BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right,
BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44
sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins,
sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x,
sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y,
sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4
CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x,
CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output,
 sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output,
 CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_1c8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_2d93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_c231 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_fc81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d488 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_ea0f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_0dbe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_2bf5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_49d7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2407_l2363_DUPLICATE_db58_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_c231 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_c231;
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d488 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_d488;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_fc81 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2382_c3_fc81;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_2d93 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_2d93;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_1c8f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2369_c3_1c8f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_0dbe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2399_c3_0dbe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c6_696c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_cfa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2384_c11_e59d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_4c7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_16a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2400_c31_e3e4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output := CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_e42d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_49d7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_49d7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_ebe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2392_c30_7c44] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_ins;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_x;
     sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output := sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_009c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c6_696c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_009c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_4c7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_ebe1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2384_c11_e59d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_cfa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_e42d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_16a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2376_l2389_l2385_l2381_DUPLICATE_0d94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2388_l2384_DUPLICATE_92cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2397_l2388_l2384_DUPLICATE_98a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_17f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2402_l2367_l2397_l2384_DUPLICATE_9849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_49d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2397_l2384_DUPLICATE_49d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2380_l2375_l2372_l2367_l2397_l2384_DUPLICATE_4171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2392_c30_7c44_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_a6ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2389_c3_1f3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_left;
     BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output := BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_c1af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_c1af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2367_c1_27ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_a6ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2400_c21_2bf5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_2bf5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2400_c31_e3e4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_8fac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_8fac_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2389_c3_1f3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2400_c21_2bf5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2386_l2377_DUPLICATE_adce_return_output;
     VAR_printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2367_c1_27ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_c1af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_a6ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2390_c11_59f9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- printf_uxn_opcodes_h_l2368_c3_b212[uxn_opcodes_h_l2368_c3_b212] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2368_c3_b212_uxn_opcodes_h_l2368_c3_b212_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- t16_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_a6ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_a6ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_a6ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2395_c21_ea0f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_ea0f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2390_c11_59f9_return_output);

     -- t16_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- n16_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2395_c21_ea0f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_6755] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output := result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- n16_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_6755_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2384_c7_2b32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output := result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;

     -- t16_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- n16_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2384_c7_2b32_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- n16_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_e327] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output := result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_e327_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2375_c7_bf46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output := result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- n16_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2375_c7_bf46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_fa36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_fa36_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2367_c2_35f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2407_l2363_DUPLICATE_db58 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2407_l2363_DUPLICATE_db58_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c2_35f9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2407_l2363_DUPLICATE_db58_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2407_l2363_DUPLICATE_db58_return_output;
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
