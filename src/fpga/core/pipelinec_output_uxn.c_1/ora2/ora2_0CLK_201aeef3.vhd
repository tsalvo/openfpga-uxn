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
entity ora2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_201aeef3;
architecture arch of ora2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1135_c6_2c93]
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1135_c1_8715]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1135_c2_46b0]
signal tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1136_c3_49e3[uxn_opcodes_h_l1136_c3_49e3]
signal printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_a592]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_9409]
signal n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1141_c7_9409]
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1141_c7_9409]
signal t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_9409]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_94f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1144_c7_443c]
signal n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1144_c7_443c]
signal result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1144_c7_443c]
signal t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1144_c7_443c]
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_5025]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1149_c7_aa79]
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1152_c11_e7d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1152_c7_90e8]
signal tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1153_c3_e0c0]
signal BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_684b]
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1156_c7_bfe1]
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_c5ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1159_c7_8e83]
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_acdd]
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1164_c7_02cd]
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_5b63]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1167_c7_cfd4]
signal tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1168_c3_6eb5]
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1169_c11_3ed0]
signal BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1172_c32_0382]
signal BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1172_c32_0192]
signal BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1172_c32_8312]
signal MUX_uxn_opcodes_h_l1172_c32_8312_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1172_c32_8312_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1172_c32_8312_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1172_c32_8312_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_731e]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_0d66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_0d66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_0d66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_0d66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1174_c7_0d66]
signal result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_db5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_0cc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_0cc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_0cc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_0cc1]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1182_c34_3e0e]
signal CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1184_c11_25f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1184_c7_088a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1184_c7_088a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93
BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left,
BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right,
BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output);

-- n16_MUX_uxn_opcodes_h_l1135_c2_46b0
n16_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0
result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0
result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1135_c2_46b0
t16_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0
tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond,
tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

-- printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3
printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3 : entity work.printf_uxn_opcodes_h_l1136_c3_49e3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_9409
n16_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- t16_MUX_uxn_opcodes_h_l1141_c7_9409
t16_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_9409
tmp16_MUX_uxn_opcodes_h_l1141_c7_9409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output);

-- n16_MUX_uxn_opcodes_h_l1144_c7_443c
n16_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c
result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c
result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c
result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- t16_MUX_uxn_opcodes_h_l1144_c7_443c
t16_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1144_c7_443c
tmp16_MUX_uxn_opcodes_h_l1144_c7_443c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond,
tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output);

-- n16_MUX_uxn_opcodes_h_l1149_c7_aa79
n16_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- t16_MUX_uxn_opcodes_h_l1149_c7_aa79
t16_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79
tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond,
tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue,
tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse,
tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1
BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1152_c7_90e8
n16_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8
result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8
result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- t16_MUX_uxn_opcodes_h_l1152_c7_90e8
t16_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8
tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond,
tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0
BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left,
BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right,
BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output);

-- n16_MUX_uxn_opcodes_h_l1156_c7_bfe1
n16_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1
tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond,
tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_8e83
n16_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83
result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83
result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83
tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond,
tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue,
tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse,
tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output);

-- n16_MUX_uxn_opcodes_h_l1164_c7_02cd
n16_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd
tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond,
tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output);

-- n16_MUX_uxn_opcodes_h_l1167_c7_cfd4
n16_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4
tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond,
tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5
BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0
BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left,
BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right,
BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382
BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left,
BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right,
BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192
BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left,
BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right,
BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output);

-- MUX_uxn_opcodes_h_l1172_c32_8312
MUX_uxn_opcodes_h_l1172_c32_8312 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1172_c32_8312_cond,
MUX_uxn_opcodes_h_l1172_c32_8312_iftrue,
MUX_uxn_opcodes_h_l1172_c32_8312_iffalse,
MUX_uxn_opcodes_h_l1172_c32_8312_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66
result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond,
result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e
CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x,
CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output,
 n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output,
 n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output,
 n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output,
 n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output,
 n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output,
 n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output,
 n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output,
 MUX_uxn_opcodes_h_l1172_c32_8312_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_c1ff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_f63a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_5b10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_4f23 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_6bc5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_28e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_a9ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_a538 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1172_c32_8312_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1172_c32_8312_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_5323 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1178_c24_fdec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1181_c3_8cfd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1182_c24_8d84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1180_l1167_DUPLICATE_ab5b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1189_l1131_DUPLICATE_7bfa_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_4f23 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_4f23;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_5b10 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_5b10;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_f63a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_f63a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1181_c3_8cfd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1181_c3_8cfd;
     VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_6bc5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_6bc5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_28e7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_28e7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_5323 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1177_c3_5323;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_a538 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_a538;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_a9ec := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_a9ec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_c1ff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_c1ff;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_731e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1184_c11_25f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_94f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_5b63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1172_c32_0382] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_left;
     BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output := BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_acdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1178_c24_fdec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1178_c24_fdec_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l1182_c34_3e0e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output := CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_a592] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_5025] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1152_c11_e7d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1135_c6_2c93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_db5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_c5ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1180_l1167_DUPLICATE_ab5b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1180_l1167_DUPLICATE_ab5b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_684b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1172_c32_0382_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c6_2c93_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_a592_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_94f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_5025_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c11_e7d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_684b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c5ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_acdd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5b63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_731e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_db5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1184_c11_25f3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1153_l1168_l1145_l1160_DUPLICATE_63e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1178_c24_fdec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_fdaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1184_l1152_l1180_l1149_l1174_l1144_l1167_DUPLICATE_8729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1149_l1174_l1144_DUPLICATE_b90b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1141_l1164_l1159_l1156_l1152_l1149_l1144_l1167_DUPLICATE_382a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1184_l1152_l1180_l1149_l1144_l1167_DUPLICATE_33f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1180_l1167_DUPLICATE_ab5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1180_l1167_DUPLICATE_ab5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1141_l1164_l1135_l1159_l1156_l1152_l1180_l1149_l1144_l1167_DUPLICATE_3b56_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_0d66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1153_c3_e0c0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_left;
     BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output := BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1172_c32_0192] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_left;
     BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output := BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_0cc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1184_c7_088a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1168_c3_6eb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_left;
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output := BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1184_c7_088a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1182_c24_8d84] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1182_c24_8d84_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1182_c34_3e0e_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1135_c1_8715] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1172_c32_8312_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1172_c32_0192_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1153_c3_e0c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_6eb5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1182_c24_8d84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1146_DUPLICATE_c080_return_output;
     VAR_printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1135_c1_8715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1184_c7_088a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1184_c7_088a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1169_c11_3ed0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_left;
     BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output := BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_0cc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_0d66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_0cc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_0cc1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;

     -- printf_uxn_opcodes_h_l1136_c3_49e3[uxn_opcodes_h_l1136_c3_49e3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1136_c3_49e3_uxn_opcodes_h_l1136_c3_49e3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- MUX[uxn_opcodes_h_l1172_c32_8312] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1172_c32_8312_cond <= VAR_MUX_uxn_opcodes_h_l1172_c32_8312_cond;
     MUX_uxn_opcodes_h_l1172_c32_8312_iftrue <= VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iftrue;
     MUX_uxn_opcodes_h_l1172_c32_8312_iffalse <= VAR_MUX_uxn_opcodes_h_l1172_c32_8312_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1172_c32_8312_return_output := MUX_uxn_opcodes_h_l1172_c32_8312_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1169_c11_3ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue := VAR_MUX_uxn_opcodes_h_l1172_c32_8312_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_0cc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_0d66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_0d66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;

     -- n16_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1174_c7_0d66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output := result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- t16_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1174_c7_0d66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_cfd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_cfd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_02cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_02cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     -- n16_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_8e83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1159_c7_8e83_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_bfe1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_bfe1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1152_c7_90e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c7_90e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     -- n16_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_aa79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output := result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_aa79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_443c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1144_c7_443c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_9409] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1141_c7_9409_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1135_c2_46b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1189_l1131_DUPLICATE_7bfa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1189_l1131_DUPLICATE_7bfa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1135_c2_46b0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1189_l1131_DUPLICATE_7bfa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1189_l1131_DUPLICATE_7bfa_return_output;
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
