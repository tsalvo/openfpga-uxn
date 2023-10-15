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
-- Submodules: 112
entity and2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_c89b169c;
architecture arch of and2_0CLK_c89b169c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_7a42]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1000_c2_8cf3]
signal n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_7cec]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_ecc2]
signal n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_92de]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1008_c7_224e]
signal t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1008_c7_224e]
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_224e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1008_c7_224e]
signal n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_36b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1013_c7_1353]
signal t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1013_c7_1353]
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_1353]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1013_c7_1353]
signal n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_80fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1016_c7_e4c3]
signal n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1017_c3_4499]
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9cdd]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1020_c7_5c6b]
signal n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_5cc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_e388]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e388]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1023_c7_e388]
signal n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_4163]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1028_c7_3a8e]
signal n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_28cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1031_c7_c114]
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_c114]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1031_c7_c114]
signal n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1032_c3_8ed7]
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1033_c11_c723]
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1035_c32_866b]
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1035_c32_219e]
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1035_c32_a6eb]
signal MUX_uxn_opcodes_h_l1035_c32_a6eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_d4cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_4ad8]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_4ad8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_4ad8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_4ad8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_4ad8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_28d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_1f67]
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_1f67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_1f67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_1f67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1045_c34_cf3e]
signal CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_96fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_e764]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_e764]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output);

-- t16_MUX_uxn_opcodes_h_l1000_c2_8cf3
t16_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3
tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- n16_MUX_uxn_opcodes_h_l1000_c2_8cf3
n16_MUX_uxn_opcodes_h_l1000_c2_8cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond,
n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue,
n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse,
n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output);

-- t16_MUX_uxn_opcodes_h_l1005_c7_ecc2
t16_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2
tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_ecc2
n16_MUX_uxn_opcodes_h_l1005_c7_ecc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output);

-- t16_MUX_uxn_opcodes_h_l1008_c7_224e
t16_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1008_c7_224e
tmp16_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- n16_MUX_uxn_opcodes_h_l1008_c7_224e
n16_MUX_uxn_opcodes_h_l1008_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond,
n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue,
n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse,
n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1013_c7_1353
t16_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1013_c7_1353
tmp16_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- n16_MUX_uxn_opcodes_h_l1013_c7_1353
n16_MUX_uxn_opcodes_h_l1013_c7_1353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond,
n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue,
n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse,
n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output);

-- t16_MUX_uxn_opcodes_h_l1016_c7_e4c3
t16_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3
tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- n16_MUX_uxn_opcodes_h_l1016_c7_e4c3
n16_MUX_uxn_opcodes_h_l1016_c7_e4c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond,
n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue,
n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse,
n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499
BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left,
BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right,
BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b
tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- n16_MUX_uxn_opcodes_h_l1020_c7_5c6b
n16_MUX_uxn_opcodes_h_l1020_c7_5c6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond,
n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue,
n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse,
n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_e388
tmp16_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- n16_MUX_uxn_opcodes_h_l1023_c7_e388
n16_MUX_uxn_opcodes_h_l1023_c7_e388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond,
n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue,
n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse,
n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e
tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- n16_MUX_uxn_opcodes_h_l1028_c7_3a8e
n16_MUX_uxn_opcodes_h_l1028_c7_3a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond,
n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue,
n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse,
n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1031_c7_c114
tmp16_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- n16_MUX_uxn_opcodes_h_l1031_c7_c114
n16_MUX_uxn_opcodes_h_l1031_c7_c114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond,
n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue,
n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse,
n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7
BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723
BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left,
BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right,
BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b
BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left,
BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right,
BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e
BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left,
BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right,
BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output);

-- MUX_uxn_opcodes_h_l1035_c32_a6eb
MUX_uxn_opcodes_h_l1035_c32_a6eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1035_c32_a6eb_cond,
MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue,
MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse,
MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e
CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x,
CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31
CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output,
 t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output,
 t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output,
 t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output,
 t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output,
 t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output,
 tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output,
 MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output,
 CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_f461 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_a5d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_cc85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_e853 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_a16f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_52ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_eba7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_4e4d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_b539 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_0420_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7214 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_2712_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_3684_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1052_l996_DUPLICATE_88ee_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7214 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7214;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_cc85 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_cc85;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_a5d8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_a5d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_e853 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_e853;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_4e4d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_4e4d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_52ca := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_52ca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_eba7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_eba7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_f461 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_f461;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_b539 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_b539;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_a16f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_a16f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right := to_unsigned(5, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1045_c34_cf3e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output := CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_36b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_d4cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_28d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9cdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_28cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_7a42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_96fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1041_c24_0420] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_0420_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_92de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1035_c32_866b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_left;
     BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output := BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_3684 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_3684_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_4163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_5cc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_80fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_7cec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_866b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_7a42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_7cec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_92de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_36b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_80fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9cdd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_5cc1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_4163_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_28cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_d4cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_28d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_96fa_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1032_l1024_l1017_DUPLICATE_80a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_0420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1008_l1031_l1005_l1028_DUPLICATE_265b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1023_l1020_l1047_l1016_l1043_l1013_l1037_l1008_l1031_l1005_l1028_DUPLICATE_dadc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1013_l1037_l1008_l1005_l1028_DUPLICATE_6dda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1047_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_60f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_3684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_3684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1000_l1023_l1020_l1016_l1043_l1013_l1008_l1031_l1005_l1028_DUPLICATE_145d_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1045_c24_2712] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_2712_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_cf3e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_e764] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1017_c3_4499] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_left;
     BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output := BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1032_c3_8ed7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_left;
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output := BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_1f67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1035_c32_219e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_left;
     BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output := BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_e764] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_4ad8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_219e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_4499_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_8ed7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_2712_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1025_l1010_DUPLICATE_0c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_e764_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_e764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;
     -- n16_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1033_c11_c723] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_left;
     BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output := BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output;

     -- MUX[uxn_opcodes_h_l1035_c32_a6eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1035_c32_a6eb_cond <= VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_cond;
     MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue <= VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iftrue;
     MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse <= VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output := MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_1f67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_4ad8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- t16_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_1f67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_1f67] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output := result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_c723_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue := VAR_MUX_uxn_opcodes_h_l1035_c32_a6eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_1f67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- n16_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_4ad8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_4ad8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_4ad8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_4ad8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_c114] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;

     -- n16_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_c114_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_3a8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- n16_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_3a8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- t16_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e388] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;

     -- n16_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_e388_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_5c6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_5c6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_e4c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_e4c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- n16_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_1353] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output := result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_1353_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1008_c7_224e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_224e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1005_c7_ecc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_ecc2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1000_c2_8cf3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1052_l996_DUPLICATE_88ee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1052_l996_DUPLICATE_88ee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_8cf3_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1052_l996_DUPLICATE_88ee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1052_l996_DUPLICATE_88ee_return_output;
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
