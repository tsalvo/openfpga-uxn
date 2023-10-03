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
-- Submodules: 107
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1171_c6_0cc6]
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1171_c1_b2d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1171_c2_e6ae]
signal n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1172_c3_00f4[uxn_opcodes_h_l1172_c3_00f4]
signal printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_304f]
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1177_c7_ec93]
signal n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_d5d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c7_fe26]
signal n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_25c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1185_c7_4793]
signal result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1185_c7_4793]
signal t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1185_c7_4793]
signal n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1188_c11_395d]
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1188_c7_66c4]
signal n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1189_c3_791b]
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_a8ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1192_c7_cfaa]
signal n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_9dce]
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1195_c7_b9ce]
signal n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_4c96]
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1200_c7_8317]
signal result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1200_c7_8317]
signal n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_3353]
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1203_c7_5205]
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1203_c7_5205]
signal n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1204_c3_86b5]
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1207_c32_83ce]
signal BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1207_c32_f4f8]
signal BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1207_c32_d1fe]
signal MUX_uxn_opcodes_h_l1207_c32_d1fe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_6022]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c56e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c56e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c56e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c56e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_c56e]
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1213_c24_4c17]
signal BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1213_c24_7efc]
signal MUX_uxn_opcodes_h_l1213_c24_7efc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1213_c24_7efc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1215_c11_783a]
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1215_c7_9b9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1215_c7_9b9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6
BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left,
BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right,
BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae
result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1171_c2_e6ae
t16_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1171_c2_e6ae
n16_MUX_uxn_opcodes_h_l1171_c2_e6ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond,
n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue,
n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse,
n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

-- printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4
printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4 : entity work.printf_uxn_opcodes_h_l1172_c3_00f4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93
result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93
result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- t16_MUX_uxn_opcodes_h_l1177_c7_ec93
t16_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- n16_MUX_uxn_opcodes_h_l1177_c7_ec93
n16_MUX_uxn_opcodes_h_l1177_c7_ec93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond,
n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue,
n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse,
n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- t16_MUX_uxn_opcodes_h_l1180_c7_fe26
t16_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c7_fe26
n16_MUX_uxn_opcodes_h_l1180_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond,
n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793
result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793
result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- t16_MUX_uxn_opcodes_h_l1185_c7_4793
t16_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- n16_MUX_uxn_opcodes_h_l1185_c7_4793
n16_MUX_uxn_opcodes_h_l1185_c7_4793 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond,
n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue,
n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse,
n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left,
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right,
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4
result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- t16_MUX_uxn_opcodes_h_l1188_c7_66c4
t16_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- n16_MUX_uxn_opcodes_h_l1188_c7_66c4
n16_MUX_uxn_opcodes_h_l1188_c7_66c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond,
n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue,
n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse,
n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b
BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left,
BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right,
BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- n16_MUX_uxn_opcodes_h_l1192_c7_cfaa
n16_MUX_uxn_opcodes_h_l1192_c7_cfaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond,
n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue,
n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse,
n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1195_c7_b9ce
n16_MUX_uxn_opcodes_h_l1195_c7_b9ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond,
n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue,
n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse,
n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317
result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317
result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- n16_MUX_uxn_opcodes_h_l1200_c7_8317
n16_MUX_uxn_opcodes_h_l1200_c7_8317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond,
n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue,
n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse,
n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205
result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- n16_MUX_uxn_opcodes_h_l1203_c7_5205
n16_MUX_uxn_opcodes_h_l1203_c7_5205 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond,
n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue,
n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse,
n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5
BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left,
BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right,
BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce
BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left,
BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right,
BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8
BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left,
BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right,
BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output);

-- MUX_uxn_opcodes_h_l1207_c32_d1fe
MUX_uxn_opcodes_h_l1207_c32_d1fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1207_c32_d1fe_cond,
MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue,
MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse,
MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17
BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left,
BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right,
BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output);

-- MUX_uxn_opcodes_h_l1213_c24_7efc
MUX_uxn_opcodes_h_l1213_c24_7efc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1213_c24_7efc_cond,
MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue,
MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse,
MUX_uxn_opcodes_h_l1213_c24_7efc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a
BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left,
BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right,
BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736
CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output,
 MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output,
 MUX_uxn_opcodes_h_l1213_c24_7efc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_f55c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_adcd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_7411 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_731f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_2bb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_bbf4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_454f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_e3b5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_5861 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1203_DUPLICATE_d8ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1220_l1167_DUPLICATE_f045_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_e3b5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_e3b5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_731f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_731f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_f55c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_f55c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_2bb6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_2bb6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_454f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_454f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_5861 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_5861;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_bbf4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_bbf4;
     VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_adcd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_adcd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_7411 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_7411;
     VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_304f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1215_c11_783a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_d5d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_4c96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1213_c24_4c17] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_left;
     BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output := BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_25c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_3353] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_left;
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output := BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_6022] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1207_c32_83ce] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_left;
     BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output := BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1203_DUPLICATE_d8ff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1203_DUPLICATE_d8ff_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_a8ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_9dce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1171_c6_0cc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1188_c11_395d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1207_c32_83ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c6_0cc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_304f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_d5d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_25c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_395d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_a8ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_9dce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4c96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_3353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_6022_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c11_783a_return_output;
     VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1213_c24_4c17_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1181_l1189_l1196_l1204_DUPLICATE_60c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_c2fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_3c30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1180_l1185_l1192_l1177_l1195_DUPLICATE_146c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1200_l1188_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_8de4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1200_l1188_l1215_l1171_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_7704_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1203_DUPLICATE_d8ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1203_DUPLICATE_d8ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1200_l1188_l1171_l1209_l1203_l1180_l1185_l1192_l1177_l1195_DUPLICATE_6cfa_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c56e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c56e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1215_c7_9b9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1189_c3_791b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_left;
     BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output := BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output;

     -- MUX[uxn_opcodes_h_l1213_c24_7efc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1213_c24_7efc_cond <= VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_cond;
     MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue <= VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iftrue;
     MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse <= VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_return_output := MUX_uxn_opcodes_h_l1213_c24_7efc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1215_c7_9b9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1204_c3_86b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_left;
     BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output := BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1207_c32_f4f8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_left;
     BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output := BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1171_c1_b2d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1207_c32_f4f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_791b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_86b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1197_l1182_DUPLICATE_2736_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue := VAR_MUX_uxn_opcodes_h_l1213_c24_7efc_return_output;
     VAR_printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1171_c1_b2d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c7_9b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c56e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c56e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1209_c7_c56e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;

     -- printf_uxn_opcodes_h_l1172_c3_00f4[uxn_opcodes_h_l1172_c3_00f4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1172_c3_00f4_uxn_opcodes_h_l1172_c3_00f4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- MUX[uxn_opcodes_h_l1207_c32_d1fe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1207_c32_d1fe_cond <= VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_cond;
     MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue <= VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iftrue;
     MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse <= VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output := MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue := VAR_MUX_uxn_opcodes_h_l1207_c32_d1fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1209_c7_c56e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- t16_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- n16_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1203_c7_5205] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output := result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1203_c7_5205_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_8317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;

     -- t16_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1200_c7_8317_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1195_c7_b9ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_cfaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- n16_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1192_c7_cfaa_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c7_66c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- n16_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1188_c7_66c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- n16_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_4793] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1185_c7_4793_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_fe26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;

     -- n16_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_fe26_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1177_c7_ec93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output := result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1177_c7_ec93_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c2_e6ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1220_l1167_DUPLICATE_f045 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1220_l1167_DUPLICATE_f045_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c2_e6ae_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1220_l1167_DUPLICATE_f045_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1220_l1167_DUPLICATE_f045_return_output;
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
