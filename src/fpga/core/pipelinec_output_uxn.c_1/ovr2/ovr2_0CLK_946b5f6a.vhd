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
-- Submodules: 96
entity ovr2_0CLK_946b5f6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_946b5f6a;
architecture arch of ovr2_0CLK_946b5f6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l328_c6_3c65]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_b48d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l328_c2_fd50]
signal n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l328_c2_fd50]
signal t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l328_c2_fd50]
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l329_c3_c6e2[uxn_opcodes_h_l329_c3_c6e2]
signal printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_4b91]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l333_c7_e2e1]
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f37f]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l336_c7_4b96]
signal n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l336_c7_4b96]
signal t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l336_c7_4b96]
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l341_c11_f053]
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l341_c7_d6fc]
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l342_c3_a684]
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l345_c11_4881]
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l345_c7_c53d]
signal n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l345_c7_c53d]
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l349_c11_c8b0]
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l349_c7_e240]
signal n16_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l349_c7_e240]
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l350_c3_8c11]
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l352_c30_9dd0]
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_5d8f]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_33df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_33df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_33df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_33df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_33df]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_2027]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_f93b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_f93b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_f93b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l362_c7_f93b]
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_1819]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_76fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_76fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_76fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l366_c7_76fc]
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l368_c31_0a8e]
signal CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_a61e]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_5876]
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_5876]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_5876]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_5876]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_baf6]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_926d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_926d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_926d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l374_c7_926d]
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_ab23]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b575]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b575]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65
BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output);

-- n16_MUX_uxn_opcodes_h_l328_c2_fd50
n16_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- t16_MUX_uxn_opcodes_h_l328_c2_fd50
t16_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50
result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

-- printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2
printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2 : entity work.printf_uxn_opcodes_h_l329_c3_c6e2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91
BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output);

-- n16_MUX_uxn_opcodes_h_l333_c7_e2e1
n16_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- t16_MUX_uxn_opcodes_h_l333_c7_e2e1
t16_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1
result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output);

-- n16_MUX_uxn_opcodes_h_l336_c7_4b96
n16_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- t16_MUX_uxn_opcodes_h_l336_c7_4b96
t16_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96
result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053
BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output);

-- n16_MUX_uxn_opcodes_h_l341_c7_d6fc
n16_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- t16_MUX_uxn_opcodes_h_l341_c7_d6fc
t16_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc
result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l342_c3_a684
BIN_OP_OR_uxn_opcodes_h_l342_c3_a684 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left,
BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right,
BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881
BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right,
BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output);

-- n16_MUX_uxn_opcodes_h_l345_c7_c53d
n16_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d
result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0
BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right,
BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output);

-- n16_MUX_uxn_opcodes_h_l349_c7_e240
n16_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l349_c7_e240_cond,
n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11
BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left,
BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right,
BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output);

-- sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0
sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins,
sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x,
sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y,
sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f
BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df
result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027
BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b
result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819
BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc
result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e
CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x,
CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e
BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876
result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6
BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d
result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23
BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output,
 n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output,
 n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output,
 n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output,
 n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output,
 n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output,
 n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output,
 BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output,
 sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output,
 CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_86d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_f703 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_3b84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5d2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_f862 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_25ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_726a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_8f74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_a80b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d52b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_f231_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_c260 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_e507_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ccaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_afed_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ba04_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l383_l324_DUPLICATE_f6d0_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_f862 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_f862;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_8f74 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_8f74;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d52b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_d52b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_f703 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l334_c3_f703;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ccaa := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_ccaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_c260 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_c260;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_3b84 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_3b84;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5d2e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l343_c3_5d2e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_726a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_726a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_86d9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_86d9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l345_c11_4881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_left;
     BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output := BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l341_c11_f053] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_left;
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output := BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l372_c21_e507] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_e507_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l349_c11_c8b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_2027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_baf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_afed LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_afed_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_a61e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c6_3c65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_1819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_ab23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l364_c21_a80b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_a80b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_4b91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f37f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l368_c31_0a8e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output := CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_5d8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l352_c30_9dd0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_ins;
     sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_x;
     sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output := sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c6_3c65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_4b91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f37f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_f053_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l345_c11_4881_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l349_c11_c8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_5d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_2027_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_1819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_a61e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_baf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_ab23_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l337_l350_l342_l346_DUPLICATE_5d01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l364_c21_a80b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l372_c21_e507_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l336_l333_l328_l349_l345_l341_DUPLICATE_7e63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l357_l349_l378_l345_l374_l341_DUPLICATE_0161_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l333_l328_l357_l345_l341_DUPLICATE_c4ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l336_l366_l333_l362_l328_l357_l378_l345_l374_l341_DUPLICATE_5923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_afed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l345_l374_DUPLICATE_afed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l336_l333_l328_l345_l374_l341_DUPLICATE_b2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l352_c30_9dd0_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ba04 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ba04_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_7242_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l357_c7_33df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l342_c3_a684] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_left;
     BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output := BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l328_c1_b48d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b575] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b575] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_926d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l350_c3_8c11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_left;
     BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output := BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l368_c21_f231] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_f231_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l368_c31_0a8e_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l342_c3_a684_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l368_c21_f231_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ba04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l360_l376_DUPLICATE_ba04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l347_l338_DUPLICATE_ae04_return_output;
     VAR_printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l328_c1_b48d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b575_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l357_c7_33df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b575_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_926d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_926d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- printf_uxn_opcodes_h_l329_c3_c6e2[uxn_opcodes_h_l329_c3_c6e2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l329_c3_c6e2_uxn_opcodes_h_l329_c3_c6e2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_926d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output;

     -- n16_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output := n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l374_c7_926d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output := result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l355_c21_25ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_25ab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l350_c3_8c11_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_5876] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output;

     -- t16_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l355_c21_25ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_926d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_926d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_5876_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l374_c7_926d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_t16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_5876] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output;

     -- t16_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_5876] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_5876] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_76fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_5876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_5876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_5876_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_f93b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;

     -- t16_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_76fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l366_c7_76fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_76fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l366_c7_76fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_t16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- t16_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- n16_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_33df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_f93b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_f93b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l362_c7_f93b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output := result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_33df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l362_c7_f93b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_33df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_33df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output;

     -- n16_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_33df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_33df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_33df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_33df_return_output;
     -- n16_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l349_c7_e240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l349_c7_e240_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l345_c7_c53d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l345_c7_c53d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_d6fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_d6fc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l336_c7_4b96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output := result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l336_c7_4b96_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_e2e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l333_c7_e2e1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c2_fd50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l383_l324_DUPLICATE_f6d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l383_l324_DUPLICATE_f6d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l328_c2_fd50_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l328_c2_fd50_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l383_l324_DUPLICATE_f6d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l383_l324_DUPLICATE_f6d0_return_output;
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
