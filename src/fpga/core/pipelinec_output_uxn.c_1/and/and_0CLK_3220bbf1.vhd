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
-- Submodules: 59
entity and_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_3220bbf1;
architecture arch of and_0CLK_3220bbf1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l958_c6_7cc0]
signal BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l958_c1_08fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l958_c2_7006]
signal t8_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c2_7006]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l958_c2_7006]
signal n8_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l959_c3_7297[uxn_opcodes_h_l959_c3_7297]
signal printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l963_c11_eb20]
signal BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l963_c7_a1b4]
signal n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l966_c11_ffa0]
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l966_c7_a4e8]
signal n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l970_c11_e9aa]
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l970_c7_d9c8]
signal n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l973_c11_ee42]
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l973_c7_9b90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l973_c7_9b90]
signal n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l976_c32_4101]
signal BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l976_c32_69fe]
signal BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l976_c32_f9eb]
signal MUX_uxn_opcodes_h_l976_c32_f9eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l976_c32_f9eb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l978_c11_5e7f]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_5d76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_5d76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_5d76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l978_c7_5d76]
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l978_c7_5d76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l982_c24_e39c]
signal BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l984_c11_e46b]
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_7af5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_7af5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0
BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left,
BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right,
BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output);

-- t8_MUX_uxn_opcodes_h_l958_c2_7006
t8_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l958_c2_7006_cond,
t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006
result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006
result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006
result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- n8_MUX_uxn_opcodes_h_l958_c2_7006
n8_MUX_uxn_opcodes_h_l958_c2_7006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l958_c2_7006_cond,
n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue,
n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse,
n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

-- printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297
printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297 : entity work.printf_uxn_opcodes_h_l959_c3_7297_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20
BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left,
BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right,
BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output);

-- t8_MUX_uxn_opcodes_h_l963_c7_a1b4
t8_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4
result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4
result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4
result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4
result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- n8_MUX_uxn_opcodes_h_l963_c7_a1b4
n8_MUX_uxn_opcodes_h_l963_c7_a1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond,
n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue,
n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse,
n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0
BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output);

-- t8_MUX_uxn_opcodes_h_l966_c7_a4e8
t8_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8
result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- n8_MUX_uxn_opcodes_h_l966_c7_a4e8
n8_MUX_uxn_opcodes_h_l966_c7_a4e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond,
n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue,
n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse,
n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa
BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8
result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- n8_MUX_uxn_opcodes_h_l970_c7_d9c8
n8_MUX_uxn_opcodes_h_l970_c7_d9c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond,
n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue,
n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse,
n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42
BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left,
BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right,
BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90
result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90
result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- n8_MUX_uxn_opcodes_h_l973_c7_9b90
n8_MUX_uxn_opcodes_h_l973_c7_9b90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond,
n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue,
n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse,
n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l976_c32_4101
BIN_OP_AND_uxn_opcodes_h_l976_c32_4101 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left,
BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right,
BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe
BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left,
BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right,
BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output);

-- MUX_uxn_opcodes_h_l976_c32_f9eb
MUX_uxn_opcodes_h_l976_c32_f9eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l976_c32_f9eb_cond,
MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue,
MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse,
MUX_uxn_opcodes_h_l976_c32_f9eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f
BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76
result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c
BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left,
BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right,
BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b
BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output,
 t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output,
 t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output,
 t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output,
 BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output,
 BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output,
 MUX_uxn_opcodes_h_l976_c32_f9eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output,
 BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_9736 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_2b7f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_6add : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_0179 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_223a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l973_l978_DUPLICATE_51bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l954_l989_DUPLICATE_fc7c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_9736 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_9736;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_0179 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_0179;
     VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_223a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_223a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_2b7f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_2b7f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_6add := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_6add;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l973_l978_DUPLICATE_51bb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l973_l978_DUPLICATE_51bb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l963_c11_eb20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_left;
     BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output := BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l966_c11_ffa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l958_c6_7cc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l970_c11_e9aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l982_c24_e39c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_left;
     BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output := BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l976_c32_4101] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_left;
     BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output := BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l984_c11_e46b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_left;
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output := BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l973_c11_ee42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_left;
     BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output := BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c11_5e7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left := VAR_BIN_OP_AND_uxn_opcodes_h_l976_c32_4101_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l982_c24_e39c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c6_7cc0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l963_c11_eb20_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_ffa0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_e9aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_ee42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_5e7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_e46b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l966_l963_l958_l973_l970_DUPLICATE_9cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l966_l963_l984_l978_l973_l970_DUPLICATE_da89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l966_l963_l958_l978_l970_DUPLICATE_38f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l966_l963_l958_l984_l973_l970_DUPLICATE_18e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l973_l978_DUPLICATE_51bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l973_l978_DUPLICATE_51bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l966_l963_l958_l978_l973_l970_DUPLICATE_aa54_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l958_c1_08fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_5d76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_7af5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output;

     -- n8_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_7af5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l978_c7_5d76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l976_c32_69fe] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_left;
     BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output := BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l978_c7_5d76] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_cond;
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output := result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l976_c32_69fe_return_output;
     VAR_printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l958_c1_08fe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_7af5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_7af5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_5d76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- printf_uxn_opcodes_h_l959_c3_7297[uxn_opcodes_h_l959_c3_7297] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l959_c3_7297_uxn_opcodes_h_l959_c3_7297_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l976_c32_f9eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l976_c32_f9eb_cond <= VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_cond;
     MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue <= VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iftrue;
     MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse <= VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_return_output := MUX_uxn_opcodes_h_l976_c32_f9eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_5d76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;

     -- t8_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue := VAR_MUX_uxn_opcodes_h_l976_c32_f9eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_5d76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_t8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- n8_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output := t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l973_c7_9b90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_9b90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l958_c2_7006_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- n8_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_d9c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_n8_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_d9c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- n8_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output := n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l966_c7_a4e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l958_c2_7006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_a4e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l963_c7_a1b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l963_c7_a1b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c2_7006] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l954_l989_DUPLICATE_fc7c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l954_l989_DUPLICATE_fc7c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c2_7006_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c2_7006_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l954_l989_DUPLICATE_fc7c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l954_l989_DUPLICATE_fc7c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
