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
entity eor2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_f74041be;
architecture arch of eor2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_18ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_421c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_ed02]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_3368[uxn_opcodes_h_l1068_c3_3368]
signal printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_c8f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_62e3]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_6ded]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1075_c7_3568]
signal n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_3568]
signal t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_3568]
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_3568]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_9b42]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1080_c7_0c22]
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1081_c3_6abe]
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_e165]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_a936]
signal n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_a936]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_a936]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_9259]
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1088_c7_dca2]
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1089_c3_c334]
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_6dd5]
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1092_c30_7203]
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_ca37]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_80d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_80d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_80d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_80d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_80d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1100_c31_ae38]
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_12bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_61eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_61eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c2_ed02
n16_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_ed02
t16_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02
tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

-- printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368
printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368 : entity work.printf_uxn_opcodes_h_l1068_c3_3368_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c7_62e3
n16_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c7_62e3
t16_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3
tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output);

-- n16_MUX_uxn_opcodes_h_l1075_c7_3568
n16_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_3568
t16_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_3568
tmp16_MUX_uxn_opcodes_h_l1075_c7_3568 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output);

-- n16_MUX_uxn_opcodes_h_l1080_c7_0c22
n16_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- t16_MUX_uxn_opcodes_h_l1080_c7_0c22
t16_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22
tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond,
tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue,
tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse,
tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe
BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_a936
n16_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_a936
tmp16_MUX_uxn_opcodes_h_l1084_c7_a936 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output);

-- n16_MUX_uxn_opcodes_h_l1088_c7_dca2
n16_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2
tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond,
tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334
BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1092_c30_7203
sp_relative_shift_uxn_opcodes_h_l1092_c30_7203 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins,
sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x,
sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y,
sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38
CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x,
CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output,
 n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output,
 n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output,
 n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_d69a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_ea24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ee83 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_f380 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_e5e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_ec47_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_4592 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_0902_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_6cc2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1107_l1063_DUPLICATE_7e33_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_4592 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_4592;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_f380 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_f380;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_ea24 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_ea24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_d69a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_d69a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_e5e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_e5e6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ee83 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ee83;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1092_c30_7203] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_ins;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_x;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output := sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_9b42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_6cc2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_6cc2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_18ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1100_c31_ae38] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output := CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_c8f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_9259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_left;
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output := BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_6ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_ca37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_e165] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_12bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_18ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_c8f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_6ded_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_9b42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_e165_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_9259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_ca37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_12bd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1089_l1085_DUPLICATE_d78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1072_l1067_l1088_l1084_l1080_l1075_DUPLICATE_f430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1102_l1097_l1088_l1084_l1080_l1075_DUPLICATE_104f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_d9f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1102_l1067_l1097_l1084_l1080_l1075_DUPLICATE_c6a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_6cc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_6cc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1072_l1067_l1097_l1084_l1080_l1075_DUPLICATE_4f43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_7203_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1081_c3_6abe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_left;
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output := BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_61eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_80d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1100_c21_0902] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_0902_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_ae38_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_61eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1089_c3_c334] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_left;
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output := BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_80d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_421c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_6abe_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_c334_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_0902_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_f445_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_421c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_61eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- t16_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_80d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_80d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_80d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_6dd5] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_left;
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output := BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output;

     -- printf_uxn_opcodes_h_l1068_c3_3368[uxn_opcodes_h_l1068_c3_3368] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_3368_uxn_opcodes_h_l1068_c3_3368_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_80d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1095_c21_ec47] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_ec47_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_6dd5_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- n16_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_ec47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_dca2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- n16_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_dca2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     -- t16_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_a936] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_a936_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_0c22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output := result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- n16_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_0c22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_3568] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output := result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_3568_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_62e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_62e3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_ed02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1107_l1063_DUPLICATE_7e33 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1107_l1063_DUPLICATE_7e33_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_ed02_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1107_l1063_DUPLICATE_7e33_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1107_l1063_DUPLICATE_7e33_return_output;
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
