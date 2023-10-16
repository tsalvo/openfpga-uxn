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
entity lth2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_c96e1a89;
architecture arch of lth2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2040_c6_62e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_43ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2040_c2_7aac]
signal t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2041_c3_0c46[uxn_opcodes_h_l2041_c3_0c46]
signal printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_16c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2045_c7_74ef]
signal t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_db84]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c7_0bd0]
signal t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_016f]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2053_c7_c7f9]
signal t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_705b]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2056_c7_35b2]
signal t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2057_c3_e828]
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_8dbc]
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2060_c7_5781]
signal n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2060_c7_5781]
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_31c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_0fdc]
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_1a14]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_f95b]
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_9f51]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_9f52]
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2072_c3_8741]
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2074_c30_3cfc]
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2077_c21_5441]
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2077_c21_a3b7]
signal MUX_uxn_opcodes_h_l2077_c21_a3b7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_b63e]
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2079_c7_51c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2079_c7_51c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2079_c7_51c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output);

-- n16_MUX_uxn_opcodes_h_l2040_c2_7aac
n16_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- t16_MUX_uxn_opcodes_h_l2040_c2_7aac
t16_MUX_uxn_opcodes_h_l2040_c2_7aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond,
t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue,
t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse,
t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

-- printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46
printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46 : entity work.printf_uxn_opcodes_h_l2041_c3_0c46_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output);

-- n16_MUX_uxn_opcodes_h_l2045_c7_74ef
n16_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- t16_MUX_uxn_opcodes_h_l2045_c7_74ef
t16_MUX_uxn_opcodes_h_l2045_c7_74ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond,
t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue,
t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse,
t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output);

-- n16_MUX_uxn_opcodes_h_l2048_c7_0bd0
n16_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c7_0bd0
t16_MUX_uxn_opcodes_h_l2048_c7_0bd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond,
t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output);

-- n16_MUX_uxn_opcodes_h_l2053_c7_c7f9
n16_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- t16_MUX_uxn_opcodes_h_l2053_c7_c7f9
t16_MUX_uxn_opcodes_h_l2053_c7_c7f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond,
t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue,
t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse,
t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output);

-- n16_MUX_uxn_opcodes_h_l2056_c7_35b2
n16_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- t16_MUX_uxn_opcodes_h_l2056_c7_35b2
t16_MUX_uxn_opcodes_h_l2056_c7_35b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond,
t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue,
t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse,
t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output);

-- n16_MUX_uxn_opcodes_h_l2060_c7_5781
n16_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output);

-- n16_MUX_uxn_opcodes_h_l2063_c7_0fdc
n16_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output);

-- n16_MUX_uxn_opcodes_h_l2068_c7_f95b
n16_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output);

-- n16_MUX_uxn_opcodes_h_l2071_c7_9f52
n16_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741
BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left,
BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right,
BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc
sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins,
sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x,
sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y,
sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441
BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left,
BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right,
BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output);

-- MUX_uxn_opcodes_h_l2077_c21_a3b7
MUX_uxn_opcodes_h_l2077_c21_a3b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2077_c21_a3b7_cond,
MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue,
MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse,
MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output,
 n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output,
 n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output,
 n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output,
 n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output,
 n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output,
 n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output,
 n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output,
 n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output,
 n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output,
 sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output,
 MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_08a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_e2bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_2dae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_942d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_1526 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_c2c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_0f59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_868c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_4b9d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_9f52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2036_l2085_DUPLICATE_9be2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_c2c1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_c2c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_0f59 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_0f59;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_868c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_868c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_08a5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_08a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_942d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_942d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_2dae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_2dae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_4b9d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_4b9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_e2bf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_e2bf;
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_1526 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_1526;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_31c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_8dbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_016f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_9f52_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_9f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_b63e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_db84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2074_c30_3cfc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_ins;
     sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_x;
     sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output := sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_705b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c6_62e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_16c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_1a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_62e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_16c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_db84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_016f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_705b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_8dbc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_31c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_1a14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_9f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_b63e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2064_l2057_l2049_l2072_DUPLICATE_c50c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_696b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2063_l2060_l2056_l2053_l2079_l2048_l2071_l2045_DUPLICATE_948c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_819c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2079_l2048_l2045_DUPLICATE_b244_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2068_l2040_l2063_l2060_l2056_l2053_l2048_l2071_l2045_DUPLICATE_5b8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_3cfc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2079_c7_51c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2079_c7_51c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2072_c3_8741] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_left;
     BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output := BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2079_c7_51c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2057_c3_e828] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_left;
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output := BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_43ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e828_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_8741_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2050_l2065_DUPLICATE_7c2d_return_output;
     VAR_printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_43ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_51c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2077_c21_5441] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_left;
     BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output := BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- printf_uxn_opcodes_h_l2041_c3_0c46[uxn_opcodes_h_l2041_c3_0c46] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2041_c3_0c46_uxn_opcodes_h_l2041_c3_0c46_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_5441_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     -- n16_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- MUX[uxn_opcodes_h_l2077_c21_a3b7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2077_c21_a3b7_cond <= VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_cond;
     MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue <= VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iftrue;
     MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse <= VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output := MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue := VAR_MUX_uxn_opcodes_h_l2077_c21_a3b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_9f52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_9f52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_f95b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- n16_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_f95b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_0fdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_0fdc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2060_c7_5781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output := result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_5781_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_35b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_35b2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_c7f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_c7f9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- n16_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_0bd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_0bd0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2045_c7_74ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_74ef_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c2_7aac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2036_l2085_DUPLICATE_9be2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2036_l2085_DUPLICATE_9be2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_7aac_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2036_l2085_DUPLICATE_9be2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2036_l2085_DUPLICATE_9be2_return_output;
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
