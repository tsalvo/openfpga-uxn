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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 105
entity eor2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_e3a03e27;
architecture arch of eor2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1172_c6_a11d]
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1172_c2_7829]
signal tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1172_c2_7829]
signal n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1172_c2_7829]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1172_c2_7829]
signal t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_d886]
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1177_c7_91ed]
signal t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_cd01]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1180_c7_f87e]
signal t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_75a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1185_c7_eaa1]
signal t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1188_c11_eb19]
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1188_c7_3660]
signal tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1188_c7_3660]
signal n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c7_3660]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1188_c7_3660]
signal t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1189_c3_062e]
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_e92f]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_b9d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_cb9d]
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_f3ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_4ae3]
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1200_c7_9163]
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1200_c7_9163]
signal n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_9163]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_f414]
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1203_c7_deca]
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1203_c7_deca]
signal n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_deca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1204_c3_552f]
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1205_c11_691e]
signal BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1207_c30_4a2e]
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_efb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_cdf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1212_c7_cdf7]
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_cdf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_cdf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_cdf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1215_c31_3060]
signal CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_4d14]
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_17c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_17c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d
BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left,
BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right,
BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1172_c2_7829
tmp16_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- n16_MUX_uxn_opcodes_h_l1172_c2_7829
n16_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829
result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829
result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- t16_MUX_uxn_opcodes_h_l1172_c2_7829
t16_MUX_uxn_opcodes_h_l1172_c2_7829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond,
t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue,
t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse,
t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed
tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1177_c7_91ed
n16_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- t16_MUX_uxn_opcodes_h_l1177_c7_91ed
t16_MUX_uxn_opcodes_h_l1177_c7_91ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond,
t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue,
t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse,
t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e
tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c7_f87e
n16_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e
result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- t16_MUX_uxn_opcodes_h_l1180_c7_f87e
t16_MUX_uxn_opcodes_h_l1180_c7_f87e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond,
t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue,
t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse,
t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1
tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- n16_MUX_uxn_opcodes_h_l1185_c7_eaa1
n16_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- t16_MUX_uxn_opcodes_h_l1185_c7_eaa1
t16_MUX_uxn_opcodes_h_l1185_c7_eaa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond,
t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue,
t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse,
t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left,
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right,
BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1188_c7_3660
tmp16_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- n16_MUX_uxn_opcodes_h_l1188_c7_3660
n16_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660
result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- t16_MUX_uxn_opcodes_h_l1188_c7_3660
t16_MUX_uxn_opcodes_h_l1188_c7_3660 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond,
t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue,
t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse,
t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e
BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left,
BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right,
BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3
tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- n16_MUX_uxn_opcodes_h_l1192_c7_b9d3
n16_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right,
BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad
tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- n16_MUX_uxn_opcodes_h_l1195_c7_f3ad
n16_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1200_c7_9163
tmp16_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- n16_MUX_uxn_opcodes_h_l1200_c7_9163
n16_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right,
BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1203_c7_deca
tmp16_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- n16_MUX_uxn_opcodes_h_l1203_c7_deca
n16_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca
result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f
BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left,
BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right,
BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e
BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left,
BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right,
BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e
sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins,
sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x,
sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y,
sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7
result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1215_c31_3060
CONST_SR_8_uxn_opcodes_h_l1215_c31_3060 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x,
CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right,
BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output,
 tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output,
 tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output,
 tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output,
 tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_cc7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_96bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_9b5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_41c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_f185 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_1161 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_ac2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_75ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1209_c3_6d53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1210_c21_6c4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_f149 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_c7_cdf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1215_c21_8fcb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1222_l1168_DUPLICATE_05eb_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_ac2e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_ac2e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_41c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1186_c3_41c8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_cc7e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_cc7e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_96bc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_96bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_75ba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1201_c3_75ba;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_f185 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_f185;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_f149 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_f149;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_1161 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1193_c3_1161;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1209_c3_6d53 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1209_c3_6d53;
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_9b5a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_9b5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right := to_unsigned(8, 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1203_c11_f414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_left;
     BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output := BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_4ae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1217_c11_4d14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_e92f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1215_c31_3060] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output := CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_c7_cdf7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_cd01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1195_c11_cb9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1188_c11_eb19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_efb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_75a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_d886] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_left;
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output := BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1172_c6_a11d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1207_c30_4a2e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_ins;
     sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_x;
     sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output := sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c6_a11d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_d886_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_cd01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_75a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1188_c11_eb19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e92f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1195_c11_cb9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_4ae3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1203_c11_f414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_efb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1217_c11_4d14_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1196_l1204_l1181_l1189_DUPLICATE_0981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1185_l1180_l1203_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_91a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1203_l1177_l1200_l1195_l1192_l1188_l1217_DUPLICATE_5696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_8b97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_l1217_DUPLICATE_6499_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1185_l1212_l1180_l1177_l1200_l1172_l1195_l1192_l1188_DUPLICATE_94d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_4a2e_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1204_c3_552f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_left;
     BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output := BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1217_c7_17c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1217_c7_17c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1215_c21_8fcb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1215_c21_8fcb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1215_c31_3060_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1189_c3_062e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_left;
     BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output := BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1189_c3_062e_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1204_c3_552f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1215_c21_8fcb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1182_l1197_DUPLICATE_237b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1217_c7_17c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- t16_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1205_c11_691e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_left;
     BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output := BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- n16_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_cdf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1212_c7_cdf7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- n16_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- t16_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1210_c21_6c4d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1210_c21_6c4d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1205_c11_691e_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1210_c21_6c4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1203_c7_deca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output := result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- n16_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1203_c7_deca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_9163] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output := result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_9163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- n16_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1195_c7_f3ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1195_c7_f3ad_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- n16_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_b9d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_b9d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1188_c7_3660] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output := result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1188_c7_3660_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_eaa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_eaa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1180_c7_f87e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1180_c7_f87e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_91ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_91ed_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1172_c2_7829] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output := result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1222_l1168_DUPLICATE_05eb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1222_l1168_DUPLICATE_05eb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c2_7829_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1222_l1168_DUPLICATE_05eb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1222_l1168_DUPLICATE_05eb_return_output;
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
