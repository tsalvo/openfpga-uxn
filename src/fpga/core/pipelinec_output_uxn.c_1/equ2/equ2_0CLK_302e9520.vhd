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
entity equ2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_302e9520;
architecture arch of equ2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1138_c6_6721]
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1138_c1_81db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1138_c2_beef]
signal n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1138_c2_beef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1138_c2_beef]
signal t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1139_c3_1962[uxn_opcodes_h_l1139_c3_1962]
signal printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1143_c11_ca21]
signal BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1143_c7_af03]
signal n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1143_c7_af03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1143_c7_af03]
signal t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_1894]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c7_1d09]
signal t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_4db6]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_25b6]
signal t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1152_c3_41d7]
signal BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_2530]
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1155_c7_aa77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_6758]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_e88a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1160_c3_6922]
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1162_c30_f6c4]
signal sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1165_c21_a5a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1165_c21_3b32]
signal MUX_uxn_opcodes_h_l1165_c21_3b32_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1165_c21_3b32_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_1062]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_b077]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_b077]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_b077]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721
BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left,
BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right,
BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output);

-- n16_MUX_uxn_opcodes_h_l1138_c2_beef
n16_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef
result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- t16_MUX_uxn_opcodes_h_l1138_c2_beef
t16_MUX_uxn_opcodes_h_l1138_c2_beef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond,
t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue,
t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse,
t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

-- printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962
printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962 : entity work.printf_uxn_opcodes_h_l1139_c3_1962_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21
BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left,
BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right,
BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output);

-- n16_MUX_uxn_opcodes_h_l1143_c7_af03
n16_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03
result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03
result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03
result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03
result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- t16_MUX_uxn_opcodes_h_l1143_c7_af03
t16_MUX_uxn_opcodes_h_l1143_c7_af03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond,
t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue,
t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse,
t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c7_1d09
n16_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09
result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c7_1d09
t16_MUX_uxn_opcodes_h_l1146_c7_1d09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond,
t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_25b6
n16_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_25b6
t16_MUX_uxn_opcodes_h_l1151_c7_25b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7
BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left,
BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right,
BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output);

-- n16_MUX_uxn_opcodes_h_l1155_c7_aa77
n16_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_e88a
n16_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922
BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4
sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins,
sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x,
sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y,
sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2
BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output);

-- MUX_uxn_opcodes_h_l1165_c21_3b32
MUX_uxn_opcodes_h_l1165_c21_3b32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1165_c21_3b32_cond,
MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue,
MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse,
MUX_uxn_opcodes_h_l1165_c21_3b32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb
CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output,
 n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output,
 n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output,
 n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output,
 sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output,
 MUX_uxn_opcodes_h_l1165_c21_3b32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_2ce9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7360 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_d94f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_572f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_2dd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1155_DUPLICATE_6c5b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1173_l1134_DUPLICATE_08f3_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_572f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_572f;
     VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_2ce9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_2ce9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7360 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7360;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_d94f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_d94f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_2dd7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_2dd7;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_4db6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_2530] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_left;
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output := BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1143_c11_ca21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_1062] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1138_c6_6721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_left;
     BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output := BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_1894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1155_DUPLICATE_6c5b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1155_DUPLICATE_6c5b_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1162_c30_f6c4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_ins;
     sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_x;
     sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output := sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_6758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1138_c6_6721_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1143_c11_ca21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_1894_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_4db6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_2530_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_6758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_1062_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1147_l1156_l1160_l1152_DUPLICATE_e50b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_877f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1167_DUPLICATE_19f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_d7f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1151_l1146_l1143_l1138_l1167_DUPLICATE_22ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1155_DUPLICATE_6c5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1155_DUPLICATE_6c5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1155_l1151_l1146_l1143_l1138_DUPLICATE_99bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1162_c30_f6c4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1160_c3_6922] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_left;
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output := BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_b077] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1152_c3_41d7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_left;
     BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output := BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_b077] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1138_c1_81db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_b077] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1152_c3_41d7_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_6922_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1157_l1148_DUPLICATE_0bbb_return_output;
     VAR_printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1138_c1_81db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_b077_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     -- printf_uxn_opcodes_h_l1139_c3_1962[uxn_opcodes_h_l1139_c3_1962] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1139_c3_1962_uxn_opcodes_h_l1139_c3_1962_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1165_c21_a5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c21_a5a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     -- MUX[uxn_opcodes_h_l1165_c21_3b32] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1165_c21_3b32_cond <= VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_cond;
     MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue <= VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iftrue;
     MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse <= VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_return_output := MUX_uxn_opcodes_h_l1165_c21_3b32_return_output;

     -- n16_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- t16_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue := VAR_MUX_uxn_opcodes_h_l1165_c21_3b32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_e88a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e88a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     -- t16_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_aa77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output := result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;

     -- n16_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_aa77_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_25b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_25b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1146_c7_1d09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c7_1d09_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1143_c7_af03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output := result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1143_c7_af03_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1138_c2_beef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1173_l1134_DUPLICATE_08f3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1173_l1134_DUPLICATE_08f3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1138_c2_beef_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1138_c2_beef_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1173_l1134_DUPLICATE_08f3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1173_l1134_DUPLICATE_08f3_return_output;
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
