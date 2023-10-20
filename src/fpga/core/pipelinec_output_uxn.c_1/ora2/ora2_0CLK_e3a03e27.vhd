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
entity ora2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_e3a03e27;
architecture arch of ora2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1079_c6_e899]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1079_c2_6abe]
signal t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_425d]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_797f]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_797f]
signal n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_797f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1084_c7_797f]
signal t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1087_c11_f83e]
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1087_c7_cf3f]
signal t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_ccb5]
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1092_c7_7133]
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1092_c7_7133]
signal n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_7133]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1092_c7_7133]
signal t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_51de]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1095_c7_cfc2]
signal t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1096_c3_f89d]
signal BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_0260]
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1099_c7_f414]
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1099_c7_f414]
signal n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_f414]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_a74c]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_7d11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_330d]
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1107_c7_b781]
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1107_c7_b781]
signal n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_b781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_d00e]
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_d61e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1111_c3_2d04]
signal BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1112_c11_33e3]
signal BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1114_c30_6742]
signal sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1119_c11_4181]
signal BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1119_c7_974a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1119_c7_974a]
signal result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1119_c7_974a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1119_c7_974a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1119_c7_974a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1122_c31_d8a5]
signal CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_8b23]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_224b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_224b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe
tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- n16_MUX_uxn_opcodes_h_l1079_c2_6abe
n16_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe
result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- t16_MUX_uxn_opcodes_h_l1079_c2_6abe
t16_MUX_uxn_opcodes_h_l1079_c2_6abe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond,
t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue,
t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse,
t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_797f
tmp16_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_797f
n16_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- t16_MUX_uxn_opcodes_h_l1084_c7_797f
t16_MUX_uxn_opcodes_h_l1084_c7_797f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond,
t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue,
t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse,
t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left,
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right,
BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f
tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- n16_MUX_uxn_opcodes_h_l1087_c7_cf3f
n16_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- t16_MUX_uxn_opcodes_h_l1087_c7_cf3f
t16_MUX_uxn_opcodes_h_l1087_c7_cf3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond,
t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue,
t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse,
t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1092_c7_7133
tmp16_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- n16_MUX_uxn_opcodes_h_l1092_c7_7133
n16_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- t16_MUX_uxn_opcodes_h_l1092_c7_7133
t16_MUX_uxn_opcodes_h_l1092_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond,
t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue,
t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse,
t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2
tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- n16_MUX_uxn_opcodes_h_l1095_c7_cfc2
n16_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- t16_MUX_uxn_opcodes_h_l1095_c7_cfc2
t16_MUX_uxn_opcodes_h_l1095_c7_cfc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond,
t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue,
t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse,
t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d
BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left,
BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right,
BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1099_c7_f414
tmp16_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- n16_MUX_uxn_opcodes_h_l1099_c7_f414
n16_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11
tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- n16_MUX_uxn_opcodes_h_l1102_c7_7d11
n16_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11
result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1107_c7_b781
tmp16_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- n16_MUX_uxn_opcodes_h_l1107_c7_b781
n16_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right,
BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e
tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- n16_MUX_uxn_opcodes_h_l1110_c7_d61e
n16_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04
BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left,
BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right,
BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3
BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left,
BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right,
BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1114_c30_6742
sp_relative_shift_uxn_opcodes_h_l1114_c30_6742 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins,
sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x,
sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y,
sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181
BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left,
BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right,
BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a
result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a
result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a
result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a
result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5
CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x,
CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output,
 tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output,
 tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output,
 tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_51c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1085_c3_29e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_1373 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1093_c3_a428 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_8fa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1100_c3_c6f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_8deb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_ff33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_222f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1117_c21_3103_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6406 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1119_c7_974a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c21_4638_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1129_l1075_DUPLICATE_14a2_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_ff33 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1108_c3_ff33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_8fa2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_8fa2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1085_c3_29e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1085_c3_29e8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_8deb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_8deb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_51c7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_51c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1093_c3_a428 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1093_c3_a428;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1100_c3_c6f4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1100_c3_c6f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_1373 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_1373;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6406 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6406;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_222f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_222f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right := to_unsigned(8, 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := tmp16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1119_c7_974a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_ccb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1114_c30_6742] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_ins;
     sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_x;
     sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output := sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1087_c11_f83e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_0260] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_left;
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output := BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_51de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_330d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_425d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1119_c11_4181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_left;
     BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output := BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1110_c11_d00e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c6_e899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_8b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_a74c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1122_c31_d8a5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output := CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c6_e899_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_425d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1087_c11_f83e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_ccb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_51de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_0260_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_a74c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_330d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1110_c11_d00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1119_c11_4181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_8b23_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1088_l1103_l1096_l1111_DUPLICATE_fc80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1087_l1110_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_6636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1119_l1087_l1110_l1084_l1107_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a384_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_06d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1124_l1092_DUPLICATE_a2ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1119_l1087_l1084_l1107_l1079_l1102_l1099_l1095_l1092_DUPLICATE_312e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1119_c7_974a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1114_c30_6742_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1122_c21_4638] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c21_4638_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1122_c31_d8a5_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1096_c3_f89d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_left;
     BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output := BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1111_c3_2d04] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_left;
     BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output := BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_224b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_224b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1096_c3_f89d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1111_c3_2d04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1122_c21_4638_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1089_l1104_DUPLICATE_496d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_224b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_224b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1112_c11_33e3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_left;
     BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output := BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1119_c7_974a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1119_c7_974a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1117_c21_3103] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1117_c21_3103_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1112_c11_33e3_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1117_c21_3103_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- t16_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1110_c7_d61e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- n16_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1110_c7_d61e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- n16_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_b781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output := result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;

     -- t16_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_b781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1102_c7_7d11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- t16_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- n16_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1102_c7_7d11_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_f414] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output := result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_f414_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1095_c7_cfc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1095_c7_cfc2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_7133] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output := result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_7133_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1087_c7_cf3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1087_c7_cf3f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_797f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_797f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1079_c2_6abe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1129_l1075_DUPLICATE_14a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1129_l1075_DUPLICATE_14a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c2_6abe_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1129_l1075_DUPLICATE_14a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1129_l1075_DUPLICATE_14a2_return_output;
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
