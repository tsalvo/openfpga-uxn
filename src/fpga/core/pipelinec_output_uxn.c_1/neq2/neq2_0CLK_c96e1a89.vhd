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
entity neq2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_c96e1a89;
architecture arch of neq2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1355_c6_a7f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1355_c1_0012]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1355_c2_97c3]
signal n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1356_c3_381b[uxn_opcodes_h_l1356_c3_381b]
signal printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_e74c]
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1360_c7_2918]
signal t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_2918]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1360_c7_2918]
signal n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_689d]
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1363_c7_2796]
signal t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_2796]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1363_c7_2796]
signal n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1368_c11_cb8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1368_c7_597d]
signal t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c7_597d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1368_c7_597d]
signal n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_3038]
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1371_c7_a99a]
signal n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1372_c3_697a]
signal BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_ed2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1375_c7_76d1]
signal n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_08f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1378_c7_5b26]
signal n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_30cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c7_3963]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1383_c7_3963]
signal n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1386_c11_a04e]
signal BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1386_c7_aadd]
signal n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1387_c3_2edd]
signal BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1389_c30_226c]
signal sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1392_c21_6a02]
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1392_c21_4e78]
signal MUX_uxn_opcodes_h_l1392_c21_4e78_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1392_c21_4e78_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1394_c11_a445]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c7_ba4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1394_c7_ba4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c7_ba4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9
BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output);

-- t16_MUX_uxn_opcodes_h_l1355_c2_97c3
t16_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3
result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- n16_MUX_uxn_opcodes_h_l1355_c2_97c3
n16_MUX_uxn_opcodes_h_l1355_c2_97c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond,
n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue,
n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse,
n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

-- printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b
printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b : entity work.printf_uxn_opcodes_h_l1356_c3_381b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output);

-- t16_MUX_uxn_opcodes_h_l1360_c7_2918
t16_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918
result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- n16_MUX_uxn_opcodes_h_l1360_c7_2918
n16_MUX_uxn_opcodes_h_l1360_c7_2918 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond,
n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue,
n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse,
n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output);

-- t16_MUX_uxn_opcodes_h_l1363_c7_2796
t16_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- n16_MUX_uxn_opcodes_h_l1363_c7_2796
n16_MUX_uxn_opcodes_h_l1363_c7_2796 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond,
n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue,
n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse,
n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output);

-- t16_MUX_uxn_opcodes_h_l1368_c7_597d
t16_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d
result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- n16_MUX_uxn_opcodes_h_l1368_c7_597d
n16_MUX_uxn_opcodes_h_l1368_c7_597d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond,
n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue,
n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse,
n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output);

-- t16_MUX_uxn_opcodes_h_l1371_c7_a99a
t16_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a
result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- n16_MUX_uxn_opcodes_h_l1371_c7_a99a
n16_MUX_uxn_opcodes_h_l1371_c7_a99a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond,
n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue,
n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse,
n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a
BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left,
BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right,
BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1375_c7_76d1
n16_MUX_uxn_opcodes_h_l1375_c7_76d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond,
n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue,
n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse,
n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- n16_MUX_uxn_opcodes_h_l1378_c7_5b26
n16_MUX_uxn_opcodes_h_l1378_c7_5b26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond,
n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue,
n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse,
n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- n16_MUX_uxn_opcodes_h_l1383_c7_3963
n16_MUX_uxn_opcodes_h_l1383_c7_3963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond,
n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue,
n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse,
n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e
BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left,
BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right,
BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd
result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd
result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd
result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd
result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- n16_MUX_uxn_opcodes_h_l1386_c7_aadd
n16_MUX_uxn_opcodes_h_l1386_c7_aadd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond,
n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue,
n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse,
n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd
BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left,
BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right,
BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1389_c30_226c
sp_relative_shift_uxn_opcodes_h_l1389_c30_226c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins,
sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x,
sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y,
sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02
BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left,
BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right,
BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output);

-- MUX_uxn_opcodes_h_l1392_c21_4e78
MUX_uxn_opcodes_h_l1392_c21_4e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1392_c21_4e78_cond,
MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue,
MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse,
MUX_uxn_opcodes_h_l1392_c21_4e78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445
BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b
result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97
CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output,
 t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output,
 t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output,
 t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output,
 t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output,
 t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output,
 MUX_uxn_opcodes_h_l1392_c21_4e78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1357_c3_69f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_f9ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_6b17 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1369_c3_b131 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1373_c3_8e42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_aeb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_ef84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_871c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_4e5c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1386_c7_aadd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1400_l1351_DUPLICATE_f73a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_6b17 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_6b17;
     VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1357_c3_69f4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1357_c3_69f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1369_c3_b131 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1369_c3_b131;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_aeb5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_aeb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_ef84 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_ef84;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1373_c3_8e42 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1373_c3_8e42;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_4e5c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_4e5c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_f9ce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_f9ce;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_871c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1384_c3_871c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_08f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1386_c11_a04e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1386_c7_aadd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c11_a445] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1389_c30_226c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_ins;
     sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_x;
     sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output := sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1368_c11_cb8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_e74c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_689d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1355_c6_a7f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_3038] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_left;
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output := BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_ed2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_30cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c6_a7f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_e74c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_689d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_cb8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_3038_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_ed2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_08f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_30cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1386_c11_a04e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c11_a445_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1364_l1387_l1379_l1372_DUPLICATE_06ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_abad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1378_l1375_l1371_l1368_l1394_DUPLICATE_9fb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_8a71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1363_l1360_l1383_l1355_l1378_l1375_l1371_l1368_l1394_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1363_l1386_l1360_l1383_l1355_l1378_l1375_l1371_l1368_DUPLICATE_24a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1389_c30_226c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1394_c7_ba4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c7_ba4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1387_c3_2edd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_left;
     BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output := BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1372_c3_697a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_left;
     BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output := BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1355_c1_0012] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c7_ba4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1372_c3_697a_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1387_c3_2edd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1380_l1365_DUPLICATE_9b97_return_output;
     VAR_printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1355_c1_0012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c7_ba4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- printf_uxn_opcodes_h_l1356_c3_381b[uxn_opcodes_h_l1356_c3_381b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1356_c3_381b_uxn_opcodes_h_l1356_c3_381b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1392_c21_6a02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c21_6a02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     -- t16_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- n16_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- MUX[uxn_opcodes_h_l1392_c21_4e78] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1392_c21_4e78_cond <= VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_cond;
     MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue <= VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iftrue;
     MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse <= VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_return_output := MUX_uxn_opcodes_h_l1392_c21_4e78_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue := VAR_MUX_uxn_opcodes_h_l1392_c21_4e78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- t16_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- n16_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1386_c7_aadd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1386_c7_aadd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1383_c7_3963] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output := result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;

     -- n16_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1383_c7_3963_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_5b26] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output := result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_5b26_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1375_c7_76d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1375_c7_76d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1371_c7_a99a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- n16_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1371_c7_a99a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1368_c7_597d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- n16_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1368_c7_597d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_2796] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output := result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_2796_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1360_c7_2918] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output := result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1360_c7_2918_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1355_c2_97c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1400_l1351_DUPLICATE_f73a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1400_l1351_DUPLICATE_f73a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c2_97c3_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1400_l1351_DUPLICATE_f73a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1400_l1351_DUPLICATE_f73a_return_output;
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
